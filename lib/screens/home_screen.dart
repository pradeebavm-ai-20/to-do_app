import 'package:flutter/material.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/task_card_widget.dart';

//final TextEditingController controller = TextEditingController();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();

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
    return Scaffold(
      drawer: const Drawer(),

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
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskCardWidget(
                    title: tasks[index]["title"],
                    isDone: tasks[index]["isDone"],

                    onDelete: () {
                      setState(() {
                        tasks.removeAt(index);
                      });
                    },

                    onToggle: (value) {
                      setState(() {
                        tasks[index]["isDone"] = value!;
                      });
                    },
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
