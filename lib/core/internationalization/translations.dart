import 'package:get/get.dart';
import 'package:list/core/internationalization/languages/en_US.dart';
import 'package:list/core/internationalization/languages/fr_FR.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUSKeys,
        'fr_FR': frFRKeys,
      };
}

//  Using translation :
//    Text('hello'.tr),
//
//  Using translation with parameters :
//    Text('logged_in'.trParams({
//      'name': 'Jhon',
//      'email': 'jhon@example.com'
//    }));
