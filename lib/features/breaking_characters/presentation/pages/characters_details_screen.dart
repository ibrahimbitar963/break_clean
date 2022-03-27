import 'dart:math';

import 'package:break_clean/core/const/colors.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:break_clean/features/breaking_characters/presentation/bloc/character_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersDetailsScreen extends StatelessWidget {
  late Character character;
  CharactersDetailsScreen({required this.character});

  Widget buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: MyColors.myGrey,
      expandedHeight: 570,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.none,
        centerTitle: true,
        title: Text(
          character.actorName,
          textAlign: TextAlign.center,
          style: TextStyle(color: MyColors.myWhite),
        ),
        background: Hero(
          tag: character.charID,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo({required String title, required String value}) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
              text: title,
              style: TextStyle(
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider({required double endIndent}) {
    return Divider(
      endIndent: endIndent,
      color: MyColors.myYellow,
      height: 30,
      thickness: 4,
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




  @override
  Widget build(BuildContext context) {
    //BlocProvider.of<CharacterBloc>(context).getQuote(character.nickName);
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsetsDirectional.fromSTEB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo(
                          title: 'Job :', value: character.jobs.join('/')),
                      buildDivider(endIndent: 275),
                      characterInfo(
                          title: 'Appeared In: ', value: character.category),
                      buildDivider(endIndent: 215),
                      characterInfo(
                        title: 'Seasons: ',
                        value: character.appearance.join(
                          '/',
                        ),
                      ),
                      buildDivider(endIndent: 240),
                      characterInfo(
                          title: 'Status: ',
                          value: character.statusIfDeadOrAlive),
                      buildDivider(endIndent: 260),
                      character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : characterInfo(
                              title: 'better call saul appearance: ',
                              value: character.betterCallSaulAppearance
                                  .join('/')),
                      character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : buildDivider(endIndent: 92),
                            SizedBox(height: 50,),

                    ],
                  ),
                ),
                SizedBox(
                  height: 300,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
