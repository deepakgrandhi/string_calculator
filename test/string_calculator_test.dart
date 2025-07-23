import 'package:test/test.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {
  group('StringCalculator Final Flow', () {
    setUp(() => StringCalculator.strictMode = false);

    test('returns 0 for empty input', () {
      expect(StringCalculator.add(''), 0);
    });

    test('handles single number', () {
      expect(StringCalculator.add('5'), 5);
    });

    test('adds comma-separated numbers', () {
      expect(StringCalculator.add('1,2,3'), 6);
    });

    test('adds newline-separated numbers', () {
      expect(StringCalculator.add('1\n2\n3'), 6);
    });

    test('adds mixed comma and newline separated numbers', () {
      expect(StringCalculator.add('1\n2,3'), 6);
    });

    test('supports custom single-char delimiter', () {
      expect(StringCalculator.add('//;\n1;2;3'), 6);
    });

    test('supports custom multi-char delimiter', () {
      expect(StringCalculator.add('//[***]\n1***2***3'), 6);
    });

    test('supports multiple custom delimiters', () {
      expect(StringCalculator.add('//[*][%]\n1*2%3'), 6);
    });

    test('supports multiple multi-length delimiters', () {
      expect(StringCalculator.add('//[***][%%]\n1***2%%3'), 6);
    });

    test('skips numbers > 1000', () {
      expect(StringCalculator.add('2,1001'), 2);
    });

    test('throws on negatives with list', () {
      expect(
        () => StringCalculator.add('1,-2,-3,4'),
        throwsA(
          predicate(
            (e) =>
                e is ArgumentError &&
                e.message == 'negatives not allowed: -2, -3',
          ),
        ),
      );
    });

    test('skips invalid tokens in liberal mode', () {
      expect(StringCalculator.add('1,abc,.,2'), 3);
    });

    test('works with 100 numbers', () {
      final input = List.generate(100, (i) => '${i + 1}').join(',');
      expect(StringCalculator.add(input), 5050);
    });
  });
}
