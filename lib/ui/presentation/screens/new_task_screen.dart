import 'package:flutter/material.dart';

import '../widgets/summary_card.dart';
import '../widgets/task_list_tile.dart';
import '../widgets/user_profile_banner.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            UserProfileBanner(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: SummaryCard(
                      title: "Canceled",
                      number: 123,
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      title: "Completed",
                      number: 124,
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      title: "Progress",
                      number: 125,
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      title: "New Task",
                      number: 126,
                    ),
                  ),
                ],
              ),
            ),
            TaskListTile(),
          ],
        ),
      ),
    );
  }
}
