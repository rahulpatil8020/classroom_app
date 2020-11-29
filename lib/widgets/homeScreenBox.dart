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
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [kSecondaryColor, kPrimaryColor.withOpacity(0.8)]),
              boxShadow: [
                BoxShadow(
                    color: kSecondaryColor.withOpacity(0.01),
                    offset: Offset(0, 4),
                    spreadRadius: 2,
                    blurRadius: 2)
              ]),
          child: Text(
            name,
            style: TextStyle(
                fontSize: _fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          )),
    ),
  );
}
