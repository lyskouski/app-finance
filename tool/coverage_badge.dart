// Original: https://github.com/amondnet/flutter_coverage_badge
// Error: Because app_finance depends on flutter_coverage_badge any which doesn't support null safety.

import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

int calculateLineCoverage(File lcovReport) {
  ProcessResult result = Process.runSync('dart', [
    'run',
    'test_cov_console',
    '--file="${lcovReport.absolute.path}"',
    '--total'
  ]);
  List<String> lines = const LineSplitter().convert(result.stdout);
  String coverage = lines.isNotEmpty ? lines.last : '';
  return double.parse(coverage.trim()).round();
}

void generateBadge(String packageRoot, int lineCoverage) {
  const leftWidth = 59;
  final color = _color(lineCoverage);
  final metrics = _BadgeMetrics.forPercentage(lineCoverage);
  final rightWidth = metrics.width! - leftWidth;
  final content = _kBadgeTemplate
      .replaceAll('{width}', metrics.width.toString())
      .replaceAll('{rightWidth}', rightWidth.toString())
      .replaceAll('{rightX}', metrics.rightX.toString())
      .replaceAll('{rightLength}', metrics.rightLength.toString())
      .replaceAll('{color}', color.toString())
      .replaceAll('{value}', '$lineCoverage%');
  File(path.join(packageRoot, 'coverage_badge.svg')).writeAsStringSync(content);
}

class _BadgeMetrics {
  final int? width;
  final int? rightX;
  final int? rightLength;

  _BadgeMetrics({this.width, this.rightX, this.rightLength});

  factory _BadgeMetrics.forPercentage(int value) {
    final length = value.toString().length;
    if (length == 1) {
      return _BadgeMetrics(
        width: 88,
        rightX: 725,
        rightLength: 190,
      );
    } else if (length == 2) {
      return _BadgeMetrics(
        width: 94,
        rightX: 755,
        rightLength: 250,
      );
    } else {
      return _BadgeMetrics(
        width: 102,
        rightX: 795,
        rightLength: 330,
      );
    }
  }
}

String _color(int percentage) {
  final map = {
    0: _Color(0xE0, 0x5D, 0x44),
    25: _Color(0xE0, 0x5D, 0x44),
    50: _Color(0xDF, 0xB3, 0x17),
    75: _Color(0x97, 0xCA, 0x00),
    98: _Color(0x44, 0xCC, 0x11),
  };
  int lower = 0;
  int upper = 100;
  for (final key in map.keys) {
    if (percentage <= key) {
      upper = key;
      break;
    }
    lower = key;
  }

  final lowerColor = map[lower]!;
  final upperColor = map[upper]!;
  final range = upper - lower;
  final rangePct = (percentage - lower) / range;
  final pctLower = 1 - rangePct;
  final pctUpper = rangePct;
  final r = (lowerColor.r * pctLower + upperColor.r * pctUpper).floor();
  final g = (lowerColor.g * pctLower + upperColor.g * pctUpper).floor();
  final b = (lowerColor.b * pctLower + upperColor.b * pctUpper).floor();
  return _Color(r, g, b).toString();
}

class _Color {
  final int r, g, b;

  _Color(this.r, this.g, this.b);

  @override
  String toString() =>
      '#${((1 << 24) + (r << 16) + (g << 8) + b).toRadixString(16).substring(1)}';
}

const _kBadgeTemplate = '''
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="{width}" height="20">
  <linearGradient id="b" x2="0" y2="100%">
    <stop offset="0" stop-color="#bbb" stop-opacity=".1"/>
    <stop offset="1" stop-opacity=".1"/>
  </linearGradient>
  <clipPath id="a">
    <rect width="{width}" height="20" rx="3" fill="#fff"/>
  </clipPath>
  <g clip-path="url(#a)">
    <path fill="#555" d="M0 0h59v20H0z"/>
    <path fill="{color}" d="M59 0h{rightWidth}v20H59z"/>
    <path fill="url(#b)" d="M0 0h{width}v20H0z"/>
  </g>
  <g fill="#fff" text-anchor="middle" font-family="DejaVu Sans,Verdana,Geneva,sans-serif" font-size="110">
    <text x="305" y="150" fill="#010101" fill-opacity=".3" transform="scale(.1)" textLength="490">coverage</text>
    <text x="305" y="140" transform="scale(.1)" textLength="490">coverage</text>
    <text x="{rightX}" y="150" fill="#010101" fill-opacity=".3" transform="scale(.1)" textLength="{rightLength}">{value}</text>
    <text x="{rightX}" y="140" transform="scale(.1)" textLength="{rightLength}">{value}</text>
  </g>
</svg>
''';
