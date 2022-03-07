import 'package:get/get.dart';
import 'package:list/app/modules/hello/controller.dart';

class HelloBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelloController>(() => HelloController());
  }
}
