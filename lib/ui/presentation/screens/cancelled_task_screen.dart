import 'package:flutter/material.dart';
import 'package:taskmanager_ostad/ui/presentation/widgets/task_list_tile.dart';
import 'package:taskmanager_ostad/ui/presentation/widgets/user_profile_banner.dart';

class CancelledTaskScreen extends StatelessWidget {
  const CancelledTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileBanner(),
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
