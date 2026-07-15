import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  final int totalTasks;
  final int pendingTasks;
  final int completedTasks;

  const SummaryWidget({
    super.key,
    required this.totalTasks,
    required this.pendingTasks,
    required this.completedTasks,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 15),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Task Summary",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("Total Tasks"), Text("$totalTasks")],
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text(" Pending Tasks"), Text("$pendingTasks")],
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(" Completed Tasks"),
                Text("$completedTasks"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
