import 'package:flutter/material.dart';

class buildDivider extends StatelessWidget {
  const buildDivider({
    Key? key,
    required this.endIndent,
  }) : super(key: key);

  final double endIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      endIndent: endIndent,
      height: 30,
      thickness: 4,


    );
  }
}