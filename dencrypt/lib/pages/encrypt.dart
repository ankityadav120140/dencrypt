// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_const_constructors, avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class encrypt extends StatefulWidget {
  const encrypt({Key? key}) : super(key: key);

  @override
  State<encrypt> createState() => _encryptState();
}

class _encryptState extends State<encrypt> {
  String PlainText = '', CypherText = '';

  void encrypt(String plainText) {
    CypherText = '';
    for (int i = 0; i < plainText.length - 1; i++) {
      CypherText = CypherText +
          String.fromCharCode(
              plainText.codeUnitAt(i) + plainText.codeUnitAt(i + 1));
    }
    CypherText += PlainText[plainText.length - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dencrypt',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                // color: Colors.amber,
                child: TextField(
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  minLines: null,
                  maxLines: null,
                  expands: true,
                  onChanged: ((value) => PlainText = value),
                  decoration: InputDecoration(
                    hintText: 'Your original text',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: OutlineButton(
                shape: StadiumBorder(),
                textColor: Colors.blue,
                child: Text(
                  'Encrypt',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                borderSide: BorderSide(
                  color: Colors.blue,
                  style: BorderStyle.solid,
                  width: 1,
                ),
                onPressed: () {
                  encrypt(PlainText);
                  setState(() {});
                },
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.green,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    CypherText,
                  ),
                ),
              ),
            ),
            Container(
              child: OutlineButton(
                shape: StadiumBorder(),
                textColor: Colors.blue,
                child: Text(
                  'Copy',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                borderSide: BorderSide(
                  color: Colors.blue,
                  style: BorderStyle.solid,
                  width: 1,
                ),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: CypherText));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Text copied to clipboard!"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
