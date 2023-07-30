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
            Expanded(
              child: ListView.separated(
                itemCount: 20,
                itemBuilder: (context, index) {
                 return ListTile(
                    title: const Text('Title will be here'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Title will be here'),
                        const Text('Date'),
                        Row(
                          children: [
                            const Chip(
                              label: Text(
                                'New',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.blue,
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete_forever_outlined,
                                  color: Colors.red.shade300,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                )),
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
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
