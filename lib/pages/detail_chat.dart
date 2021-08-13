import 'package:flutter/material.dart';
import 'package:furnito_chart/theme.dart';

class DetailChat extends StatelessWidget {
  const DetailChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: TextFormField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'Type Message ...', hintStyle: subTitleText),
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
      bottomNavigationBar: chatInput(),
    );
  }
}
