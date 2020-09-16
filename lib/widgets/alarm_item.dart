import 'package:flutter/material.dart';

Widget alarmItem(hour, enabled){
  return Padding(
    padding: EdgeInsets.all(7.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(hour, style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold
                ),)
              ],
            )
          ],
        ),
      ],
    ),
  );

}