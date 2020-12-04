import 'package:classroom/helper/constant.dart';
import 'package:classroom/services/auth.dart';
import 'package:flutter/material.dart';

AppBar appBar(BuildContext context) {
  AuthService authService = new AuthService();
  return AppBar(
    elevation: 0,
    backgroundColor: kSecondaryColor.withOpacity(0.01),
    actions: <Widget>[
      IconButton(
          icon: Icon(Icons.exit_to_app, color: kSecondaryColor),
          onPressed: () async {
            await authService.signOut();
          })
    ],
    centerTitle: true,
  );
}
