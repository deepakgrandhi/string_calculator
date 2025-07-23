class StringCalculator {
  static bool strictMode = true;

  static int add(String numbers) {
    if (numbers.trim().isEmpty) return 0;

    final parts = numbers
        .split(',')
        .map((n) => n.trim())
        .where((n) {
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
