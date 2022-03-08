import 'package:get/get.dart';

class RegisterController extends GetxController {
  final title = 'hello'.tr;

  RxInt count = 1.obs;

  increment() {
    count++;
  }

  decrement() {
    count--;
  }
}
