import 'package:flutter/material.dart';

class AppDrawerWidget extends StatelessWidget {
  final VoidCallback onAllTasks;
  final VoidCallback onCompletedTasks;
  final VoidCallback onPendingTasks;

  const AppDrawerWidget({
    super.key,
    required this.onAllTasks,
    required this.onCompletedTasks,
    required this.onPendingTasks,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(
              child: Text(
                "TO-DO MENU",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.list),
            title: const Text("All Tasks"),
            onTap: onAllTasks,
          ),

          ListTile(
            leading: const Icon(Icons.check_circle),
            title: const Text("Completed Tasks"),
            onTap: onCompletedTasks,
          ),

          ListTile(
            leading: const Icon(Icons.pending_actions),
            title: const Text("Pending Tasks"),
            onTap: onPendingTasks,
          ),
        ],
      ),
    );
  }
}
