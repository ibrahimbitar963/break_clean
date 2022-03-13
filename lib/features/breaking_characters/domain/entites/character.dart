

import 'package:equatable/equatable.dart';

class Character extends Equatable{
  late int char_Id;
  late String nickName;
  late String image;
  late List<dynamic> jobs;
  late String StatusIfDeadOrAlive;
  late List<dynamic> appearance;
  late String actorName;
  late String category;
  late List<dynamic> better_call_saul_appearance;

Character({required this.actorName,required this.char_Id,
 required this.nickName,required this.better_call_saul_appearance,required this.StatusIfDeadOrAlive,
  required this.appearance,required this.category,required this.jobs,required this.image});
  @override
  List<Object> get props => [char_Id, nickName,actorName,better_call_saul_appearance,StatusIfDeadOrAlive,appearance,category,jobs,image];





}

// class CharachtersCubit extends Cubit<CharachtersState> {
//   late CharacterRepo characterRepo;
//   late QuoteRepo quoteRepo;
//   List<Character> characters= [];
//   CharachtersCubit( this.characterRepo,this.quoteRepo) : super(CharachtersInitial());
//
//
//
//   List<Character> getAllCharacter(){
//     characterRepo.getAllCharacters().then((characters) {
//       emit(CharachtersLoaded(characters));
//       this.characters = characters;
//     });
//     return characters;
//   }