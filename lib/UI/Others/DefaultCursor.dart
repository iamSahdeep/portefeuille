import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultCursor extends StatelessWidget{
  final Color color;

  const DefaultCursor({Key key, this.color = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          border: Border.all(
              width: 4,
              color: color,
              style: BorderStyle.solid)),
    );
  }

}