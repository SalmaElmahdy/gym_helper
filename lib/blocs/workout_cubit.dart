import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/workout.dart';

import '../states/workout_states.dart';

class WorkoutCubit extends Cubit<WorkoutState>{
  WorkoutCubit():super(const WorkoutInitialState());

  editWorkout(Workout workout,int index)=>
      emit(WorkoutEditing(workout, index,null));

  editExercise(int exIndex)=>
      emit(WorkoutEditing(state.workout,(state as WorkoutEditing).index,exIndex));




  goHome()=>emit(const WorkoutInitialState());


}