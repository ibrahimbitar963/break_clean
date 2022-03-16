import 'package:equatable/equatable.dart';

class Character extends Equatable {
  late final int charID;
  late final String nickName;
  late final String image;
  late final List<dynamic> jobs;
  late final String statusIfDeadOrAlive;
  late final List<dynamic> appearance;
  late final String actorName;
  late final String category;
  late final List<dynamic> betterCallSaulAppearance;

  Character(
      {required this.actorName,
      required this.charID,
      required this.nickName,
      required this.betterCallSaulAppearance,
      required this.statusIfDeadOrAlive,
      required this.appearance,
      required this.category,
      required this.jobs,
      required this.image});
  @override
  List<Object> get props => [
        charID,
        nickName,
        actorName,
        betterCallSaulAppearance,
        statusIfDeadOrAlive,
        appearance,
        category,
        jobs,
        image
      ];
}
