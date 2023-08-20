import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager_ostad/data/models/network_response.dart';
import 'package:taskmanager_ostad/data/models/summary_count_model.dart';
import 'package:taskmanager_ostad/data/models/task_list_model.dart';
import 'package:taskmanager_ostad/data/services/network_caller.dart';
import 'package:taskmanager_ostad/data/utils/urls.dart';
import 'package:taskmanager_ostad/presentation/screens/add_new_task_screen.dart';
import 'package:taskmanager_ostad/presentation/screens/update_task_status.dart';
import 'package:taskmanager_ostad/presentation/state_managers/summary_count_controller.dart';
import 'package:taskmanager_ostad/presentation/widgets/summary_card.dart';
import 'package:taskmanager_ostad/presentation/widgets/task_list_tile.dart';
import 'package:taskmanager_ostad/presentation/widgets/user_profile_banner.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool _getNewTaskInProgress = false;
  bool _deleteInProgress = false;
  TaskListModel _taskListModel = TaskListModel();

  final SummaryCountController _summaryCountController = Get.find<SummaryCountController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _summaryCountController.getCountSummary();
      getNewTasks();
    });
  }


  Future<void> getNewTasks() async {
    _getNewTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.newTasks);
    if (response.isSuccess) {
      _taskListModel = TaskListModel.fromJson(response.body!);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Summary data get failed')));
      }
    }
    _getNewTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> deleteTask(String taskId) async {
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.deleteTasks(taskId));
    if (response.isSuccess) {
      //getNewTasks();
      _taskListModel.data!.removeWhere((element) => element.sId == taskId);
      if (mounted) {
        _summaryCountController.getCountSummary();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          getNewTasks();
          _summaryCountController.getCountSummary();
        },
        child: Column(
          children: [
            const UserProfileBanner(),
            GetBuilder<SummaryCountController>(
              builder: (_) {
                if(_summaryCountController.getCountSummaryInProgress){
                  return LinearProgressIndicator();
                }
                return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 80,
                          width: double.infinity,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: _summaryCountController.summaryCountModel.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              return SummaryCard(
                                title: _summaryCountController.summaryCountModel.data![index].sId ?? 'New',
                                number: _summaryCountController.summaryCountModel.data![index].sum ?? 0,
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return const Divider(
                                height: 1,
                              );
                            },
                          ),
                        ),
                      );
              }
            ),


            Expanded(
              child: _getNewTaskInProgress
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.separated(
                      itemCount: _taskListModel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return TaskListTile(
                          data: _taskListModel.data![index],
                          onDeleteTab: () {
                            deleteTask(_taskListModel.data![index].sId!);
                          },
                          onEditTab: () {
                            showStatusUpdateBottomSheet(
                                _taskListModel.data![index]);
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
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddNewTaskScreen()));
        },
      ),
    );
  }

  void showStatusUpdateBottomSheet(TaskData task) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return UpdateTaskStatusSheet(
            task: task,
            onUpdate: () {
              getNewTasks();
              _summaryCountController.getCountSummary();
            });
      },
    );
  }
}
