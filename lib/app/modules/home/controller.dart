import 'package:get/get.dart';

class HelloController extends GetxController {
  final title = 'hello'.tr;

  RxInt count = 1.obs;

  increment() {
    count++;
  }

  decrement() {
    count--;
  }
}
