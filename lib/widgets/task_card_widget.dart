/*import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.task),

        title: const Text("Learn Flutter"),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(value: false, onChanged: (value) {}),

            IconButton(icon: const Icon(Icons.delete), onPressed: () {}),
          ],
        ),
      ) /*title: Text("Learn Flutter")*/,
    );
  }
}
*/
import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final String title;
  final bool isDone;
  final VoidCallback onDelete;
  final ValueChanged<bool?> onToggle;

  const TaskCardWidget({
    super.key,
    required this.title,
    required this.isDone,
    required this.onDelete,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.task),

        title: Text(title),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(value: isDone, onChanged: onToggle),

            IconButton(icon: const Icon(Icons.delete), onPressed: onDelete),
          ],
        ),
      ),
    );
  }
}
