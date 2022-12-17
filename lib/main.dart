import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_helper/blocs/workouts_cubit.dart';
import 'package:gym_helper/models/workout.dart';
import 'package:gym_helper/screens/edit_workouts_screen.dart';
import 'package:gym_helper/screens/home_page.dart';
import 'package:gym_helper/states/workout_states.dart';

import 'blocs/workout_cubit.dart';

void main() => runApp(WorkoutTime());

class WorkoutTime extends StatelessWidget {
  const WorkoutTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Workouts',
      theme: ThemeData(
          primaryColor: const Color(0xffda4ad2),
          textTheme: const TextTheme(
            bodyText2: TextStyle(color: Color.fromARGB(255, 66, 74, 96)),
          )),

      home: MultiBlocProvider(
        providers: [
          BlocProvider<WorkoutsCubit>(
            create: (context) {
              WorkoutsCubit workoutsCubit = WorkoutsCubit();
              if (workoutsCubit.state.isEmpty) {
                workoutsCubit.getWorkouts();
              }
              return workoutsCubit;
            },
          ),
          BlocProvider<WorkoutCubit>(create: (context)=> WorkoutCubit()),
        ],
        child: BlocBuilder<WorkoutCubit, WorkoutState>(
            builder: (context, state) {
              if(state is WorkoutInitialState)
                {
                  return const HomePage();
                }else if(state is WorkoutEditing)
                  {
                    return const EditWorkoutScreen();
                  }
              return Container();


        }),
      ),
    );
  }
}
