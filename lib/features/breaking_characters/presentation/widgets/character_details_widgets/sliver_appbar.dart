import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:flutter/material.dart';

class BuildSliverAppbar extends StatelessWidget {
  const BuildSliverAppbar({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
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
}