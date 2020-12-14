// Copyright (c) 2020, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Based on:
/// https://readabilityformulas.com/the-LIX-readability-formula.php.
class Lix {
  /// Number of words in general.
  int words;

  /// Number of words with more than 6 characters.
  int longWords;

  /// Number of periods.
  int periods;

  /// The calculated lix readability index.
  int readability;

  Lix({
    this.words,
    this.longWords,
    this.periods,
  }) {
    readability = _calculate();
  }

  factory Lix.fromString(String text) {
    // Count periods: . : ; ! ?
    final periods = (RegExp(r'[.:;!?]').allMatches(text).length);

    // Count words.
    final allWords = text.split(RegExp(r'\W+')).where((s) => s != '').toList();
    final words = allWords.length;
    final longWords = allWords.where((w) => w.length > 6).length;

    return Lix(words: words, longWords: longWords, periods: periods);
  }

  int _calculate() {
    int result;

    if (words == 0 || periods == 0) {
      throw (ArgumentError('Text must contain at least one full sentence.'));
    } else {
      final sentenceLength = words / periods;
      final wordLength = (longWords * 100) / words;
      result = (sentenceLength + wordLength).round();
    }

    return result;
  }

  String describe() {
    if (readability > 0 && readability < 20) {
      return 'very easy';
    } else if (readability < 30) {
      return 'easy';
    } else if (readability < 40) {
      return 'a little hard';
    } else if (readability < 50) {
      return 'hard';
    } else if (readability < 60) {
      return 'very hard';
    } else {
      return 'unknown';
    }
  }
}
