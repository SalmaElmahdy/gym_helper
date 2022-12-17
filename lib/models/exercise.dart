import 'dart:convert';

import 'package:equatable/equatable.dart';

// Exercise exerciseFromJson(String str) => Exercise.fromJson(json.decode(str));

String exerciseToJson(Exercise data) => json.encode(data.toJson());

class Exercise  extends Equatable{
  Exercise( {
    // named optional parameters
    required this.title,
    required this.prelude,
    required this.duration,
    this.index,
    this.startTime
  });

  final String? title;
  final int? prelude;
  final int? duration;
  final int? index;
  final int? startTime;

  factory Exercise.fromJson(Map<String, dynamic> json, int index, int startTime) => Exercise(
    title: json["title"],
    prelude: json["prelude"],
    duration: json["duration"],
    index: index,
    startTime: startTime
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "prelude": prelude,
    "duration": duration,
  };

  @override
  // TODO: implement props
  List<Object?> get props =>
  [
    title,
    prelude,
    duration,
    index,
    startTime
  ];

  @override
  // if stringify set to true that will mapPropsToString
  bool get stringify => true;
}