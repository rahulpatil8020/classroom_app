import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:classroom/widgets/appBar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CreateAssignments extends StatefulWidget {
  @override
  _CreateAssignmentsState createState() => _CreateAssignmentsState();
}

class _CreateAssignmentsState extends State<CreateAssignments> {
  final mainReference = FirebaseDatabase.instance.reference().child('Database');

  Future getPDFandUpload() async {
    var rng = new Random();
    String randomName = "";
    for (var i = 0; i < 20; i++) {
      print(rng.nextInt(100));
      randomName = rng.nextInt(100).toString();
    }
    File file = await FilePicker.getFile(type: FileType.custom);
    String fileName = '${randomName}.pdf';
    savePdf(file.readAsBytesSync(), fileName);
  }

  savePdf(List<int> asset, String name) async {
    StorageReference reference = FirebaseStorage.instance.ref().child(name);
    StorageUploadTask uploadTask = reference.putData(asset);
    String url = await (await uploadTask.onComplete).ref.getDownloadURL();
    documentFileUpload(url);
  }

  void documentFileUpload(String str) {
    var data = {
      "PDF": str,
      "FileName": "My New File",
    };
    mainReference.child(createCryptoRandomString()).set(data).then((v) {
      print("Store Successfully");
    });
  }

  String createCryptoRandomString([int length = 32]) {
    final Random _random = Random.secure();
    var values = List<int>.generate(length, (i) => _random.nextInt(256));
    return base64Url.encode(values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        body: InkWell(
            child: Center(
              child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.red,
                  child: Text("Upoad")),
            ),
            onTap: () {
              getPDFandUpload();
            }));
  }
}
