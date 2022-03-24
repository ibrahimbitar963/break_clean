import 'package:break_clean/core/const/colors.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharactersItem extends StatelessWidget {
  late final Character character;
  CharactersItem({required this.character});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).accentColor ,
      ),
      child: GridTile(
        child: Hero(
          tag: character.charID,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: MyColors.myGrey,
            child: character.image.isNotEmpty?
            FadeInImage.assetNetwork( fit: BoxFit.cover,
                placeholder: 'assets/images/loading.gif' ,
                image: character.image)
                : Image.asset('assets/images/placeholders.jpg'),
          ),
        ),
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10,),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            '${character.nickName}',
            style: TextStyle(
              height: 1.3,
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
