import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager_ostad/presentation/screens/bottom_nav_bar_screen.dart';
import 'package:taskmanager_ostad/presentation/state_managers/add_new_task_controller.dart';
import 'package:taskmanager_ostad/presentation/widgets/screen_background.dart';
import 'package:taskmanager_ostad/presentation/widgets/user_profile_banner.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();

  // final AddNewTaskController _addNewTaskController =
  //     Get.find<AddNewTaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserProfileBanner(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Add new task',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _titleTEController,
                    decoration: const InputDecoration(hintText: 'Title'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _descriptionTEController,
                    maxLines: 9,
                    decoration: const InputDecoration(
                      hintText: 'Description',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GetBuilder<AddNewTaskController>(builder: (addNewTaskController) {
                    return SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible:
                            addNewTaskController.adNewTaskInProgress == false,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                              addNewTaskController
                                  .addNewTask(
                                _titleTEController.text,
                                _descriptionTEController.text,
                              )
                                  .then((value) {
                                if (value) {
                                  _titleTEController.clear();
                                  _descriptionTEController.clear();
                                  Get.snackbar(
                                    'Success',
                                    'Task added successfully!',
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                    borderRadius: 10,
                                  );
                                } else {
                                  Get.snackbar(
                                    'Failed',
                                    'Task add failed!',
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                    borderRadius: 10,
                                  );
                                }
                              });
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Task added successfully')));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Task added failed')));
                              }
                              Get.off(const BottomNavbarScreen());
                            },
                            child: const Icon(Icons.arrow_forward_ios)),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
