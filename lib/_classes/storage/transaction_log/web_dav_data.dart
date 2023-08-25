// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

class WebDavData {
  final String link;
  final String username;
  final String password;
  final String path;

  WebDavData({
    required this.link,
    required this.username,
    required this.password,
    this.path = 'tmp.log',
  });

  bool isEmpty() {
    return username.isEmpty || link.isEmpty || password.isEmpty || path.isEmpty;
  }
}
