import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:break_clean/features/breaking_characters/presentation/widgets/character_details_widgets/divider.dart';
import 'package:break_clean/features/breaking_characters/presentation/widgets/character_details_widgets/rich_widget.dart';
import 'package:flutter/material.dart';

class CharactersDetailsScreen extends StatelessWidget {
 final Character character;
  CharactersDetailsScreen({required this.character});

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 570,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.none,
        centerTitle: true,
        title: Text(
          character.actorName,
          textAlign: TextAlign.center,
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
    return RichWidget(
      title: title,
      value: value,
    );
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  height: 500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




