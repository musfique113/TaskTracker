import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final int number;
  final String title;

  const SummaryCard({
    required this.number,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded( // Wrap the Column with Expanded
                    child: Text(
                      '${number < 10 ? '0$number' : number}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}