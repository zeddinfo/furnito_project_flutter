import 'package:flutter/material.dart';
import 'package:furnito_chart/theme.dart';
import 'package:furnito_chart/widgets/chat_bubble.dart';

class DetailChat extends StatelessWidget {
  const DetailChat({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
        children: [
          ChatBubble(
            isSender: true,
            text: 'Hi, This item is still available?',
          ),
          ChatBubble(
            isSender: false,
            text: 'Good night, This item in only available in size L and XL',
          ),
        ],
      );
    }

    Widget productPreview() {
      return Container(
        width: 225,
        height: 74,
        padding: EdgeInsets.only(right: 10),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: secondary.withOpacity(0.5),
          border: Border.all(color: secondary),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.white),
              child: Image.asset(
                'assets/images/couch.png',
                width: 54,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    'LaraChair...',
                    style: whiteTextStyle.copyWith(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  '20.000',
                  style: primaryTextStyle.copyWith(fontSize: 17),
                )
              ],
            ),
            Spacer(),
            SizedBox(
              width: 25,
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.close,
                  color: secondary,
                  size: 14,
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(0),
                  primary: primaryColor, // <-- Button color
                  onPrimary: Colors.red, // <-- Splash color
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              productPreview(),
              // content(),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: TextFormField(
                          decoration: InputDecoration.collapsed(
                              hintText: 'Type Message ...',
                              hintStyle: subTitleText),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.send,
                    color: primaryColor,
                  )
                ],
              ),
            ]),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          leading: Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          title: Row(
            children: [
              Image.asset(
                'assets/icons/astronaut.png',
                width: 50,
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Furnito Store',
                    style: primaryTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    'Online',
                    style: subTitleText.copyWith(fontSize: 15),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: content(),
      bottomNavigationBar: chatInput(),
    );
  }
}
