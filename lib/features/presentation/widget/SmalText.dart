import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color color;
  final String text;
  double size;
  double height;


  SmallText(
      {Key? key,
      this.color = const Color(0xFFccc7c5),
      this.text = "",
        this.height=1.2,
      this.size = 12.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontFamily: 'Roboto',
          color: color,
          fontSize: size,
        height: height,
        fontWeight: FontWeight.w400
      ),
    );
  }
}
