import 'package:break_clean/features/breaking_characters/data/datasources/character_local_data_source.dart';
import 'package:break_clean/features/breaking_characters/data/datasources/character_remote_data_source.dart';
import 'package:break_clean/features/breaking_characters/domain/usecases/get_all_characters.dart';
import 'package:break_clean/features/breaking_characters/presentation/bloc/character_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/breaking_characters/data/repositories/character_repository_impl.dart';
import 'features/breaking_characters/domain/repositories/characters_repository.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //   //! Features
  //   //Bloc
   sl.registerFactory(() => CharacterBloc());
 // sl.registerFactory(() => CharacterBloc(getAllCharacter: sl()));
  //
  //   // Use cases

  sl.registerLazySingleton(() => GetAllCharacter(sl()));
  //   // Repository

  sl.registerLazySingleton<CharactersRepository>(() =>
      CharacterRepositoryImpl(
      networkInfo: sl(), remoteDataSource: sl()));
  //   // Data sources
  sl.registerLazySingleton<CharacterRemoteDataSource>(
        () => CharacterRemoteDataSourceImpl(client: sl()));
  // sl.registerLazySingleton<CharacterLocalDataSource>(
  //   () => CharacterLocalDataSourceImpl(sharedPreferences: sl()),
  // );
  // //! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
