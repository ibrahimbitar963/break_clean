

import 'package:equatable/equatable.dart';

class Character extends Equatable{
  late int char_Id;
  late String nickName;
  late String actorName ;

Character({required this.actorName,required this.char_Id,
 required this.nickName});
  @override
  List<Object> get props => [char_Id, nickName,actorName];





}