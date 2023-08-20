import 'package:get/get.dart';
import 'package:taskmanager_ostad/data/models/network_response.dart';
import 'package:taskmanager_ostad/data/models/task_list_model.dart';
import 'package:taskmanager_ostad/data/services/network_caller.dart';
import 'package:taskmanager_ostad/data/utils/urls.dart';

class GetNewTaskController extends GetxController {
  bool _getNewTaskInProgress = false;
  bool get getNewTaskInProgress => _getNewTaskInProgress;

  TaskListModel _taskListModel = TaskListModel();
  TaskListModel get taskListModel => _taskListModel;

  var messege = "";

  Future<bool> getNewTasks() async {
    _getNewTaskInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.newTasks);
    _getNewTaskInProgress = false;

    if (response.isSuccess) {
      _taskListModel = TaskListModel.fromJson(response.body!);
      update();
      return true;
    } else {
      messege = 'Adding new task failed.';
      update();
      return false;
    }
  }
}
