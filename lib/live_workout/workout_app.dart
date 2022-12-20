import 'package:flutter/material.dart';
import 'package:flutter_drawer_example/live_workout/src/ui/home_page.dart';

class FitnessWorkoutApp extends StatelessWidget {
  const FitnessWorkoutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FitnessWorkoutHomePage(),
    );
  }
}
