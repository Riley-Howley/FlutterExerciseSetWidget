import 'package:flutter/material.dart';
import 'package:multi_listview/formatted_table.dart';
import 'package:multi_listview/main.dart';
import 'package:multi_listview/set_row.dart';

class FullSetWidget extends StatefulWidget {
  int nameIndex;
  FullSetWidget(this.nameIndex);
  @override
  State<FullSetWidget> createState() => _FullSetWidgetState();
}

class _FullSetWidgetState extends State<FullSetWidget> {
  List<Set_row> listOfSets = [];
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              listExercises[widget.nameIndex].ExerciseName,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        FormattedSetTable(),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return listOfSets[index];
            },
            itemCount: listOfSets.length,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            listOfSets.add(new Set_row(
              count++,
              0,
              0,
              false,
            ));
            setState(() {});
          },
          child: Text(
            "Add Set",
          ),
        ),
      ],
    );
  }
}
