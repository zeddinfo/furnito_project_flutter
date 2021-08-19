import 'package:flutter/material.dart';
import 'package:furnito_chart/theme.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1480074568708-e7b720bb3f09?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=753&q=80',
                    ),
                  ),
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
                      'Rumah Siap Huni',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      'Rp. 2000,000',
                      style: secondaryText,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.add,
                        size: 16,
                        color: primaryColor,
                      )),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '1',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.minimize,
                        size: 16,
                        color: secondary,
                      )),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Icon(Icons.remove),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Remove',
                  style: secondaryText.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
