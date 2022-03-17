import 'dart:async';

import 'package:break_clean/core/const/colors.dart';
import 'package:break_clean/features/breaking_characters/data/datasources/character_remote_data_source.dart';
import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';
import 'package:break_clean/features/breaking_characters/presentation/bloc/character_bloc.dart';
import 'package:break_clean/features/breaking_characters/presentation/widgets/alert_widget.dart';
import 'package:break_clean/features/breaking_characters/presentation/widgets/app_bar_title.dart';
import 'package:break_clean/features/breaking_characters/presentation/widgets/appbar_actions.dart';
import 'package:break_clean/features/breaking_characters/presentation/widgets/characters_item.dart';
import 'package:break_clean/features/breaking_characters/presentation/widgets/loaded_list.dart';
import 'package:break_clean/features/breaking_characters/presentation/widgets/loading_indicator.dart';
import 'package:break_clean/features/breaking_characters/presentation/widgets/search_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../../../injection_container.dart';

class CharactersPage extends StatefulWidget {
  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {

  late CharacterRemoteDataSourceImpl characterRemoteDataSource =
  CharacterRemoteDataSourceImpl(client: sl());
  late List<CharacterModel> allCharacters;
  late List<CharacterModel> searchedCharacterList;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();
  late List<CharacterModel> charModel = [];




  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _stopSearching();
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear),
          color: MyColors.myGrey,
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: () {
            _startSearch();
          },
          icon: Icon(
            Icons.search,
            color: MyColors.myGrey,
          ),
        ),
      ];
    }
  }



  @override
  void initState() {
    super.initState();
    CircularProgressIndicator();
    charList();
    context.read<CharacterBloc>().add(GetAllCharacterEvent());
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        if (state is Loaded) {
          return LoadedListWidget(list: buildCharactersList(),);
        } else if (state is Loading) {
          return ShowLoadingIndicator();
        } else if (state is Empty) {
          ShowLoadingIndicator();
          context.read<CharacterBloc>().add(GetAllCharacterEvent());
          allCharacters = charModel;
          return LoadedListWidget(list: buildCharactersList(),);
        } else if (state is Error) {
          return ShowLoadingIndicator();
        } else {
          return ShowLoadingIndicator();
        }
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
        backgroundColor: MyColors.myYellow,
        title: _isSearching ? SearchFiled(
            controller: _searchTextController,
            addsearch: ( searchedCharacter){
          addSearchedItemToCharacterList(searchedCharacter);
            })
            : AppBarTitle(),
        actions:_isSearching ? actions(context: context, search: true, onpressed: _stopSearching):
        actions(context: context, search: false, onpressed: _startSearch)
        ,
        leading: _isSearching
            ? BackButton(
                color: MyColors.myGrey,
              )
            : Container(),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return buildBlocWidget();
          } else {
            return AlertWidget();
          }
        },
        child: ShowLoadingIndicator(),
      ),
    );
  }
  Future<List<CharacterModel>> charList() async {


    characterRemoteDataSource.getAllCharacter().then((value) {
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




