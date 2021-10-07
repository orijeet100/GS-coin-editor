import 'package:flutter/material.dart';

List<Widget> editScreenWidgets=[
  Padding(
    padding: EdgeInsets.symmetric(vertical: 100),
    child: Stack(
      children: [
        Align(
          alignment: Alignment(-0.5, 0),
          child: Container(
            width: 200,
            height: 200,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'images/gold_coin.jpg',
            ),
          ),
        ),
        Align(
          alignment: Alignment(0.5, 0),
          child: Container(
            width: 200,
            height: 200,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'images/silver_coin.jpg',
            ),
          ),
        )
      ],
    ),
  ),
  Padding(
    padding: EdgeInsets.fromLTRB(10, 10, 10, 50),
    child: Text(
      'Tap on the edit button to save all the changes',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
];

class CoinImage extends StatelessWidget {
  CoinImage({required this.isGold});
  final bool isGold;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.width * 0.2,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          isGold?'images/gold_coin.jpg':'images/silver_coin.jpg',
        ),
      ),
    );
  }
}

class CoinDetails extends StatelessWidget {

  CoinDetails({
    required this.isGold,required this.weight
  });

final bool isGold;
final int weight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
      child: Text(
        isGold?'${weight}g Gold Coin':'${weight}g Silver Coin',
        style: TextStyle(
          fontFamily: 'Poppins',
          color: isGold?Color(0xFFEBC480):Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
