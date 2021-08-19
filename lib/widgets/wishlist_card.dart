import 'package:flutter/material.dart';
import 'package:furnito_chart/theme.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      padding: EdgeInsets.only(
        top: 10,
        left: 12,
        bottom: 14,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              // product.galleries[0].url,
              "https://images.unsplash.com/photo-1576941089067-2de3c901e126?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=843&q=80",
              width: 60,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lorem Ipsum',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
                Text('\$20000', style: secondaryText),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Icon(
              Icons.favorite,
              color: secondary,
              size: 15,
            ),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(5),
              primary: primaryColor, // <-- Button color
              onPrimary: Colors.red, // <-- Splash color
            ),
          )
        ],
      ),
    );
  }
}
