import 'package:flutter/material.dart';

enum DialogAction {yes, cancel}

class Dialogs{
  static Future<DialogAction> yesAbortDialog(
      BuildContext context,
      String title, body,
      ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(title),
          content: Text(body),
          actions: [
            FlatButton(
                onPressed: (){
                  Navigator.of(context).pop(DialogAction.cancel);
                }, 
                child: Text("Cancel")),
            RaisedButton(
                onPressed: (){
                  Navigator.of(context).pop(DialogAction.yes);
                },
                child: Text("Confirm", style: TextStyle(color: Colors.white),)
            )
          ],
        );
      },
    );
    return (action != null) ? action : DialogAction.cancel;
  }
}