import 'package:exercise_tracker/table_page.dart';
import 'package:flutter/material.dart';

import 'dal/ExercisesSaver.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ExerciseSaver _exerciseSaver = new ExerciseSaver();
    _exerciseSaver.init();
    return MaterialApp(
      title: 'Exercise Tracker',
      theme: ThemeData(
         primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: TablePage(_exerciseSaver),
    );
  }
}
