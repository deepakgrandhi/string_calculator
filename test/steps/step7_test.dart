import 'package:test/test.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {
  group('Step 7 - Multi-character Custom Delimiters (Hybrid Mode)', () {
    test('supports bracketed multi-char delimiter [***]', () {
      StringCalculator.strictMode = true;
      expect(StringCalculator.add('//[***]\n1***2***3'), 6);
    });

    test('supports unbracketed multi-char delimiter ***', () {
      StringCalculator.strictMode = true;
      expect(StringCalculator.add('//***\n1***2***3'), 6);
    });

    test('works with space as delimiter [   ]', () {
      StringCalculator.strictMode = true;
      expect(StringCalculator.add('//[   ]\n1   2   3'), 6);
    });

    test('ignores numbers > 1000 with custom delimiter', () {
      StringCalculator.strictMode = true;
      expect(StringCalculator.add('//[***]\n2***1001***3'), 5);
    });

    test('skips invalid tokens in liberal mode with custom delimiter', () {
      StringCalculator.strictMode = false;
      expect(StringCalculator.add('//[xyz]\n1xyzabcxyz3'), 4);
    });

    test('throws for negatives with multi-char delimiter', () {
      StringCalculator.strictMode = true;
      expect(
        () => StringCalculator.add('//[***]\n-1***2***-3'),
        throwsA(
          predicate(
            (e) =>
                e is ArgumentError &&
                e.message == 'negatives not allowed: -1, -3',
          ),
        ),
      );
    });
  });
}
