import 'package:break_clean/core/const/strings.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
        color: Theme.of(context).accentColor,
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context,charactersDetailsScreen,arguments: character),
        child: GridTile(
          child: Hero(
            tag: character.charID,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: character.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      placeholder: 'assets/images/loading.gif',
                      image: character.image)
                  : Image.asset('assets/images/placeholders.jpg'),
            ),
          ),
          footer: Container(
            width: double.infinity,

            padding: EdgeInsets.symmetric(

              horizontal: 2.h,
              vertical: 1.2.h,
            ),
            color: Theme.of(context).accentColor,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${character.nickName}',
              style: TextStyle(
                height: 0.17.h,
                fontWeight: FontWeight.bold,
                fontSize: 12.5.sp,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
