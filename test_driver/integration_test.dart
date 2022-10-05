import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() => integrationDriver(
      onScreenshot: (String screenshotName, List<int> screenshotBytes) async {
        final image = File('integration_test_screenshoot/$screenshotName.png');
        image.writeAsBytesSync(screenshotBytes);
        // Return false if the screenshot is invalid.
        return true;
      },
    );
