import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nexusgo/services/navigation_service.dart';

void main() {
  group('NavigationService Tests', () {
    test('should have a global navigator key', () {
      expect(NavigationService.navigatorKey, isA<GlobalKey<NavigatorState>>());
    });

    test('navigator key should be consistent', () {
      final key1 = NavigationService.navigatorKey;
      final key2 = NavigationService.navigatorKey;

      expect(key1, same(key2));
    });

    testWidgets('should be able to use navigator key in MaterialApp',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: NavigationService.navigatorKey,
          home: const Scaffold(
            body: Text('Test App'),
          ),
        ),
      );

      expect(find.text('Test App'), findsOneWidget);
      expect(NavigationService.navigatorKey.currentContext, isNotNull);
    });
  });
}
