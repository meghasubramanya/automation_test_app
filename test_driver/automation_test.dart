// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Welcome App', () {
    final counterTextFinder = find.byValueKey('counterText');
    final buttonFinder = find.byTooltip('Increment');
    final buttonView = find.byValueKey('view');
    final buttonSubtract = find.byValueKey('subtract');
    final alertText = find.byValueKey('alert_text');
    final buttonClose = find.byValueKey('close_button');

    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver.close();
    });


    test('increments the counter', () async {
      await driver.tap(buttonFinder);

      expect(await driver.getText(counterTextFinder), "1");

      await driver.tap(buttonFinder);

      expect(await driver.getText(counterTextFinder), "2");
    });

    test('testing alert window', () async {
      await driver.tap(buttonView);

      expect(await driver.getText(alertText), "Welcome to Automation Test 2");

      await driver.tap(buttonClose);

      await driver.tap(buttonSubtract);

      expect(await driver.getText(counterTextFinder), "1");
    });

  });
}