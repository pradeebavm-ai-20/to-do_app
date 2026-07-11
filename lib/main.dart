/*import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'TO-DO APP',
      theme: ThemeData(
        //colorScheme: .fromSeed(seedColor: Colors.//deepPurple),
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'TO-DO APP'),
      //home: const HomeScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;
  List<Map<String, dynamic>> tasks = [];

  final TextEditingController controller = TextEditingController();

  /*void _incrementCounter() {
    setState(() {
      
      _counter++;
    });
  }*/

  void addTask() {
    if (controller.text.isNotEmpty) {
      setState(() {
        tasks.add({"title": controller.text, "isDone": false});
      });

      controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalTasks = tasks.length;

    int completedTasks = tasks.where((task) => task['isDone'] == true).length;

    int pendingTasks = totalTasks - completedTasks;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('ADD YOUR TASKS:'),
            Text(
              //'$_counter',
              //controller: controller,
              controller.text,

              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter your task'),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index]['title']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: tasks[index]['isDone'],
                        onChanged: (value) {
                          setState(() {
                            tasks[index]['isDone'] = value;
                          });
                        },
                      ),

                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            tasks.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                  /*trailing: Checkbox(
                    value: tasks[index]['isDone'],
                    onChanged: (value) {
                      setState(() {
                        tasks[index]['isDone'] = value;
                      });
                    },
                  ), */
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text("Total Tasks : $totalTasks"),
                Text("Pending Tasks : $pendingTasks"),
                Text("Completed Tasks : $completedTasks"),
              ],
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        onPressed: addTask,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
*/
//              TO-DO APP
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todo App",
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      home: const HomeScreen(),
    );
  }
}
