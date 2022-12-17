import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_helper/blocs/workouts_cubit.dart';
import 'package:gym_helper/helpers.dart';
import 'package:gym_helper/models/workout.dart';

import '../blocs/workout_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Time!'),
        actions: const [
          IconButton(onPressed: null,
              icon:Icon(Icons.event),),
          IconButton(onPressed: null,
            icon:Icon(Icons.settings),),
        ],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<WorkoutsCubit,List<Workout>>(
          builder: (context,workouts)=>
          ExpansionPanelList.radio(
            // map each work out to ExpansionPanelRadio
            children: workouts.map((workout) =>
                ExpansionPanelRadio(
                    value: workout
                    , headerBuilder: (context,isExpanded)=>
                     ListTile(
                        visualDensity: const VisualDensity(
                          horizontal: 0,
                        vertical: VisualDensity.maximumDensity),
                        leading:  IconButton(
                            onPressed: (){
                              BlocProvider.of<WorkoutCubit>(context)
                              .editWorkout(workout, workouts.indexOf(workout));
                            },
                            icon: Icon(Icons.edit)),
                        title: Text(workout.title!),
                        trailing:Text(formatTime(workout.getTotalTime(), true)) ,
                ),

                    // map each exercise of that workout
                    body: ListView.builder(
                     physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: workout.exercises.length,
                        itemBuilder: (context, index)=>
                          ListTile(
                            onTap: null,
                            visualDensity: const VisualDensity(
                                horizontal: 0,
                                vertical: VisualDensity.maximumDensity),
                            leading:Text(formatTime(workout.exercises[index].prelude!, true)),
                            title: Text(workout.exercises[index].title!),
                            trailing: Text(formatTime(workout.exercises[index].duration!, true
                            )),
                          )
                        ))).toList(),


          ),
        )
      ),
    );
  }
}
