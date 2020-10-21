import 'package:classroom/helper/constant.dart';
import 'package:flutter/material.dart';

Padding homeScreenBox(BuildContext context, String name, Widget _widget,
    double _width, double _height, double _fontSize) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => _widget));
      },
      child: Container(
        alignment: Alignment.center,
        width: _width,
        height: _height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            // gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors: [Colors.white, kPrimaryColor.withOpacity(0.8)]),
            boxShadow: [
              BoxShadow(
                  color: kSecondaryColor.withOpacity(0.2),
                  offset: Offset(0, 5),
                  spreadRadius: 5,
                  blurRadius: 5)
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kSecondaryColor,
                fontSize: _fontSize,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
