class StringCalculator {
  static bool strictMode = false;

  static int add(String numbers) {
    if (numbers.trim().isEmpty) return 0;

    final delimiters = [',', '\n'];
    final delimiterPattern = RegExp(r'^//(?:\[(.+)\]|(.+))\n');
    final match = delimiterPattern.firstMatch(numbers);

    if (match != null) {
      final customDelimiter = match.group(1) ?? match.group(2)!;
      delimiters.add(customDelimiter);
      numbers = numbers.substring(match.end);
    }

    if (numbers.trim().isEmpty) return 0;

    final parsedNumbers = <int>[];

    for (final value in numbers
        .split(RegExp(delimiters.map(RegExp.escape).join('|')))
        .map((n) => n.trim())) {
      if (value.isEmpty) {
        if (strictMode) throw FormatException('Empty value found');
        print('Skipping invalid input: ""');
        continue;
      }

      final parsed = int.tryParse(value);
      if (parsed == null) {
        if (strictMode) throw FormatException('Invalid number: "$value"');
        print('Skipping invalid input: "$value"');
        continue;
      }

      parsedNumbers.add(parsed);
    }

    final negatives = parsedNumbers.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw ArgumentError('negatives not allowed: ${negatives.join(', ')}');
    }

    final validNumbers = parsedNumbers.where((n) => n <= 1000);

    return validNumbers.fold(0, (a, b) => a + b);
  }
}
