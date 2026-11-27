// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/abstract_app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:app_finance/_configs/screen_helper.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_ext/date_time_ext.dart';
import 'package:app_finance/_ext/tags_ext.dart';
import 'package:app_finance/design/form/tags_input.dart';
import 'package:app_finance/design/generic/base_swipe_widget.dart';
import 'package:app_finance/design/wrapper/background_wrapper.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:app_finance/pages/bill/widgets/bill_line_widget.dart';
import 'package:app_finance/pages/bill/widgets/sliver_header_delegate.dart';
import 'package:material_ui/material_ui.dart';

class TagsPage extends StatefulWidget {
  final String? search;

  const TagsPage({super.key, this.search});

  @override
  TagsPageState createState() => TagsPageState();
}

class TagsPageState extends AbstractPageState<TagsPage> {
  late final ValueNotifier<List<String>> tags;

  @override
  void initState() {
    super.initState();
    final search = widget.search?.trim() ?? '';
    tags = ValueNotifier(search.isNotEmpty ? [search] : []);
    tags.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    tags.dispose();
    super.dispose();
  }

  @override
  String getTitle() => AppLocale.labels.tagsHeadline;

  @override
  String getButtonName() => '';

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) => ThemeHelper.emptyBox;

  static List<String> tagsOf(dynamic item) => switch (item) {
        BillAppData o => o.tags,
        InvoiceAppData o => o.tags,
        _ => const [],
      };

  List<AbstractAppData> getItems([Function? filter]) => [
        ...state.getStream<BillAppData>(AppDataType.bills, filter: filter).toList(),
        ...state.getStream<InvoiceAppData>(AppDataType.invoice, filter: filter).toList(),
      ].cast<AbstractAppData>();

  List<MapEntry<String, int>> getAvailableTags() {
    final scope = <String, int>{};
    for (final item in getItems((dynamic o) => tagsOf(o).isEmpty)) {
      for (final tag in tagsOf(item)) {
        scope[tag] = (scope[tag] ?? 0) + 1;
      }
    }
    return scope.entries.toList()..sort((a, b) => b.value != a.value ? b.value - a.value : a.key.compareTo(b.key));
  }

  List<AbstractAppData> getResults() {
    if (tags.value.isEmpty) return [];
    return getItems((dynamic o) => !tagsOf(o).hasTags(tags.value))..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  void toggle(String tag) {
    final value = tag.toLowerCase();
    final isSelected = tags.value.any((e) => e.toLowerCase() == value);
    tags.value = isSelected ? tags.value.where((e) => e.toLowerCase() != value).toList() : [...tags.value, tag];
  }

  Widget buildLine(AbstractAppData item, double width, int count) {
    if (item is BillAppData) {
      final account = state.getByUuid(item.account);
      final budget = state.getByUuid(item.category);
      return BaseSwipeWidget(
        routePath: AppRoute.billEditRoute,
        uuid: item.uuid!,
        child: BillLineWidget(
          uuid: item.uuid!,
          count: count,
          title: item.title,
          description: account != null ? '${account.title} (${account.description})' : '',
          descriptionColor: account?.color ?? Colors.transparent,
          details: '-${item.detailsFormatted}',
          progress: item.progress,
          color: budget?.color ?? Colors.transparent,
          icon: budget?.icon ?? Icons.radio_button_unchecked_sharp,
          iconTooltip: budget?.title ?? '?',
          hidden: item.hidden,
          width: width,
          route: AppRoute.billViewRoute,
        ),
      );
    }
    final invoice = item as InvoiceAppData;
    final account = state.getByUuid(invoice.account);
    final isTransfer = invoice.accountFrom != null;
    final color = (isTransfer ? account?.color : invoice.color) ?? Colors.transparent;
    return BaseSwipeWidget(
      routePath: AppRoute.invoiceEditRoute,
      uuid: invoice.uuid!,
      child: BillLineWidget(
        uuid: invoice.uuid!,
        count: count,
        title: invoice.title,
        description: isTransfer
            ? '${state.getByUuid(invoice.accountFrom!)?.title ?? '?'} => ${account?.title ?? '?'}'
            : (account != null ? '${account.title} (${account.description})' : ''),
        descriptionColor: account?.color ?? Colors.transparent,
        details: '${isTransfer ? '' : '+'}${invoice.detailsFormatted}',
        progress: invoice.progress,
        color: color,
        icon: account?.icon ?? Icons.radio_button_unchecked_sharp,
        iconTooltip: isTransfer ? AppLocale.labels.transfersHeadline : AppLocale.labels.invoiceHeadline,
        hidden: invoice.hidden,
        width: width,
        route: AppRoute.invoiceViewRoute,
      ),
    );
  }

  List<Widget> buildResults(List<AbstractAppData> results) {
    final width = ScreenHelper.state().width - ThemeHelper.getIndent(4);
    final count = ThemeHelper.getWidthCount(null, context);
    final groups = <String, List<AbstractAppData>>{};
    for (final item in results) {
      (groups[item.createdAt.yMEd()] ??= []).add(item);
    }
    return [
      for (final group in groups.entries)
        SliverMainAxisGroup(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverHeaderDelegate(group.key),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: ThemeHelper.getIndent(0.5)),
              sliver: SliverList.builder(
                itemCount: group.value.length,
                itemBuilder: (context, index) => BackgroundWrapper(
                  index: index,
                  child: buildLine(group.value[index], width, count),
                ),
              ),
            ),
          ],
        ),
    ];
  }

  Widget buildHeader(BuildContext context) {
    final available = getAvailableTags();
    final selected = tags.value.map((e) => e.toLowerCase()).toSet();
    final indent = ThemeHelper.getIndent(0.5);
    final colorScheme = context.colorScheme;
    return Column(
      crossAxisAlignment: AppDesign.getAlignment(),
      children: [
        TagsInput(
          title: AppLocale.labels.tags,
          tooltip: AppLocale.labels.tagsTooltip,
          controller: tags,
        ),
        if (available.isNotEmpty) ...[
          Wrap(
            spacing: indent,
            runSpacing: indent,
            children: [
              for (final tag in available)
                FilterChip(
                  key: ValueKey('tags_page_${tag.key}'),
                  label: Text('${tag.key} (${tag.value})'),
                  visualDensity: VisualDensity.compact,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  selected: selected.contains(tag.key.toLowerCase()),
                  color: WidgetStateProperty.resolveWith(
                    (states) => states.contains(WidgetState.selected)
                        ? colorScheme.inversePrimary
                        : colorScheme.fieldBackground,
                  ),
                  side: BorderSide(color: colorScheme.inversePrimary),
                  checkmarkColor: colorScheme.onSurface,
                  labelStyle: TextStyle(color: colorScheme.onSurface),
                  onSelected: (_) => toggle(tag.key),
                ),
            ],
          ),
          ThemeHelper.hIndent2x,
        ],
      ],
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final results = getResults();
    return Padding(
      padding: EdgeInsets.all(ThemeHelper.getIndent()),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: buildHeader(context)),
          if (tags.value.isNotEmpty && results.isEmpty)
            SliverToBoxAdapter(
              child: TextWrapper(AppLocale.labels.tagsEmpty, style: context.textTheme.bodyMedium),
            ),
          ...buildResults(results),
          const SliverToBoxAdapter(child: ThemeHelper.formEndBox),
        ],
      ),
    );
  }
}
