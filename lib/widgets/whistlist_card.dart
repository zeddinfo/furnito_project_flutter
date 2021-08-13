import 'package:flutter/material.dart';
import 'package:furnito_chart/theme.dart';

class WhistlistCard extends StatelessWidget {
  final String title;
  final String description;
  final String star;
  final int harga;

  WhistlistCard(
      {required this.title,
      required this.description,
      required this.star,
      required this.harga});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
          height: 250,
          width: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/chair.png',
                  width: 250,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lorem Ipsum',
                            style: primaryTextStyle.copyWith(
                                fontSize: 16, fontWeight: bold),
                          ),
                          Text(
                            'BoConcept',
                            style: subTitleText.copyWith(fontSize: 15),
                          ),
                        ]),
                    Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Colors.yellow.shade600,
                        ),
                        Text(
                          '(3.5)',
                          style: subTitleText,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    Text('20.000',
                        style: primaryTextStyle.copyWith(
                            fontWeight: bold, fontSize: 15)),
                    Spacer(),
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.favorite,
                              color: secondary,
                              size: 18,
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(5),
                              primary: primaryColor, // <-- Button color
                              onPrimary: Colors.red, // <-- Splash color
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 1,
                        ),
                        SizedBox(
                          width: 40,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 18,
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(5),
                              primary: buttonPlus, // <-- Button color
                              onPrimary: Colors.red, // <-- Splash color
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
