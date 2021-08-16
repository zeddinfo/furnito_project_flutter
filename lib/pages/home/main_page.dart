import 'package:flutter/material.dart';
import 'package:furnito_chart/pages/home/account_page.dart';
import 'package:furnito_chart/pages/home/chat_page.dart';
import 'package:furnito_chart/pages/home/history_page.dart';
import 'package:furnito_chart/pages/home/home_page.dart';
import 'package:furnito_chart/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        child: Image.asset(
          'assets/icons/icon_cart.png',
          width: 20,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 6,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              currentIndex: currentindex,
              onTap: (value) {
                setState(() {
                  currentindex = value;
                });
              },
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Icon(
                        Icons.home_rounded,
                        color: currentindex == 0 ? primaryColor : subTitle,
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 10, right: 50),
                      child: Icon(
                        Icons.chat,
                        color: currentindex == 1 ? primaryColor : subTitle,
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 10, left: 50),
                      child: Icon(
                        Icons.favorite,
                        color: currentindex == 2 ? primaryColor : subTitle,
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Icon(
                        Icons.person,
                        color: currentindex == 3 ? primaryColor : subTitle,
                      ),
                    ),
                    label: '')
              ]),
        ),
      );
    }

    Widget body() {
      switch (currentindex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ChatPage();
          break;
        case 2:
          return HistoryPage();
          break;
        case 3:
          return AccountPage();
          break;
        default:
          return HomePage();
      }
    }

    return Scaffold(
        floatingActionButton: cartButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: customBottomNav(),
        backgroundColor: Colors.grey[100],
        body: body());
  }
}
