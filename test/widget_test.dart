import 'package:flutter_test/flutter_test.dart';
import 'package:momcare/main.dart';

void main() {
  testWidgets('MomCare app launches successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MomCareApp());

    // Verify that the app loads
    expect(find.byType(MomCareApp), findsOneWidget);
  });

  testWidgets('Home screen displays dashboard', (WidgetTester tester) async {
    await tester.pumpWidget(const MomCareApp());

    // Verify dashboard elements
    expect(find.text('MomCare'), findsOneWidget);
    expect(find.byIcon(Icons.home), findsWidgets);
  });
}
