import 'package:flutter/material.dart';
import 'package:furnito_chart/theme.dart';
import 'package:furnito_chart/widgets/chat_tile.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          color: primaryColor,
        ),
        title: Text(
          'Message Support',
          style: primaryTextStyle.copyWith(fontSize: 19),
        ),
      );
    }

    Widget emptyChat() {
      return Expanded(
          child: Container(
        // color: Colors.white,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/empty.png',
              width: 120,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Oops, no message yet?',
              style: primaryTextStyle.copyWith(fontSize: 18),
            ),
            SizedBox(height: 15),
            Text(
              'You have never done a transaction.',
              style: subTitleText.copyWith(fontSize: 16),
            ),
            SizedBox(height: 15),
            Container(
              child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.all(13),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  child: Text(
                    'Explore Store',
                    style: whiteTextStyle.copyWith(fontSize: 16),
                  )),
            )
          ],
        ),
      ));
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            children: [
              ChatTile(),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
