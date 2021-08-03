
import 'package:colornames/src/color_names.dart';
import 'package:flutter/painting.dart';

extension XColorNames on Color{
  String get colorName => ColorNames.guess(this);
}