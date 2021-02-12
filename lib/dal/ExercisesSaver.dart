import 'dart:async';

import 'package:exercise_tracker/model/ExerciseEntry.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ExerciseSaver {
  Future<Database> database;

  void init() async {
    WidgetsFlutterBinding.ensureInitialized();
    database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'exercises.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          "CREATE TABLE exercise(id INTEGER PRIMARY KEY, exercise_name TEXT, amount_of_exercise REAL, date_of_exercise TEXT)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  Future<void> insertExercise(ExerciseEntry exerciseEntry) async {
    final Database db = await database;
    await db.insert(
      'exercise',
      exerciseEntry.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
