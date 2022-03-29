import 'package:break_clean/core/const/themes.dart';
import 'package:break_clean/features/breaking_characters/presentation/pages/characters_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'app_router.dart';
import 'features/breaking_characters/data/repositories/character_repository_impl.dart';
import 'features/breaking_characters/presentation/bloc/character_bloc.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp(appRouter: AppRouter(),

  ));

}

class MyApp extends StatelessWidget {
   MyApp({Key? key, required this.appRouter}) : super(key: key);
  late   CharacterRepositoryImpl charactersRepositoryImpl;
  final AppRouter appRouter;



  @override
  Widget build(BuildContext context) {
  charactersRepositoryImpl = CharacterRepositoryImpl(remoteDataSource: sl(), networkInfo: sl(), localDataSource: sl(),);
    return ChangeNotifierProvider(
      create: (context)=>ThemeChecker(),
      builder: (context,_) {
        final themeProvider = Provider.of<ThemeChecker>(context);


       return BlocProvider<CharacterBloc>(
          create: (context) => CharacterBloc(charactersRepositoryImpl),
          child: MaterialApp(
            onGenerateRoute: appRouter.generateRoute,
            themeMode: themeProvider.themeMode,
            theme: Themes.myLight,
            darkTheme: Themes.myDark,

            debugShowCheckedModeBanner: false,
            home: CharactersPage(),

          ),
        );

      },
    );
  }
}
