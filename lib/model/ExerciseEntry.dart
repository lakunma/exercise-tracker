import 'package:intl/intl.dart';

class ExerciseEntry {
  final int id;
  final String exerciseName;
  final double amountOfExercise;
  final DateTime dateOfExercise;

  ExerciseEntry(
      this.id, this.exerciseName, this.amountOfExercise, this.dateOfExercise);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'exercise_name': exerciseName,
      'amount_of_exercise': amountOfExercise,
      'date_of_exercise': DateFormat('yyyy-MM-dd').format(dateOfExercise)
    };
  }
}
