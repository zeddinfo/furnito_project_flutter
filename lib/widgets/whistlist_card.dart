import 'package:flutter/material.dart';
import 'package:furnito_chart/Models/asset_model.dart';
import 'package:furnito_chart/pages/product_page.dart';
import 'package:furnito_chart/theme.dart';
import 'package:intl/intl.dart';

// @dart=2.9

class WhistlistCard extends StatelessWidget {
  final AssetModel asset;
  NumberFormat numberFormat = NumberFormat.decimalPattern('id');

  WhistlistCard({this.asset});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(asset),
          ),
        );
      },
      child: Container(
          margin: EdgeInsets.only(left: 10),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                height: 300,
                width: 220,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 250,
                      height: 180,
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.network(
                          asset.urlGambar,
                          width: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    asset.namaasset ?? "",
                                    style: primaryTextStyle.copyWith(
                                        fontSize: 16, fontWeight: bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    asset.kota ?? "",
                                    style: subTitleText.copyWith(fontSize: 15),
                                  ),
                                ]),
                          ),
                          Spacer(),
                          // Row(
                          //   children: [
                          //     Icon(
                          //       Icons.star,
                          //       size: 20,
                          //       color: Colors.yellow.shade600,
                          //     ),
                          //     Text(
                          //       '(3.5)',
                          //       style: subTitleText,
                          //     )
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        children: [
                          Text(
                              asset.hargasewa != 0
                                  ? '${numberFormat.format(asset.hargasewa)}'
                                  : '0',
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
          )),
    );
  }
}
