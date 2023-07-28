import 'package:flutter/material.dart';

import '../widgets/summary_card.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
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
                      number: 123,
                  ),
                ),
                Expanded(
                  child: SummaryCard(
                    title: "Progress",
                      number: 123,
                  ),
                ),
                Expanded(
                  child: SummaryCard(
                    title: "New Task",
                      number: 123,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

