import 'package:break_clean/features/breaking_characters/domain/repositories/characters_repository.dart';
import 'package:break_clean/features/breaking_characters/presentation/bloc/character_bloc.dart';
import 'package:break_clean/features/breaking_characters/presentation/pages/characters_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/const/strings.dart';
import 'features/breaking_characters/data/repositories/character_repository_impl.dart';
import 'features/breaking_characters/domain/entites/character.dart';
import 'features/breaking_characters/presentation/pages/characters_details_screen.dart';
import 'injection_container.dart';



class AppRouter {
  late CharacterRepositoryImpl characterRepo;
  // late QuoteRepo quoteRepo;
  late CharacterBloc characterBloc;
  AppRouter() {
    characterRepo = CharacterRepositoryImpl(localDataSource: sl(), remoteDataSource: sl(), networkInfo: sl());
    // quoteRepo = QuoteRepo(CharactersWebServices());
    characterBloc = CharacterBloc(characterRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CharactersPages:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => CharacterBloc(characterRepo),
                  child: CharactersPage(),
                ),
        );
      case charactersDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>  CharacterBloc(characterRepo),
            child: CharactersDetailsScreen(
              character: character,
            ),
          ),
        );
    }
  }
}
