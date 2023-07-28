import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,required this.number,required this.title
  });

  final String title;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text("$number",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
          Text("$title"),
        ],
      ),
    );
  }
}