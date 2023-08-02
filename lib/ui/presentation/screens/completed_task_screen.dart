import 'package:flutter/material.dart';
import 'package:taskmanager_ostad/ui/presentation/widgets/task_list_tile.dart';

import '../widgets/user_profile_banner.dart';

class CompletedTaskScreen extends StatelessWidget {
  const CompletedTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            UserProfileBanner(),

            Expanded(
              child: ListView.separated(
                itemCount: 20,
                itemBuilder: (context, index) {
                  // return TaskListTile(
                  //
                  //    // data: _taskListModel.data![index]
                  // );
                  return SizedBox();
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
    );
  }
}