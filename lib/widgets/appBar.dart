import 'package:classroom/helper/constant.dart';
import 'package:flutter/material.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: Icon(Icons.dashboard, color: kPrimaryColor),
      onPressed: () {},
    ),
    title: RichText(
        text: TextSpan(
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.w900),
            children: [
          TextSpan(
            text: "School",
            style: TextStyle(color: kSecondaryColor),
          ),
          TextSpan(text: "Pool", style: TextStyle(color: kPrimaryColor))
        ])),
    actions: <Widget>[
      IconButton(
          icon: Icon(Icons.exit_to_app, color: kSecondaryColor),
          onPressed: () {})
    ],
    centerTitle: true,
  );
}
