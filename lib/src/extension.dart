
import 'package:colornames/src/color_names.dart';
import 'package:flutter/painting.dart';

extension XColorNames on Color{
  /// Guess a name for the given [color]. returns [String].
  /// If name is not found then "Color_{Hex8}" value is returned
  String get colorName => ColorNames.guess(this);
}