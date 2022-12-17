import 'package:equatable/equatable.dart';

import 'exercise.dart';

// Equatable make our class responsive to changes becomes kind of stateful
// this class becomes more dynamic

class Workout extends Equatable{
  final String ?title;
  final List<Exercise> exercises;

  const Workout({ required this.title,required this.exercises});

  factory Workout.fromJson(Map<String,dynamic> json)
  {
    List<Exercise> exercises=[];
    int index=0;
    int startTime=0;

    // as Iterable help me to use index to reach each exercise with that index
    for(var ex in(json['exercises'] as Iterable))
      {
        exercises.add(Exercise.fromJson(ex, index, startTime));
        index++;
        startTime += exercises.last.prelude!+exercises.last.duration!;
      }
    return Workout(title: json['title'] as String?, exercises: exercises);
  }

  Map<String, dynamic> toJson() => {
    "title": title,
    "exercises": exercises,
  };

  @override
  // TODO: implement props
  // in prop getter w specify which objects would change and if change i will let the UI to know
  List<Object?> get props => [
    title,
    exercises
  ];

  @override
  // if stringify set to true that will mapPropsToString
  bool get stringify => true;

  int getTotalTime(){
    // we set initial value to zero then add to it next values
   int time= exercises.fold(0, (prev, ex) => prev + ex.duration!+ex.prelude!);
   return time;
  }

}