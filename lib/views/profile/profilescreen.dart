import 'package:classroom/helper/constant.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kPrimaryColor,
                border: Border.all(
                    color: kSecondaryColor.withOpacity(0.2),
                    width: 0.3,
                    style: BorderStyle.solid)),
          ),
        )
      ],
    ));
  }
}
