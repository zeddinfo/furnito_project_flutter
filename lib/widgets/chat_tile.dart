import 'package:flutter/material.dart';
import 'package:furnito_chart/theme.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-chat');
      },
      child: Container(
        margin: EdgeInsets.only(top: 33),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/astronaut.png',
                  width: 50,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Furnito Store',
                        style: primaryTextStyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        'Hello, this item is on ...',
                        style: subTitleText,
                      )
                    ],
                  ),
                ),
                Text('Now',
                    style: subTitleText.copyWith(fontSize: 15),
                    overflow: TextOverflow.ellipsis),
              ],
            ),
            SizedBox(height: 12),
            Divider(
              thickness: 1,
              color: Colors.grey.shade300,
            )
          ],
        ),
      ),
    );
  }
}
