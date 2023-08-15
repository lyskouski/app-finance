// Taken from: https://docs.flutter.dev/cookbook/testing/integration/profiling

import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'package:integration_test/integration_test_driver.dart';

Future<void> main() {
  return integrationDriver(
    responseDataCallback: (data) async {
      if (data != null) {
        final timeline = driver.Timeline.fromJson(data['timeline']);
        final summary = driver.TimelineSummary.summarize(timeline);
        await summary.writeTimelineToFile(
          'timeline',
          pretty: true,
          includeSummary: true,
          destinationDirectory: './coverage/',
        );
      }
    },
  );
}
