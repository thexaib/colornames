import 'dart:ui';

import 'package:colornames/src/color_names_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:colornames/colornames.dart';

void main() {
  test('test specific color name', () {
    final truth = "Lemon";
    final color= Color(0xFFFDE910);
    final fixture = ColorNames.guess(color);
    expect(fixture, truth);
    final color2= Color(0xFFC96323);
    expect(color2.colorName, "Piper");
  });
  test('test colors with alpha', () {
    final truth = "Lemon";
    final color= Color(0x67FDE910);
    final fixture = ColorNames.guess(color);
    expect(fixture, truth);
    final color2= Color(0x99C96323);
    expect(color2.colorName, "Piper");
  });
  test('test additional names', () {
    final truth = "Mint";
    final color= Color(0xFF3EB489);
    final color2= Color(0xFF3EAE85);
    final fixture = ColorNames.guess(color);
    expect(fixture, truth);
    expect(color2.colorName, truth);

    final nameB = "Crimson UA";
    final colorB1 = Color(0xFF9E1B32);
    expect(colorB1.colorName, nameB);
  });
  test('test extension on int value',(){
    expect(0x0.colorName, "Black");
    expect(0xFFFFFF.colorName, "White");
    expect(0xFF0000.colorName, "Red");
    expect(0x242A1D.colorName, "Log Cabin");
    expect(128.colorName, "Navy Blue");
    expect(0x007fff.colorName, "Azure");
  });
}
