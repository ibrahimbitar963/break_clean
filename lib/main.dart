import 'package:break_clean/features/breaking_characters/presentation/pages/characters_page.dart';
import 'package:flutter/material.dart';
import 'package:break_clean/features/breaking_characters/data/datasources/character_remote_data_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'approuter.dart';
import 'features/breaking_characters/presentation/bloc/character_bloc.dart';
import 'injection_container.dart' as di;

void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  print('ssssssssss');
  //di.sl<CharacterRemoteDataSource>().getAllCharacters();
  runApp(MyApp(
  //  appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
//  final AppRouter appRouter;

  const MyApp({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider<CharacterBloc>(
      create: (context) => CharacterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CharactersPage(),
        //onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
