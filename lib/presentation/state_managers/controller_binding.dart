import 'package:get/get.dart';
import 'package:taskmanager_ostad/presentation/state_managers/login_controller.dart';
import 'package:taskmanager_ostad/presentation/state_managers/reset_password_controller.dart';
import 'package:taskmanager_ostad/presentation/state_managers/signup_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignInController>(SignInController());
    Get.put<SignUpController>(SignUpController());
    Get.put<ResetPasswordController>(ResetPasswordController());
  }
}