import 'package:editable/editable.dart';
import 'package:exercise_tracker/dal/ExercisesSaver.dart';
import 'package:exercise_tracker/model/ExerciseEntry.dart';
import 'package:flutter/material.dart';

//try also https://pub.dev/packages/pluto_grid

class TablePage extends StatefulWidget {
  @override
  _TablePageState createState() => _TablePageState(_exerciseSaver);

  final ExerciseSaver _exerciseSaver;

  TablePage(this._exerciseSaver);
}

class _TablePageState extends State<TablePage> {
  //row data
  List rows = [
    {
      "name": 'James Peter',
      "date": '01/08/2007',
      "month": 'March',
      "status": 'beginner'
    },
    {
      "name": 'Okon Etim',
      "date": '09/07/1889',
      "month": 'January',
      "status": 'completed'
    },
    {
      "name": 'Samuel Peter',
      "date": '11/11/2002',
      "month": 'April',
      "status": 'intermediate'
    },
    {
      "name": 'Udoh Ekong',
      "date": '06/3/2020',
      "month": 'July',
      "status": 'beginner'
    },
    {
      "name": 'Essien Ikpa',
      "date": '12/6/1996',
      "month": 'June',
      "status": 'completed'
    },
  ];

//Headers or Columns
  List headers = [
    {"title": 'Name', 'index': 1, 'key': 'name'},
    {"title": 'Date', 'index': 2, 'key': 'date'},
    {"title": 'Month', 'index': 3, 'key': 'month'},
    {"title": 'Status', 'index': 4, 'key': 'status'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Editable(
            columns: headers,
            rows: rows,
            showCreateButton: true,
            tdStyle: TextStyle(fontSize: 20),
            showSaveIcon: true,
            borderColor: Colors.grey.shade300,
            onSubmitted: (value) {
              print(value);
            },
            onRowSaved: (value) {
              print("saved $value");
              i += 1;
              ExerciseEntry exercise =
                  new ExerciseEntry(i, value, 1.2, DateTime.now());
              _exerciseSaver.insertExercise(exercise);
            }));
  }

  int i = 0;
  ExerciseSaver _exerciseSaver;

  _TablePageState(ExerciseSaver exerciseSaver) {
    _exerciseSaver = exerciseSaver;
  }
}
