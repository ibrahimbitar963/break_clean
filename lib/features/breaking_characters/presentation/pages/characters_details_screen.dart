import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:break_clean/features/breaking_characters/presentation/widgets/character_details_widgets/divider.dart';
import 'package:break_clean/features/breaking_characters/presentation/widgets/character_details_widgets/rich_widget.dart';
import 'package:break_clean/features/breaking_characters/presentation/widgets/character_details_widgets/sliver_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:io';
import '../../../../core/image_downloader/image downloader.dart';
import 'package:sizer/sizer.dart';

class CharactersDetailsScreen extends StatelessWidget {
 final Character character;

  CharactersDetailsScreen({required this.character});


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
          BuildSliverAppbar(character: character),
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
                          title: 'Jobs'.tr().toString(),
                          value: character.jobs.join('/')),
                      buildDivider(endIndent: 225.sp),
                      characterInfo(
                          title: 'Appeared In'.tr().toString(),
                          value: character.category),
                      buildDivider(endIndent: 225.sp),
                      characterInfo(
                        title: 'Seasons'.tr().toString(),
                        value: character.appearance.join(
                          '/',
                        ),
                      ),
                      buildDivider(endIndent: 225.sp),
                      characterInfo(
                          title: 'Status'.tr().toString(),
                          value: character.statusIfDeadOrAlive),
                      buildDivider(endIndent: 225.sp),
                      character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : characterInfo(
                              title: 'better call saul appearance'.tr().toString(),
                              value: character.betterCallSaulAppearance
                                  .join('/'),),
                      character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : buildDivider(endIndent: 110.sp),
                            SizedBox(height: 50.h,),

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
    floatingActionButton: FloatingActionButton(
      child: Platform.isAndroid? Icon(Icons.download_outlined):
        Icon(CupertinoIcons.cloud_download),
      backgroundColor: Colors.grey,
      onPressed:()=> buildImageDownloader(character.image,context)));

  }


}






