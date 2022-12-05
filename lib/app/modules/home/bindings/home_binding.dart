import 'package:get/get.dart';

import '../controllers/led_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LEDController>(
      () => LEDController(),
    );
  }
}
