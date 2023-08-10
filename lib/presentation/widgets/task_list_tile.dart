import 'package:flutter/material.dart';

import 'package:taskmanager_ostad/data/models/task_list_model.dart';

class TaskListTile extends StatelessWidget {
  final VoidCallback onDeleteTab;
  final VoidCallback onEditTab;

  const TaskListTile({
    super.key,
    required this.data,
    required this.onDeleteTab,
    required this.onEditTab,
  });

  final TaskData data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data.title ?? 'Unknown',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 17, color: Colors.black)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(data.description ?? '',style: TextStyle(color: Colors.black38,fontSize: 15),),
          Text(
            data.description!.length > 100
                ? "${data.description!.substring(0, 100)}..."
                : data.description.toString(),
            style: const TextStyle(color: Colors.black38, fontSize: 15),
          ),
          Text('Date: ${data.createdDate ?? ''}'),
          Row(
            children: [
              SizedBox(
                width: 100, // Set the desired width for the chip
                child: Chip(
                  label: Center(
                    child: Text(
                      data.status ?? 'New',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
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
                    onPressed: onEditTab,
                    icon: const Icon(
                      Icons.edit_location_alt_rounded,
                      color: Colors.green,
                    ),
                  ),
                  IconButton(
                    onPressed: onDeleteTab,
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
