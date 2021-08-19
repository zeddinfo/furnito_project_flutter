import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:furnito_chart/Models/asset_model.dart';
import 'package:furnito_chart/theme.dart';

class ProductPage extends StatefulWidget {
  final AssetModel asset;
  ProductPage(this.asset);
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/images/chair.png',
    'assets/images/chair_new.png',
    'assets/images/couch.png'
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: currentIndex == index ? primaryColor : Colors.grey),
      );
    }

    int index = -1;

    Widget header() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: primaryColor,
                  ),
                ),
                Icon(
                  Icons.shopping_bag,
                  color: primaryColor,
                )
              ],
            ),
          ),
          CarouselSlider(
              items: images
                  .map((image) => Image.asset(
                        image,
                        width: MediaQuery.of(context).size.width,
                        height: 310,
                        fit: BoxFit.contain,
                      ))
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  })),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          )
        ],
      );
    }

    Widget familiarAssets(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(right: 16),
        child: Image.asset(
          imageUrl,
        ),
      );
    }

    Widget content() {
      int index = -1;

      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            color: Colors.grey.shade300),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Le Chair',
                          style: primaryTextStyle.copyWith(
                              fontSize: 17, fontWeight: semiBold),
                        ),
                        Text('Couch Chair',
                            style: subTitleText.copyWith(
                                fontSize: 12, color: secondary))
                      ],
                    )),
                    ElevatedButton(
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
                  ],
                )),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 20, left: 30, right: 30),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: primaryColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Prices start from',
                      style: primaryTextStyle.copyWith(color: Colors.white)),
                  Text(
                    'Rp. 20.000',
                    style: secondaryText.copyWith(fontWeight: semiBold),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: secondaryText.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Lorem Ipsum dolor amet abc Lorem Ipsum dolor amet',
                    style:
                        subTitleText.copyWith(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Familiar Assets',
                    style: secondaryText.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: images.map((image) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(left: index == 0 ? 30 : 0),
                          child: familiarAssets(image),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(30.0),
              child: Row(
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                        color: secondary,
                        borderRadius: BorderRadius.circular(7)),
                    child: Icon(Icons.message, color: Colors.white),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      height: 55,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              )),
                          onPressed: () {},
                          child: Text(
                            'Add to Cart',
                            style:
                                whiteTextStyle.copyWith(fontWeight: semiBold),
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        children: [header(), content()],
      ),
    );
  }
}
