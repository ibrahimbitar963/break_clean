import 'package:break_clean/features/breaking_characters/data/repositories/character_repository_impl.dart';
import 'package:break_clean/features/breaking_characters/presentation/bloc/character_bloc.dart';
import 'package:break_clean/features/breaking_characters/presentation/pages/characters_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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
  final geolocator =
  Geolocator.getCurrentPosition(forceAndroidLocationManager: true);
  late Position _currentPosition;
  String currentAddress = "";

  void getCurrentLocation() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  void getAddressFromLatLng() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        currentAddress =
        "${place.thoroughfare},${place.subThoroughfare},${place.name}, ${place.subLocality}";
      });
    } catch (e) {
      print(e);
    }
  }
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
