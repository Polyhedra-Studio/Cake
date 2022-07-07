part of cake;

class TestMessage extends _TestResult {
  String? message;

  TestMessage(String testTitle, {this.message}) : super(testTitle);

  @override
  void report({int spacerCount = 0}) {
    super.report(spacerCount: spacerCount);

    if (message != null) {
      Printer.neutral('$spacer$testTitle: ${message!}');
    } else {
      Printer.neutral(spacer + testTitle);
    }
  }
}
