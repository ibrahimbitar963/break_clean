import 'package:flutter/material.dart';
import 'package:break_clean/features/breaking_characters/data/datasources/character_remote_data_source.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();


  await di.init();
  print('ssssssssss');
  di.sl<CharacterRemoteDataSource>().getAllCharacters();

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: Text(''),
      ),
    );
  }
}

