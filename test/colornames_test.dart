import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:colornames/colornames.dart';

void main() {
  test('test specific color fetch', () {

    final truth = "Lemon";
    final color= Color(0xFFFDE910);
    final fixture = ColorNames.guess(color);
    expect(fixture, truth);
    final color2= Color(0xFFC96323);
    expect(color2.colorName, "Piper");
  });
}
