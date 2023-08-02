
import 'package:flutter/material.dart';
import 'package:taskmanager_ostad/data/models/network_response.dart';
import 'package:taskmanager_ostad/data/services/network_caller.dart';
import 'package:taskmanager_ostad/data/utils/urls.dart';
import 'package:taskmanager_ostad/ui/presentation/widgets/user_profile_banner.dart';

class AddNewTaskScreen extends StatefulWidget {
  AddNewTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  TextEditingController _titleTEController = TextEditingController();
  TextEditingController _descriptionTEController = TextEditingController();
 bool _addNewTaskInprogress = false;

  Future<void> addNewTask() async {
    _addNewTaskInprogress = true;
    if (mounted) {
      setState(() {});
      Map<String, dynamic> responseBody = {
        "title": _titleTEController.text.trim(),
        "description": _descriptionTEController.text.trim(),
      };

      final NetworkResponse response =
      await NetworkCaller().postRequest(Urls.createTask,responseBody);

      _addNewTaskInprogress  = false;
      if(mounted){
        setState(() {

        });
      }

      if(response.isSuccess){
        _titleTEController.clear();
        _descriptionTEController.clear();
        if(mounted){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Task added successfully")));
        }else{
          if(mounted){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Task added failed")));
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserProfileBanner(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Add new task',
                    style: Theme.of(context).textTheme.titleLarge,
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
                    maxLines: 4,
                    decoration: const InputDecoration(
                      hintText: 'Description',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: _addNewTaskInprogress == false,
                      replacement: const Center(child: CircularProgressIndicator()),
                      child: ElevatedButton(
                          onPressed: () {
                            addNewTask();
                          },
                          child: const Icon(Icons.arrow_forward_ios)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
