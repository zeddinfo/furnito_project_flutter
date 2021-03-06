import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furnito_chart/Models/asset_model.dart';
import 'package:furnito_chart/providers/asset_provider.dart';
import 'package:furnito_chart/theme.dart';
import 'package:furnito_chart/widgets/categories_card.dart';
import 'package:furnito_chart/widgets/popular_product.dart';
import 'package:furnito_chart/widgets/whistlist_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime currentBackPressTime = DateTime.now();

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Tekan sekali lagi untuk keluar aplikasi');
      print('masuk sini');
      return Future.value(false);
    }
    print('masuk sisni');
    return Future.value(true);
  }

  getInit() async {
    await Provider.of<AssetProvider>(context, listen: false).getAssets();
  }

  @override
  void initState() {
    getInit();
  }

  @override
  Widget build(BuildContext context) {
    AssetProvider assetProvider = Provider.of<AssetProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'FURNITO',
          style: primaryTextStyle.copyWith(
              fontSize: 20, letterSpacing: 10, fontWeight: bold),
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
                  Icons.shopping_bag,
                  color: primaryColor,
                )
              ],
            ),
          )
        ],
      );
    }

    Widget categories() {
      var sizeScreen = MediaQuery.of(context).size;

      return Center(
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
      return GestureDetector(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: assetProvider.assets
                    .map(
                      (asset) => WhistlistCard(asset: asset),
                    )
                    .toList(),
                // children: [
                //   WhistlistCard(
                //       title: 'hello',
                //       description: 'hello',
                //       star: '2.1',
                //       harga: 20000),
                //   SizedBox(width: 15),
                //   WhistlistCard(
                //       title: 'hello',
                //       description: 'hello',
                //       star: '2.1',
                //       harga: 20000),
                //   SizedBox(width: 15),
                //   WhistlistCard(
                //       title: 'hello',
                //       description: 'hello',
                //       star: '2.1',
                //       harga: 20000)
                // ],
              ),
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
          child: WillPopScope(
            onWillPop: onWillPop,
            child: assetProvider.assets.length == 0
                ? Center(
                    child: Text(
                    'Sedang memuat data',
                    style: primaryTextStyle,
                  ))
                : ListView(
                    children: [
                      SizedBox(height: 20),
                      categories(),
                      productList(),
                      popularProducts(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
