class StringCalculator {
  static bool strictMode = false;

  static int add(String numbers) {
    if (numbers.trim().isEmpty) return 0;

    final delimiters = [',', '\n'];
    final delimiterPattern = RegExp(r'^//(.+)\n');
    final matchingNumbers = delimiterPattern.firstMatch(numbers);

    if (matchingNumbers != null) {
      delimiters.add(matchingNumbers.group(1)!);
      numbers = numbers.substring(matchingNumbers.end);
    }

    if (numbers.trim().isEmpty) return 0;

    final parts = numbers
        .split(RegExp(delimiters.map(RegExp.escape).join('|')))
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
