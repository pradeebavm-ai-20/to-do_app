import 'package:flutter/material.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/task_card_widget.dart';
import '../widgets/summary_widget.dart';
import '../widgets/app_drawer_widget.dart';
//final TextEditingController controller = TextEditingController();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();
  String selectedFilter = "All";

  List<Map<String, dynamic>> tasks = [];

  /*void addTask() {
    print(controller.text);
    controller.clear();
  }*/
  void addTask() {
    if (controller.text.isEmpty) return;

    setState(() {
      tasks.add({"title": controller.text, "isDone": false});
    });

    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    int totalTasks = tasks.length;

    int completedTasks = tasks.where((task) => task["isDone"] == true).length;

    int pendingTasks = totalTasks - completedTasks;

    List<Map<String, dynamic>> filteredTasks;

    if (selectedFilter == "Completed") {
      filteredTasks = tasks.where((task) => task["isDone"] == true).toList();
    } else if (selectedFilter == "Pending") {
      filteredTasks = tasks.where((task) => task["isDone"] == false).toList();
    } else {
      filteredTasks = tasks;
    }

    return Scaffold(
      //drawer: const Drawer(),
      drawer: AppDrawerWidget(
        onAllTasks: () {
          setState(() {
            selectedFilter = "All";
          });
          Navigator.pop(context);
        },

        onCompletedTasks: () {
          setState(() {
            selectedFilter = "Completed";
          });
          Navigator.pop(context);
        },

        onPendingTasks: () {
          setState(() {
            selectedFilter = "Pending";
          });
          Navigator.pop(context);
        },
      ),

      appBar: AppBar(title: const Text("TO-DO APP"), centerTitle: true),

      /*body: const Center(
        child: Text(
          "Welcome!",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),*/
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SearchBarWidget(controller: controller, onAdd: addTask),

            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Today's Tasks",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15),
            //const TaskCardWidget(),
            /*TaskCardWidget(
              title: "Learn Flutter",
              isDone: false,

              onDelete: () {
                print("Delete Clicked");
              },

              onToggle: (value) {
                print(value);
              },
            ),*/
            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: filteredTasks.length,
                itemBuilder: (context, index) {
                  return TaskCardWidget(
                    title: filteredTasks[index]["title"],
                    isDone: filteredTasks[index]["isDone"],

                    onDelete: () {
                      setState(() {
                        tasks.remove(filteredTasks.removeAt(index));
                      });
                    },

                    onToggle: (value) {
                      setState(() {
                        filteredTasks[index]["isDone"] = value!;
                      });
                    },
                  );
                },
              ),
            ),
            SummaryWidget(
              totalTasks: totalTasks,
              pendingTasks: pendingTasks,
              completedTasks: completedTasks,
            ),
          ],
        ),
      ),
    );
  }
}
