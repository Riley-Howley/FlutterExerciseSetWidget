import 'package:flutter/material.dart';
import 'package:multi_listview/exercise.dart';
import 'package:multi_listview/full_set_widget.dart';
import 'package:multi_listview/set_row.dart';

List<Set_row> list = [];

List<Exercise> listExercises = [];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  List<Set_row> listFinishedSets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 48, 48, 48),
      appBar: AppBar(
        title: Text(widget.title),
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
