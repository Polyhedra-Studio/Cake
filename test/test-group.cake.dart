import 'package:cake/cake.dart';

void main(List<String> arguments) async {
  TestRunner('Test Groups', [
    Group('Should run all children tests', [
      // Generic Constructor
      Test<bool>('True is true - assertion',
          assertions: ((context) => [
                Expect(ExpectType.equals, expected: true, actual: true),
              ])),
      Test<bool>(
        'True is true, set in setup',
        setup: (context) {
          context.expected = true;
          context.actual = true;
        },
      ),
      Test<bool>(
        'True is true, set in action',
        action: (context) {
          context.expected = true;
          context.actual = true;
        },
      ),

      // Equals expect
      Test<bool>('Equals, true is true',
          setup: (test) {
            test.expected = true;
          },
          action: (test) {
            test.actual = true;
          },
          assertions: (context) => [
                Expect.equals(
                    expected: context.expected, actual: context.actual)
              ]),

      // isNull expect
      Test<bool>('IsNull, null is null',
          action: (test) {
            test.actual = null;
          },
          assertions: (context) => [Expect.isNull(context.actual)]),

      // isNotNull expect
      Test<bool>('IsNotNull, true is not null',
          action: (test) {
            test.actual = true;
          },
          assertions: (context) => [Expect.isNotNull(context.actual)]),

      // isType expect
      Test<bool>('IsType, true is bool',
          action: (test) {
            test.actual = true;
          },
          assertions: (context) => [Expect<bool>.isType(context.actual)]),
    ]),
    Group('Nested Group - Parent', [
      Group('Nested Group - Child', [
        Test<bool>(
          'Nested test should pass',
          action: (test) {
            test.expected = true;
            test.actual = true;
          },
        ),
      ]),
    ])
  ]);
}
