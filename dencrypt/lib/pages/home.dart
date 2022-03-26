// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names, deprecated_member_use

import 'package:dencrypt/pages/decrypt.dart';
import 'package:dencrypt/pages/encrypt.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dencrypt",
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // ignore: prefer_const_literals_to_create_immutables
            colors: [
              Colors.blue.shade100,
              Colors.white,
            ],
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => encrypt(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => decrypt(),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
