import 'package:cake/cake.dart';

void main() {
  TestRunner('Test Runner - Basic', [
    Group('Group - Basic', [
      Test(
        'True should be true',
        assertions: (test) => [Expect.isTrue(false)],
      ),
    ]),
  ]);
}
