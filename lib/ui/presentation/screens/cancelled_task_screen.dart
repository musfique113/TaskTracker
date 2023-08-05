import 'package:flutter/material.dart';
import 'package:taskmanager_ostad/data/models/network_response.dart';
import 'package:taskmanager_ostad/data/models/task_list_model.dart';
import 'package:taskmanager_ostad/data/services/network_caller.dart';
import 'package:taskmanager_ostad/data/utils/urls.dart';
import 'package:taskmanager_ostad/ui/presentation/screens/update_task_status.dart';
import 'package:taskmanager_ostad/ui/presentation/widgets/task_list_tile.dart';
import 'package:taskmanager_ostad/ui/presentation/widgets/user_profile_banner.dart';

class CanceledTaskScreen extends StatefulWidget {
  const CanceledTaskScreen({Key? key}) : super(key: key);

  @override
  State<CanceledTaskScreen> createState() => _CanceledTaskScreenState();
}

class _CanceledTaskScreenState extends State<CanceledTaskScreen> {
  bool _getCanceledTasksInProgress = false;
  TaskListModel _taskListModel = TaskListModel();

  Future<void> getCanceledTasks() async {
    _getCanceledTasksInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.canceledTasks);
    if (response.isSuccess) {
      TaskListModel allTasks = TaskListModel.fromJson(response.body!);
      _taskListModel.data =
          allTasks.data?.where((task) => task.status == 'Canceled').toList();
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Completed tasks get failed')));
      }
    }
    _getCanceledTasksInProgress = false;
    if (mounted) {
      setState(() {});
    }else{
      setState(() {
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getCanceledTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const UserProfileBanner(),
          Expanded(
            child: _getCanceledTasksInProgress
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    itemCount: _taskListModel.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return TaskListTile(
                        data: _taskListModel.data![index], onDeleteTab: () {
                        deleteTask(_taskListModel.data![index].sId!);
                      }, onEditTab: () {
                        showStatusUpdateBottomSheet(_taskListModel.data![index]);
                      },

                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        height: 4,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Future<void> deleteTask(String taskId) async {
    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.deleteTasks(taskId));
    if (response.isSuccess) {
      //getNewTasks();
      _taskListModel.data!.removeWhere((element) => element.sId == taskId);
      if (mounted) {
        setState(() {});
      }
    } else {
      if (mounted) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Deletion failed")));
      }
    }
  }

  void showStatusUpdateBottomSheet(TaskData task) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return UpdateTaskStatusSheet(task: task, onUpdate: () {
          getCanceledTasks();
        });
      },
    );
  }
}
