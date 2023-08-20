import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager_ostad/data/models/task_list_model.dart';
import 'package:taskmanager_ostad/presentation/screens/add_new_task_screen.dart';
import 'package:taskmanager_ostad/presentation/screens/update_task_status.dart';
import 'package:taskmanager_ostad/presentation/state_managers/delete_task_controller.dart';
import 'package:taskmanager_ostad/presentation/state_managers/new_task_controller.dart';
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
  final SummaryCountController _summaryCountController =
      Get.find<SummaryCountController>();
  final GetNewTaskController _getNewTaskController =
      Get.find<GetNewTaskController>();
  final DeleteTaskController _deleteTaskController =
      Get.find<DeleteTaskController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _summaryCountController.getCountSummary();
      _getNewTaskController.getNewTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          _getNewTaskController.getNewTasks();
          _summaryCountController.getCountSummary();
        },
        child: Column(
          children: [
            const UserProfileBanner(),
            GetBuilder<SummaryCountController>(builder: (_) {
              if (_summaryCountController.getCountSummaryInProgress) {
                return LinearProgressIndicator();
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: _summaryCountController
                            .summaryCountModel.data?.length ??
                        0,
                    itemBuilder: (context, index) {
                      return SummaryCard(
                        title: _summaryCountController
                                .summaryCountModel.data![index].sId ??
                            'New',
                        number: _summaryCountController
                                .summaryCountModel.data![index].sum ??
                            0,
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
            }),
            Expanded(
              child: GetBuilder<GetNewTaskController>(builder: (_) {
                if (_getNewTaskController.getNewTaskInProgress) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.separated(
                  itemCount:
                      _getNewTaskController.taskListModel.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return TaskListTile(
                      data: _getNewTaskController.taskListModel.data![index],
                      onDeleteTab: () {
                        _deleteTaskController.deleteTask(_getNewTaskController
                            .taskListModel.data![index].sId!);
                        _summaryCountController.getCountSummary();
                        _getNewTaskController.getNewTasks();
                      },
                      onEditTab: () {
                        showStatusUpdateBottomSheet(
                            _getNewTaskController.taskListModel.data![index]);
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      height: 10,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(const AddNewTaskScreen());
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
              _getNewTaskController.getNewTasks();
              _summaryCountController.getCountSummary();
            });
      },
    );
  }
}
