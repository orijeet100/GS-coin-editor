import 'dart:async';
import 'package:editor_app/screens/Editor_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  late int oneSilver;
  late int twoSilver;
  late int fiveSilver;
  late int tenSilver;
  late int oneGold;
  late int twoGold;
  late int fiveGold;
  late int tenGold;

  @override
  void initState() {
    getNumberOfCoins();
    super.initState();
  }

  void getNumberOfCoins() async
  {
    final FirebaseFirestore firestore=FirebaseFirestore.instance;
    Map map={};
    await firestore.collection("NumberOfCoin").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        map=result.data();
      });
    });
    await Future.delayed(Duration(seconds: 1), () {
      // Do something
    });
    Navigator.push(context, MaterialPageRoute(builder: (context)=>EditorScreen(map: map)));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF282828),
        body: Center(
          child: SpinKitDualRing(
            color: Colors.white,
            size: 100,
          ),
        ),
      );
  }
}
