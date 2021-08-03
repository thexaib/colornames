
import 'dart:ui';

import 'package:colornames/src/color_value_vo.dart';
import 'color_names_list.dart';
abstract class ColorNames
{
 static String guess(Color color){
    final curColor = ColorValueVo(Color(0xFF000000 | color.value));
    if(ColorNamesList.namesMap.containsKey(curColor)){
      //exact match
      return ColorNamesList.namesMap[curColor]!;
    }

    num curDiff = 0;
    ColorValueVo? foundColor;
    num diff = -1;

    ColorNamesList.namesMap.keys.forEach((ColorValueVo c) {
      curDiff = curColor.getDistance(c);
      if(diff<0|| diff>curDiff)
      {
        diff=curDiff;
        foundColor=c;
      }
    });
    if(foundColor!=null) return ColorNamesList.namesMap[foundColor]!;
    return "Color_${color.value.toRadixString(16)}";
  }
}