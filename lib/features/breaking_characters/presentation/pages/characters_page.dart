import 'dart:async';
import 'package:break_clean/features/breaking_characters/data/datasources/character_remote_data_source.dart';
import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';
import 'package:break_clean/features/breaking_characters/presentation/bloc/character_bloc.dart';
import 'package:break_clean/features/breaking_characters/presentation/widgets/character_screen_widgets/alert_widget.dart';
import 'package:break_clean/features/breaking_characters/presentation/widgets/character_screen_widgets/app_bar_title.dart';
import 'package:break_clean/features/breaking_characters/presentation/widgets/character_screen_widgets/appbar_actions.dart';
import 'package:break_clean/features/breaking_characters/presentation/widgets/characters_item.dart';
import 'package:break_clean/features/breaking_characters/presentation/widgets/character_screen_widgets/loaded_list.dart';
import 'package:break_clean/features/breaking_characters/presentation/widgets/character_screen_widgets/loading_indicator.dart';
import 'package:break_clean/features/breaking_characters/presentation/widgets/character_screen_widgets/search_filed.dart';
import 'package:break_clean/features/breaking_characters/presentation/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../../../injection_container.dart';

class CharactersPage extends StatefulWidget {
  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {

  late CharacterRemoteDataSourceImpl characterRemoteDataSource = CharacterRemoteDataSourceImpl(client: sl());
  late List<CharacterModel> allCharacters;
  late List<CharacterModel> searchedCharacterList;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();
  late List<CharacterModel> charModel = [];


  @override
  void initState() {
    super.initState();

    charList();

  }
  Widget buildBlocWidget() {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        if (state is Loading) {
          return ShowLoadingIndicator();
        } else
          if (state is CharactersBloc ) {
          allCharacters = charModel;
          return LoadedListWidget(list: buildCharactersList(),);
        }
          return ShowLoadingIndicator();

      },
    );
  }
  Widget buildCharactersList() {
    return Center(
      child: Center(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
          ),
          itemBuilder: (context, index) {
            return CharactersItem(
              character: _searchTextController.text.isEmpty
                  ? allCharacters[index]
                  : searchedCharacterList[index],
            );
          },
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: _searchTextController.text.isEmpty
              ? allCharacters.length
              : searchedCharacterList.length,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: _isSearching ? SearchFiled(
            controller: _searchTextController,
            addSearch: ( searchedCharacter){
          addSearchedItemToCharacterList(searchedCharacter);
            })
            : AppBarTitle(),
        actions:_isSearching ? actions(context: context, search: true, onPressed: _stopSearching):
        actions(context: context, search: false, onPressed: _startSearch)
        ,
        leading: _isSearching
            ? BackButton(

              )
            : Container(),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        )
        {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return buildBlocWidget();
          } else {
            return AlertWidget();
          }
        },
        child: ShowLoadingIndicator(),
      ),
      bottomNavigationBar: NavBar(),

   );
  }

  Future<List<CharacterModel>> charList() async {
     await characterRemoteDataSource.getAllCharacter().then((value) {
      List<CharacterModel> returnList = value;
      charModel = returnList;


    });
    return charModel;
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _searchTextController.clear();
    setState(() {
      _isSearching = false;
    });
  }

  void addSearchedItemToCharacterList(String searchedCharacter) {
    searchedCharacterList = allCharacters
        .where((character) =>
        character.nickName.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }
}









