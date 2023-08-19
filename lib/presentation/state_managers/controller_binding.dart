import 'package:get/get.dart';
import 'package:taskmanager_ostad/presentation/state_managers/login_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignInController>(SignInController());
  }
}