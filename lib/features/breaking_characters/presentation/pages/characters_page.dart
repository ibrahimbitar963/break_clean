import 'package:break_clean/core/const/colors.dart';
import 'package:break_clean/features/breaking_characters/data/datasources/character_remote_data_source.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:break_clean/features/breaking_characters/domain/usecases/get_all_characters.dart';
import 'package:break_clean/features/breaking_characters/presentation/bloc/character_bloc.dart';
import 'package:break_clean/features/breaking_characters/presentation/widgets/characters_item.dart';
import 'package:flutter/material.dart';
import 'package:break_clean/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class CharactersPage extends StatefulWidget {
  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
 final CharacterBloc _exampleBloc = CharacterBloc();



  late List<Character> allCharacters;
  late List<Character> searchedCharacterList;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  Widget _buildSearchField() {
    return TextField(
      autofocus: true,
      controller: _searchTextController,
      cursorColor: MyColors.myGrey,
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 18, color: MyColors.myGrey),
        hintText: 'Find a character',
        border: InputBorder.none,
      ),
      style: TextStyle(fontSize: 18, color: MyColors.myGrey),
      onChanged: (searchedCharacter) {
        addSearchedItemToCharacterList(searchedCharacter);
      },
    );
  }

  void addSearchedItemToCharacterList(String searchedCharacter) {
    searchedCharacterList = allCharacters
        .where((character) =>
        character.nickName.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

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

  @override
  void initState() {
    super.initState();
   // BlocProvider.of<CharacterBloc>(context).getAllCharacter;
   //  di.sl<CharacterRemoteDataSource>().getAllCharacters();
    context.read<CharacterBloc>().add(GetAllCharacterEvent());

  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        if (state is Loaded) {
          // allCharacters = (state);
          print('loaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaded');
          return buildLoadedListWidgets();
        } else  if (state is Loading) {
          print('looooooooooooooooooooooodinnnnnnnnng');
          return showLoadingIndicator();
        }
        else  if( state is Empty){
          print('empty');
          context.read<CharacterBloc>().add(GetAllCharacterEvent());
          allCharacters = (state).characters;
          // print(state.characters.length);
          // print(allCharacters.length);

          return buildLoadedListWidgets();


          }
        else  if( state is Error){
          print('error');
          return showLoadingIndicator();
        }
        else {
          print('noooooooooooooooosttate');
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: Container(
        child: CircularProgressIndicator(
          color: MyColors.myYellow,
        ),
      ),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
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

  Widget _buildAppBarTitle() {
    return Text(
      'Characters',
      style: TextStyle(color: MyColors.myGrey),
    );
  }

  Widget buildAlertWidget() {
    return Center(

      child: Container(
        color: Colors.white70,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Please check your internet connection'
                , style: TextStyle(
                    color: MyColors.myYellow,
                    fontSize: 18,
                    fontWeight: FontWeight.bold

                ),),
              SizedBox(height: 20,),
              Image.asset('assets/images/notify.png',

              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
        leading: _isSearching
            ? BackButton(
          color: MyColors.myGrey,
        )
            : Container(),
      ),
      body: OfflineBuilder(connectivityBuilder: (BuildContext context,
          ConnectivityResult connectivity,
          Widget child,) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {
          return buildBlocWidget();
        } else {
          return buildAlertWidget();
        }
      },
        child: showLoadingIndicator(),
      ),

    );
  }
}
