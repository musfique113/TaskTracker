import 'dart:math';

import 'package:flutter/material.dart';

import 'package:taskmanager_ostad/data/models/task_list_model.dart';

class TaskListTile extends StatefulWidget {
  const TaskListTile({
    super.key,
    required this.data,
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
          Text('Date: ${widget.data.createdDate ?? ''}'),
          Row(
            children: [
              Container(
                width: 100, // Set the desired width for the chip
                child: Chip(
                  label: Center(
                    child: Text(
                      widget.data.status ?? 'New',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  backgroundColor: Colors.blue[400],
                ),
              ),
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      debugPrint("Edited");
                    },
                    icon: const Icon(
                      Icons.edit_location_alt_rounded,
                      color: Colors.green,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      debugPrint("delete");
                    },
                    icon: Icon(
                      Icons.delete_outline_sharp,
                      color: Colors.red.shade300,
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
