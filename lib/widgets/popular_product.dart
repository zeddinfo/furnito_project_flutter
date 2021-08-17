import 'package:flutter/material.dart';
import 'package:furnito_chart/theme.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
          child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 10),
            child: Image.asset(
              'assets/images/couch.png',
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chair',
                  style: subTitleText.copyWith(fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Larachair s50',
                  style:
                      primaryTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '500.000',
                  style: secondaryText.copyWith(
                      fontSize: 17, fontWeight: semiBold),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
