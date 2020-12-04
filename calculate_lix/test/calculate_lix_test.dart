import 'package:test/test.dart';

import '../lib/lix.dart';

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
