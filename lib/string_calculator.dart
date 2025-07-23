class StringCalculator {
  static bool strictMode = false;

  static int add(String numbers) {
    if (numbers.trim().isEmpty) return 0;

    final delimiters = [',', '\n'];
    final delimiterHeaderPattern = RegExp(r'^//(.+)\n');
    final match = delimiterHeaderPattern.firstMatch(numbers);

    if (match != null) {
      final raw = match.group(1)!;
      final bracketMatches = RegExp(r'\[(.*?)\]').allMatches(raw).toList();

      if (bracketMatches.isNotEmpty) {
        final extracted =
            bracketMatches
                .map((m) => m.group(1)!)
                .where((d) => d.isNotEmpty)
                .toList();

        if (extracted.any((d) => d.isEmpty)) {
          if (strictMode) throw FormatException('Empty delimiter not allowed');
        }

        delimiters.addAll(extracted);
      } else {
        if (raw.contains('[') || raw.contains(']')) {
          if (strictMode) {
            throw FormatException('Malformed custom delimiter format');
          } else {
            print('Skipping malformed delimiter header: "$raw"');
          }
        } else {
          delimiters.add(raw);
        }
      }

      numbers = numbers.substring(match.end);
    }

    if (numbers.trim().isEmpty) return 0;

    final delimiterRegex = RegExp(delimiters.map(RegExp.escape).join('|'));
    final parsedNumbers = <int>[];

    for (final token in numbers.split(delimiterRegex).map((n) => n.trim())) {
      if (token.isEmpty) {
        if (strictMode) throw FormatException('Empty value found');
        print('Skipping invalid input: ""');
        continue;
      }

      final parsed = int.tryParse(token);
      if (parsed == null) {
        if (strictMode) throw FormatException('Invalid number: "$token"');
        print('Skipping invalid input: "$token"');
        continue;
      }

      parsedNumbers.add(parsed);
    }

    final negatives = parsedNumbers.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw ArgumentError('negatives not allowed: ${negatives.join(', ')}');
    }

    return parsedNumbers.where((n) => n <= 1000).fold(0, (a, b) => a + b);
  }
}
