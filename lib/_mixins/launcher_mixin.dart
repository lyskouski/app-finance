// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:url_launcher/url_launcher.dart';

mixin LauncherMixin {
  Future<void> openURL(String path) async {
    final url = Uri.parse(path);
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }
}
