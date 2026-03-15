import 'package:flutter_test/flutter_test.dart';
import 'package:hastiq/src/app/hastiq_app.dart';

void main() {
  testWidgets('shows onboarding role selection after splash', (tester) async {
    await tester.pumpWidget(const HastiqApp());
    expect(find.text('Hastiq'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 1300));
    expect(find.text('Choose your role'), findsOneWidget);
    expect(find.text('I am looking for a job'), findsOneWidget);
    expect(find.text('I am looking for talent'), findsOneWidget);
  });
}
