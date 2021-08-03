import 'dart:ui';
import 'dart:math' as math;

class ColorValueVo {
  final Color color;
  late final double hue, saturation, lightness;

  ColorValueVo(this.color) {
    final double red = color.red / 0xFF;
    final double green = color.green / 0xFF;
    final double blue = color.blue / 0xFF;

    final double max = math.max(red, math.max(green, blue));
    final double min = math.min(red, math.min(green, blue));
    final double delta = max - min;

    hue = _getHue(red, green, blue, max, delta);
    lightness = (max + min) / 2.0;
    // Saturation can exceed 1.0 with rounding errors, so clamp it.
    saturation = lightness == 1.0
        ? 0.0
        : ((delta / (1.0 - (2.0 * lightness - 1.0).abs())).clamp(0.0, 1.0));
  }

  num getDistance(ColorValueVo from){
    final rgbDiff = math.pow(color.red-from.color.red, 2)+math.pow(color.green-from.color.green,2)+math.pow(color.blue-from.color.blue,2);
    final hslDiff = math.pow(hue-from.hue,2)+math.pow(saturation-from.saturation,2)+math.pow(lightness-from.lightness,2);
    return rgbDiff+hslDiff*2;
  }
  double _getHue(
      double red, double green, double blue, double max, double delta) {
    late double hue;
    if (max == 0.0) {
      hue = 0.0;
    } else if (max == red) {
      hue = 60.0 * (((green - blue) / delta) % 6);
    } else if (max == green) {
      hue = 60.0 * (((blue - red) / delta) + 2);
    } else if (max == blue) {
      hue = 60.0 * (((red - green) / delta) + 4);
    }

    /// Set hue to 0.0 when red == green == blue.
    hue = hue.isNaN ? 0.0 : hue;
    return hue;
  }
}
