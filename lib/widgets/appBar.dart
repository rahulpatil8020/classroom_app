import 'package:classroom/helper/constant.dart';
import 'package:classroom/services/auth.dart';
import 'package:flutter/material.dart';

AppBar appBar(BuildContext context, String name) {
  AuthService authService = new AuthService();
  return AppBar(
    title: Center(child: Text(name,
      style: TextStyle(
        color: Colors.white
      ),)),
    backgroundColor: Colors.black,
    centerTitle: true,
    actions: [
      IconButton(icon: Icon(Icons.logout),
          onPressed: (){
              print("Logout");
          })
    ],
  );
}
