import 'package:colornames/colornames.dart';
import 'package:flutter/material.dart';

void main() {
  final MaterialAccentColor color = Colors.blueAccent;
  print(color.colorName); // Blue De France
  print(ColorNames.guess(Color(0xFFFF9E47))); // Yellow Orange
  print(0xf3f0f0.colorName); // Seashell
}
