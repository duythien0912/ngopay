import 'package:ngopay/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// flutter drive \
//   --driver=test_driver/integration_test.dart \
//   --target=integration_test/iapp_test.dart

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('screenshot', (WidgetTester tester) async {
    // Build the app.
    app.main();

    // This is required prior to taking the screenshot (Android only).
    await binding.convertFlutterSurfaceToImage();

    // Trigger a frame.
    await tester.pumpAndSettle();
    await binding.takeScreenshot('home');

    /// tap
    expect(find.text('skip'), findsOneWidget);
    await tester.tap(find.text('skip'));
    await tester.pumpAndSettle();
    await binding.takeScreenshot('home_tap_skip');
    expect(find.text('skip'), findsNothing);

    /// tap
    expect(find.text('Continue with Email'), findsOneWidget);
    await tester.tap(find.text('Continue with Email'));
    await tester.pumpAndSettle();
    await binding.takeScreenshot('tap_continue_with_email');
    expect(find.text('Continue with Email'), findsNothing);

    /// tap
    expect(find.text('Sign In'), findsOneWidget);
    await tester.tap(find.text('Sign In'));
    await tester.pumpAndSettle();
    await binding.takeScreenshot('tap_sign_in');
    expect(find.text('Sign In'), findsNothing);
  });
}
