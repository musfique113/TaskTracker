import 'package:get/get.dart';
import 'package:taskmanager_ostad/data/services/network_caller.dart';
import 'package:taskmanager_ostad/data/utils/urls.dart';

import '../../data/models/network_response.dart';

class  AddNewTaskController extends GetxController{

  bool _adNewTaskInProgress = false;
  bool get adNewTaskInProgress => _adNewTaskInProgress;

  Future<bool> addNewTask(String title,String description) async {
    _adNewTaskInProgress = true;
    update();

    Map<String, dynamic> requestBody = {
      "title": title,
      "description": description,
      "status": "New"
    };
    final NetworkResponse response =
    await NetworkCaller().postRequest(Urls.createTask, requestBody);
    _adNewTaskInProgress = false;
    update();
    if (response.isSuccess) {
      // if (mounted) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(content: Text('Task added successfully')));
      // }
      return true;
    } else {
      return false;
    }
  }
}