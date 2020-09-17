import 'package:flutter/material.dart';

Widget circleDay(day, context, enabled){
return Container(
  width: 50.0,
  height: 50.0,
  decoration: BoxDecoration(
    color: (enabled)?Theme.of(context).accentColor:Colors.transparent,
    borderRadius: BorderRadiusDirectional.circular(100.0)

  ),
);
}