import 'package:get/get.dart';
import 'package:taskmanager_ostad/presentation/state_managers/add_new_task_controller.dart';
import 'package:taskmanager_ostad/presentation/state_managers/delete_task_controller.dart';
import 'package:taskmanager_ostad/presentation/state_managers/edit_profile_controller.dart';
import 'package:taskmanager_ostad/presentation/state_managers/login_controller.dart';
import 'package:taskmanager_ostad/presentation/state_managers/new_task_controller.dart';
import 'package:taskmanager_ostad/presentation/state_managers/reset_password_controller.dart';
import 'package:taskmanager_ostad/presentation/state_managers/signup_controller.dart';
import 'package:taskmanager_ostad/presentation/state_managers/summary_count_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignInController>(SignInController());
    Get.put<SignUpController>(SignUpController());
    Get.put<ResetPasswordController>(ResetPasswordController());
    Get.put<SummaryCountController>(SummaryCountController());
    Get.put<GetNewTaskController>(GetNewTaskController());
    Get.put<DeleteTaskController>(DeleteTaskController());
    Get.put<AddNewTaskController>(AddNewTaskController());
    Get.put<EditProfileController>(EditProfileController());
  }
}