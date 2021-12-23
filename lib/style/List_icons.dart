// Place fonts/List.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: List
//      fonts:
//       - asset: fonts/List.ttf
import 'package:flutter/widgets.dart';

class IcList {
  IcList._();

  static const String _fontFamily = 'List';

  static const IconData share = IconData(0xe800, fontFamily: _fontFamily);
  static const IconData add = IconData(0xe801, fontFamily: _fontFamily);
  static const IconData check_no_checked =
      IconData(0xe802, fontFamily: _fontFamily);
  static const IconData check_checked =
      IconData(0xe803, fontFamily: _fontFamily);
  static const IconData remove = IconData(0xe804, fontFamily: _fontFamily);
  static const IconData person = IconData(0xe805, fontFamily: _fontFamily);
  static const IconData home = IconData(0xe806, fontFamily: _fontFamily);
}
