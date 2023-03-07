import 'package:get/get.dart';
import 'package:bonnou/controllers/connection_controller.dart';

class DependencyInjection {
  static void init() async {
    //services
    Get.put<ConnectionController>(ConnectionController(), permanent: true);
  }
}