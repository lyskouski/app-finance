// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:async';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:fints/fints.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';

class FinTsDialogs {
  final BuildContext Function() context;

  const FinTsDialogs(this.context);

  BuildContext? get _context {
    final ctx = context();
    return ctx.mounted ? ctx : null;
  }

  Future<String?> askPin() async {
    final ctx = _context;
    if (ctx == null) {
      return null;
    }
    final pin = await showDialog<String>(
      context: ctx,
      barrierDismissible: false,
      builder: (_) => const FinTsPinDialog(),
    );
    return pin == null || pin.isEmpty ? null : pin;
  }

  Future<bool> confirm(String text) async {
    final ctx = _context;
    if (ctx == null) {
      return false;
    }
    final result = await showDialog<bool>(
      context: ctx,
      builder: (context) => AlertDialog(
        title: Text(AppLocale.labels.confirmHeader),
        content: Text(text),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(AppLocale.labels.closeTooltip)),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: Text(AppLocale.labels.ok)),
        ],
      ),
    );
    return result ?? false;
  }

  Future<TanMethod?> selectTanMethod(List<TanMethod> methods) => _select<TanMethod>(
        AppLocale.labels.finTsTanMethod,
        methods,
        (method) => method.name,
      );

  Future<TanMedium?> selectTanMedium(List<TanMedium> media) => _select<TanMedium>(
        AppLocale.labels.finTsTanMedium,
        media,
        (medium) => medium.name ?? medium.mobileNumberMasked ?? medium.cardNumber ?? medium.mediumClass,
      );

  Future<T?> _select<T>(String title, List<T> options, String Function(T) label) async {
    final ctx = _context;
    if (ctx == null) {
      return null;
    }
    return showDialog<T>(
      context: ctx,
      barrierDismissible: false,
      builder: (context) => SimpleDialog(
        title: Text(title),
        children: [
          for (final option in options)
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, option),
              child: Text(label(option)),
            ),
        ],
      ),
    );
  }

  Future<TanAnswer> askTan(TanChallenge challenge) async {
    final ctx = _context;
    if (ctx == null) {
      return TanAnswer.cancelled;
    }
    final answer = await showDialog<TanAnswer>(
      context: ctx,
      barrierDismissible: false,
      builder: (_) => FinTsTanDialog(challenge: challenge),
    );
    return answer ?? TanAnswer.cancelled;
  }
}

class FinTsPinDialog extends StatefulWidget {
  const FinTsPinDialog({super.key});

  @override
  FinTsPinDialogState createState() => FinTsPinDialogState();
}

class FinTsPinDialogState extends State<FinTsPinDialog> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocale.labels.finTsPin),
      content: TextField(
        key: const ValueKey('fints_pin'),
        controller: controller,
        obscureText: true,
        autofocus: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(helperText: AppLocale.labels.finTsPinHint, helperMaxLines: 2),
        onSubmitted: (value) => Navigator.pop(context, value),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text(AppLocale.labels.closeTooltip)),
        FilledButton(
          onPressed: () => Navigator.pop(context, controller.text),
          child: Text(AppLocale.labels.finTsConnect),
        ),
      ],
    );
  }
}

class FinTsTanDialog extends StatefulWidget {
  final TanChallenge challenge;

  const FinTsTanDialog({super.key, required this.challenge});

  @override
  FinTsTanDialogState createState() => FinTsTanDialogState();
}

class FinTsTanDialogState extends State<FinTsTanDialog> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.challenge.resolved?.then((_) {
      if (mounted) {
        Navigator.pop(context, TanAnswer.approved);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final challenge = widget.challenge;
    final method = challenge.method;
    final image = challenge.image;
    final flicker = challenge.flickerCode;
    return AlertDialog(
      title: Text(AppLocale.labels.finTsTanHeadline),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(method.name, style: context.textTheme.titleSmall),
            ThemeHelper.hIndent,
            if (challenge.plainMessage?.isNotEmpty == true) SelectableText(challenge.plainMessage!),
            if (image != null) ...[
              ThemeHelper.hIndent2x,
              Center(child: Image.memory(image.bytes, width: 240, fit: BoxFit.contain)),
            ],
            if (flicker != null) ...[
              ThemeHelper.hIndent2x,
              Center(child: FinTsFlickerCode(frames: flicker.frames())),
            ],
            ThemeHelper.hIndent2x,
            if (challenge.isDecoupled)
              const Center(child: CircularProgressIndicator())
            else
              TextField(
                key: const ValueKey('fints_tan'),
                controller: controller,
                autofocus: true,
                enableSuggestions: false,
                autocorrect: false,
                maxLength: method.maxTanLength,
                keyboardType: method.numericTan ? TextInputType.number : TextInputType.text,
                inputFormatters: method.numericTan ? [FilteringTextInputFormatter.digitsOnly] : null,
                decoration: InputDecoration(labelText: AppLocale.labels.finTsTan),
                onSubmitted: (value) => Navigator.pop(context, TanAnswer.tan(value)),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, TanAnswer.cancelled),
          child: Text(AppLocale.labels.closeTooltip),
        ),
        if (!challenge.isDecoupled)
          FilledButton(
            onPressed: () => Navigator.pop(context, TanAnswer.tan(controller.text)),
            child: Text(AppLocale.labels.ok),
          )
        else if (challenge.manualConfirmation)
          FilledButton(
            onPressed: () => Navigator.pop(context, TanAnswer.approved),
            child: Text(AppLocale.labels.finTsApproved),
          ),
      ],
    );
  }
}

class FinTsFlickerCode extends StatefulWidget {
  final List<List<bool>> frames;
  final Duration interval;

  const FinTsFlickerCode({
    super.key,
    required this.frames,
    this.interval = const Duration(milliseconds: 50),
  });

  @override
  FinTsFlickerCodeState createState() => FinTsFlickerCodeState();
}

class FinTsFlickerCodeState extends State<FinTsFlickerCode> {
  late final Timer _timer;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(widget.interval, (_) {
      if (widget.frames.isNotEmpty) {
        setState(() => _index = (_index + 1) % widget.frames.length);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final frame = widget.frames.isEmpty ? List.filled(5, false) : widget.frames[_index];
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final bit in frame)
            Container(
              width: 40,
              height: 120,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              color: bit ? Colors.white : Colors.black,
            ),
        ],
      ),
    );
  }
}
