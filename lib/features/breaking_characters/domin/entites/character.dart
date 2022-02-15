

import 'package:equatable/equatable.dart';

class Character extends Equatable{
  late int char_Id;
  late String nickName;
  late String image;
  late List<dynamic> jobs;
  late String statusIfDeadOrAlive;
  late List<dynamic> appearance;
  late String actorName ;
  late List<dynamic> better_call_saul_appearance;

Character({required this.actorName,required this.appearance,required this.better_call_saul_appearance,required this.char_Id,
  required this.image,required this.jobs,required this.nickName,required this.statusIfDeadOrAlive});
  @override
  List<Object> get props => [char_Id, nickName,image,jobs,statusIfDeadOrAlive,appearance,actorName,better_call_saul_appearance];





}