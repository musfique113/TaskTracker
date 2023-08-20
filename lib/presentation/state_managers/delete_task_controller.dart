import 'package:get/get.dart';
import 'package:taskmanager_ostad/data/models/network_response.dart';
import 'package:taskmanager_ostad/data/models/task_list_model.dart';
import 'package:taskmanager_ostad/data/services/network_caller.dart';
import 'package:taskmanager_ostad/data/utils/urls.dart';

class DeleteTaskController extends GetxController{

  TaskListModel _taskListModel = TaskListModel();
  TaskListModel get taskListModel => _taskListModel;

  String message = "";

  Future<bool> deleteTask(String taskId) async {
    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.deleteTasks(taskId));
    if (response.isSuccess) {
      _taskListModel.data!.removeWhere((element) => element.sId == taskId);
      return true;
    } else {
      message = 'Deleting task failed.';
      update();
      return false;
    }
  }

}