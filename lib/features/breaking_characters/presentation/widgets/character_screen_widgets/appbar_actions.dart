import 'package:flutter/material.dart';

List<Widget>? actions({required BuildContext context,
    required bool search,
    required VoidCallback onPressed}) {
  if (search) {
    return [
      IconButton(
        onPressed: () {
          onPressed();
          Navigator.pop(context);
        },
        icon: Icon(Icons.clear),
        //color: MyColors.myGrey,
      ),
    ];
  } else {
    return [
      IconButton(
        onPressed: () {
          onPressed();
        },
        icon: Icon(
          Icons.search,
          // color: MyColors.myGrey,
        ),
      ),
    ];
  }
}
