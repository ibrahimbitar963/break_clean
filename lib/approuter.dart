

import 'package:break_clean/features/breaking_characters/domain/repositories/characters_repository.dart';
import 'package:break_clean/features/breaking_characters/presentation/bloc/character_bloc.dart';
import 'package:break_clean/features/breaking_characters/presentation/pages/characters_page.dart';
import 'package:break_clean/injection_container.dart' ;
import 'package:flutter/cupertino.dart';
import 'package:break_clean/core/const/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:break_clean/features/breaking_characters/presentation/pages/characters_page.dart';


class AppRouter {
  late CharactersRepository charactersRepository;

  AppRouter() {
    charactersRepository = sl<CharactersRepository>();
    // quoteRepo = QuoteRepo(CharactersWebServices());
    // charactersCubit = CharachtersCubit(characterRepo,quoteRepo);
  }

  // Route? generateRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case CharactersPages:
  //       return MaterialPageRoute(
  //
  //           child: CharactersPage(), builder: (BuildContext context) {  },
  //
  //       );
  //     // case charactersDetailsScreen:
  //     //   final character = settings.arguments as Character;
  //     //   return MaterialPageRoute(
  //     //     builder: (_) => BlocProvider(
  //     //       create: (BuildContext context) => CharachtersCubit(characterRepo,quoteRepo),
  //     //       child: CharactersDetailsScreen(
  //     //         character: character,
  //     //       ),
  //     //     ),
  //     //   );
  //   }
  // }
}