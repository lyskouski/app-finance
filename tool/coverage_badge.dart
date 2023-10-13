// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

double calculateLineCoverage(File lcovReport) {
  ProcessResult result =
      Process.runSync('dart', ['run', 'test_cov_console', '--file="${lcovReport.absolute.path}"', '--total']);
  List<String> lines = const LineSplitter().convert(result.stdout);
  String coverage = lines.isNotEmpty ? lines.last : '';
  return double.parse((double.tryParse(coverage.trim()) ?? 0.0).toStringAsFixed(2));
}

void generateBadge(String packageRoot, double lineCoverage, String type) {
  String title = switch (type) {
    'e2e' => 'End-To-End Coverage',
    'widget' => 'Widget Tests Coverage',
    'unit' => 'Unit Tests Coverage',
    _ => 'Full Coverage',
  };
  final titleLength = 20 + title.length * 6;
  final content = _kBadgeTemplate
      .replaceAll('{title}', title)
      .replaceAll('{badgeWidth}', (titleLength + 50).toString())
      .replaceAll('{width}', titleLength.toString())
      .replaceAll('{rightX}', (17 - lineCoverage.toString().length * 2).toString())
      .replaceAll('{color}', _getColor(lineCoverage).toString())
      .replaceAll('{value}', '$lineCoverage%');
  File(path.join(packageRoot, '${type}_coverage_badge.svg')).writeAsStringSync(content);
}

String _getColor(double percentage) {
  final map = {
    0: _Color(0xE0, 0x5D, 0x44),
    25: _Color(0xE0, 0x5D, 0x44),
    50: _Color(0xDF, 0xB3, 0x17),
    75: _Color(0x97, 0xCA, 0x00),
    98: _Color(0x44, 0xCC, 0x11),
  };
  int lower = map.keys.first;
  int upper = map.keys.last;
  for (final key in map.keys) {
    if (percentage <= key) {
      upper = key;
      break;
    }
    lower = key;
  }
  _Color lowerColor = map[lower]!;
  _Color upperColor = map[upper]!;
  int range = upper - lower;
  if (upper == lower) {
    range = 1;
  }
  double rangePct = (percentage.toInt() - lower) / range;
  double pctLower = 1 - rangePct;
  int r = (lowerColor.r * pctLower + upperColor.r * rangePct).floor();
  int g = (lowerColor.g * pctLower + upperColor.g * rangePct).floor();
  int b = (lowerColor.b * pctLower + upperColor.b * rangePct).floor();
  return _Color(r, g, b).toString();
}

class _Color {
  final int r, g, b;

  _Color(this.r, this.g, this.b);

  @override
  String toString() => '#${((1 << 24) + (r << 16) + (g << 8) + b).toRadixString(16).substring(1)}';
}

const _kBadgeTemplate = '''
<svg xmlns="http://www.w3.org/2000/svg" width="{badgeWidth}" height="20">
  <title>{title} - {value}</title>
  <defs>
    <linearGradient id="title-fill" x1="50%" y1="0%" x2="50%" y2="100%">
      <stop stop-color="#444D56" offset="0%"></stop>
      <stop stop-color="#24292E" offset="100%"></stop>
    </linearGradient>
    <linearGradient id="coverage-fill" x1="50%" y1="0%" x2="50%" y2="100%">
      <stop stop-color="#555" offset="0%"></stop>
      <stop stop-color="{color}" offset="100%"></stop>
    </linearGradient>
  </defs>
  <g fill="none" fill-rule="evenodd">
    <g font-family="&#39;DejaVu Sans&#39;,Verdana,Geneva,sans-serif" font-size="11">
      <path d="M0,3 C0,1.3431 1.3552,0 3.02702703,0 L{width},0 L{width},20 L3.02702703,20 C1.3552,20 0,18.6569 0,17 L0,3 Z" fill="url(#title-fill)" fill-rule="nonzero"></path>
      <text fill="#010101" fill-opacity=".3">
        <tspan x="12" y="15" aria-hidden="true">{title}</tspan>
      </text>
      <text fill="#FFFFFF">
        <tspan x="12" y="14">{title}</tspan>
      </text>
    </g>
    <g transform="translate({width})" font-family="&#39;DejaVu Sans&#39;,Verdana,Geneva,sans-serif" font-size="11">
      <path d="M0 0h46.939C48.629 0 50 1.343 50 3v14c0 1.657-1.37 3-3.061 3H0V0z" fill="url(#coverage-fill)" fill-rule="nonzero"></path>
      <text fill="#010101" fill-opacity=".3" aria-hidden="true">
        <tspan x="{rightX}" y="15">{value}</tspan>
      </text>
      <text fill="#FFFFFF">
        <tspan x="{rightX}" y="14">{value}</tspan>
      </text>
    </g>
  </g>
</svg>
''';
