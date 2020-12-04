import 'package:calculate_lix/lix.dart';
import 'package:test/test.dart';

void main() {
  test('Fails with null', () {
    expect(() => Lix.fromString(null), throwsArgumentError);
  });

  test('Fails with no input', () {
    expect(() => Lix.fromString(''), throwsArgumentError);
  });

  test('Hello world', () {
    final l = Lix.fromString('Hello world.');
    expect(l.words, 2);
  });
}
