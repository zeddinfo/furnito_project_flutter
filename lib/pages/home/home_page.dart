import 'package:flutter/material.dart';
import 'package:furnito_chart/theme.dart';
import 'package:furnito_chart/widgets/categories_card.dart';
import 'package:furnito_chart/widgets/popular_product.dart';
import 'package:furnito_chart/widgets/whistlist_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'FURNITO',
          style: primaryTextStyle.copyWith(fontSize: 15, fontWeight: bold),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: primaryColor,
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.shop_2_outlined,
                  color: primaryColor,
                )
              ],
            ),
          )
        ],
      );
    }

    Widget categories() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CategoriesCard(
                  title: 'CHAIR',
                  icon: 'assets/images/chair_new.png',
                  color1: Colors.white,
                  width: 40,
                  top: -25,
                  left: 20,
                  right: 20,
                  color2: Colors.brown.shade400),
              SizedBox(
                width: 10,
              ),
              CategoriesCard(
                  title: 'COUCH',
                  icon: 'assets/images/couch.png',
                  color1: Colors.white,
                  width: 50,
                  top: -20,
                  left: 20,
                  right: 20,
                  color2: Colors.blue.shade300),
              SizedBox(
                width: 10,
              ),
              CategoriesCard(
                  title: 'TABLE',
                  icon: 'assets/images/table.png',
                  color1: Colors.white,
                  width: 50,
                  top: -20,
                  left: 20,
                  right: 20,
                  color2: Colors.yellow.shade200)
            ],
          ),
        ),
      );
    }

    Widget productList() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                WhistlistCard(
                    title: 'hello',
                    description: 'hello',
                    star: '2.1',
                    harga: 20000),
                SizedBox(width: 15),
                WhistlistCard(
                    title: 'hello',
                    description: 'hello',
                    star: '2.1',
                    harga: 20000),
                SizedBox(width: 15),
                WhistlistCard(
                    title: 'hello',
                    description: 'hello',
                    star: '2.1',
                    harga: 20000)
              ],
            ),
          ),
        ),
      );
    }

    Widget popularProducts() {
      return Container(
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Popular Products',
              style: primaryTextStyle.copyWith(
                fontSize: 22,
                fontWeight: bold,
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                PopularProduct(),
                PopularProduct(),
                PopularProduct(),
                PopularProduct(),
                PopularProduct(),
              ],
            )
          ],
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.grey.shade100])),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'FURNITO',
            style: primaryTextStyle.copyWith(fontSize: 15, fontWeight: bold),
          ),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: primaryColor,
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.shop_2_outlined,
                    color: primaryColor,
                  )
                ],
              ),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Colors.grey.shade100])),
          child: ListView(
            children: [
              SizedBox(height: 20),
              categories(),
              productList(),
              popularProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
