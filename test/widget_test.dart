import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app1/main.dart'; // Import your app's main file

void main() {
  testWidgets('Weather app loads default city weather', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the default city (e.g., Cairo) weather information is displayed.
    expect(find.text('Cairo'), findsOneWidget); // Assuming Cairo is the default city
    expect(find.textContaining('Temperature'), findsOneWidget); // Check if temperature is displayed

    // You can also check for other weather details like description.
    expect(find.textContaining('Description'), findsOneWidget);
  });

  testWidgets('Search for a new city and update weather', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Find the TextField and enter a new city name (e.g., 'Alexandria').
    await tester.enterText(find.byType(TextField), 'Alexandria');
    await tester.tap(find.byType(ElevatedButton)); // Assuming there is a button to get weather
    await tester.pump();

    // Verify that the weather information for 'Alexandria' is displayed.
    expect(find.text('Alexandria'), findsOneWidget);
  });
}
