import 'package:flutter/material.dart';

class BottomBarColumn extends StatelessWidget {
  final String heading;
  final String s1;
  final String s2;
  final String s3;

  BottomBarColumn({
    required this.heading,
    required this.s1,
    required this.s2,
    required this.s3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //heading
          Text(
            heading,
            style: TextStyle(
              color: Colors.white60,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 10,
          ),

          //s1
          Text(
            s1,
            style: TextStyle(
              color: Colors.white60,
              fontSize: 14,
            ),
          ),

          //s2
          Text(
            s2,
            style: TextStyle(
              color: Colors.white60,
              fontSize: 14,
            ),
          ),

          //s3
          Text(
            s3,
            style: TextStyle(
              color: Colors.white60,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
