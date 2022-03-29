
import 'package:break_clean/core/local/app_local.dart';
import 'package:flutter/cupertino.dart';

 translator (BuildContext context, String str){


  final tr = AppLocalizations.of(context)!.translate(str);

  return  tr ;
}