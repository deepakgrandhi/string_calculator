class StringCalculator {
  static bool strictMode = false;

  static int add(String numbers) {
    if (numbers.trim().isEmpty) return 0;

    final delimiters = [',', '\n'];
    final parts = numbers
        .split(RegExp('[${delimiters.join()}]'))
        .map((n) => n.trim())
        .where((n) {
          if (n.isEmpty) {
            if (strictMode) {
              throw FormatException('Empty value found');
            } else {
              print('Skipping invalid input: ""');
              return false;
            }
          }

          if (int.tryParse(n) == null) {
            if (strictMode) {
              throw FormatException('Invalid number: "$n"');
            } else {
              print('Skipping invalid input: "$n"');
              return false;
            }
          }

          return true;
        })
        .map(int.parse);

    return parts.fold(0, (a, b) => a + b);
  }
}
