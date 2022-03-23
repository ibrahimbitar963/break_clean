import 'package:break_clean/features/breaking_characters/presentation/pages/characters_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/breaking_characters/presentation/bloc/character_bloc.dart';
import 'injection_container.dart' as di;

void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp(
  ));
}

class MyApp extends StatelessWidget {


  const MyApp({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider<CharacterBloc>(
      create: (context) => CharacterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CharactersPage(),

      ),
    );
  }
}
