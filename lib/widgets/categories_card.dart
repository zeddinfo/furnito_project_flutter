import 'package:flutter/material.dart';
import 'package:furnito_chart/theme.dart';

class CategoriesCard extends StatelessWidget {
  final String title;
  final String icon;
  final Color color1;
  final Color color2;
  final double width;
  final double top;
  final double left;
  final double right;
  CategoriesCard(
      {required this.title,
      required this.icon,
      required this.color1,
      required this.color2,
      required this.width,
      required this.top,
      required this.right,
      required this.left});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: color2.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [color1, color2]),
            ),
            alignment: Alignment.centerRight,
            width: 110,
            height: 110,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: primaryTextStyle.copyWith(
                    fontWeight: bold, fontSize: 23, letterSpacing: 1.0),
              ),
            ),
          ),
          Positioned(
            left: left,
            top: top,
            right: right,
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                icon,
                width: width,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
