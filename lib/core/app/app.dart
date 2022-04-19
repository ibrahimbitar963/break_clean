import 'package:break_clean/features/breaking_characters/data/repositories/character_repository_impl.dart';
import 'package:break_clean/features/breaking_characters/presentation/bloc/character_bloc.dart';
import 'package:break_clean/features/breaking_characters/presentation/pages/characters_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';
import 'package:theme_mode_handler/theme_mode_manager_interface.dart';
import '../../app_router.dart';
import '../../injection_container.dart';
import '../const/themes.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key, required this.appRouter, required this.themeModeManager})
      : super(key: key);
  final AppRouter appRouter;
  final IThemeModeManager themeModeManager;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late CharacterRepositoryImpl charactersRepositoryImpl;

  @override
  Widget build(BuildContext context) {
    charactersRepositoryImpl = CharacterRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
      localDataSource: sl(),
    );
    return BlocProvider<CharacterBloc>(
      create: (context) => CharacterBloc(charactersRepositoryImpl),
      child: ThemeModeHandler(
        manager: widget.themeModeManager,
        builder: (ThemeMode themeMode) {
          return Sizer(
            builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
              return MaterialApp(
                localizationsDelegates: context.localizationDelegates,
                locale: context.locale,
                supportedLocales: context.supportedLocales,
                onGenerateRoute: widget.appRouter.generateRoute,
                themeMode: themeMode,
                theme: Themes.myLight,
                darkTheme: Themes.myDark,
                debugShowCheckedModeBanner: false,
                home: CharactersPage(),
              );
            },

          );
        },
      ),
    );
  }
}
