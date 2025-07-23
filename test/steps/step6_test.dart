import 'package:test/test.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {
  group('Step 6 - Ignore Numbers > 1000 (Hybrid Mode)', () {
    setUp(() => StringCalculator.strictMode = false);

    test('ignores numbers greater than 1000', () {
      expect(StringCalculator.add('2,1001'), 2);
    });

    test('includes 1000 but ignores 1001', () {
      expect(StringCalculator.add('1000,1'), 1001);
    });

    test('handles multiple large numbers correctly', () {
      expect(StringCalculator.add('1,1001,1002,2'), 3);
    });

    test('works with newline delimiters', () {
      expect(StringCalculator.add('1\n1002\n2'), 3);
    });

    test('works with custom delimiter', () {
      expect(StringCalculator.add('//;\n1001;2;3;10000'), 5);
    });
  });
}
