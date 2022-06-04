import 'package:flutter/material.dart';
import 'package:multi_listview/exercise.dart';
import 'package:multi_listview/full_set_widget.dart';
import 'package:multi_listview/set_row.dart';
import 'package:multi_listview/workout_finished_screen.dart';

List<Set_row> list = [];
List<Set_row> listFinishedSets = [];
List<Exercise> listExercises = [];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Sets'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 48, 48, 48),
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => MyWidget(),
                ));
              },
              child: Text(
                "Finish Workout",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.4,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return FullSetWidget(index);
                },
                itemCount: listExercises.length,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  listExercises.add(
                    new Exercise("Bench Press"),
                  );
                });
              },
              child: Text("Add Exercise"),
            ),
          ],
        ),
      ),
    );
  }
}
