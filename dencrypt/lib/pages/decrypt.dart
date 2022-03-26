// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_const_constructors, avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class decrypt extends StatefulWidget {
  const decrypt({Key? key}) : super(key: key);

  @override
  State<decrypt> createState() => _decryptState();
}

class _decryptState extends State<decrypt> {
  String PlainText = '', CypherText = '';

  void decrypt(String CypherText) {
    PlainText = CypherText[CypherText.length - 1];
    for (int i = CypherText.length - 2; i >= 0; i--) {
      PlainText += String.fromCharCode(
        CypherText.codeUnitAt(i) - PlainText.codeUnitAt(PlainText.length - 1),
      );
    }
    PlainText = PlainText.split('').reversed.join('');
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
                child: TextField(
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  minLines: null,
                  maxLines: null,
                  expands: true,
                  onChanged: ((value) => CypherText = value),
                  decoration: InputDecoration(
                    hintText: 'Your Encrypted text',
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
                  'Decrypt',
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
                  decrypt(CypherText);
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
                    PlainText,
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
