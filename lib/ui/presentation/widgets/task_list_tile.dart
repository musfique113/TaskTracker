import 'package:flutter/material.dart';
import 'package:taskmanager_ostad/data/models/task_list_model.dart';

class TaskListTile extends StatefulWidget {
  const TaskListTile({
    super.key, required this.data,
  });

  final TaskData data;

  @override
  State<TaskListTile> createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.data.title ?? 'Unknown'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.data.description ?? ''),
          Text(widget.data.createdDate ?? ''),
          Row(
            children: [
              Chip(
                label: Text(
                  widget.data.status ?? 'New',
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.blue,
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {

                  },
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
  }
}
