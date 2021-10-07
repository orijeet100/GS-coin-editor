import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:editor_app/components/custom_texfield.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class EditorScreen extends StatefulWidget {
  final map;
  EditorScreen({this.map});


  @override
  _EditorScreenState createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {

  late int oneSilver;
  late int twoSilver;
  late int fiveSilver;
  late int tenSilver;
  late int oneGold;
  late int twoGold;
  late int fiveGold;
  late int tenGold;
  late TextEditingController textController1;
  late TextEditingController textController2;
  late TextEditingController textController3;
  late TextEditingController textController4;
  late TextEditingController textController5;
  late TextEditingController textController6;
  late TextEditingController textController7;
  late TextEditingController textController8;

  @override
  void initState() {
     oneSilver=widget.map['OneSilver'];
     twoSilver=widget.map['TwoSilver'];
     fiveSilver=widget.map['FiveSilver'];
     tenSilver=widget.map['TenSilver'];
     oneGold=widget.map['OneGold'];
     twoGold=widget.map['TwoGold'];
     fiveGold=widget.map['FiveGold'];
     tenGold=widget.map['TenGold'];
     textController1=TextEditingController(text: oneGold.toString());
     textController2=TextEditingController(text: twoGold.toString());
     textController3=TextEditingController(text: fiveGold.toString());
     textController4=TextEditingController(text: tenGold.toString());
     textController5=TextEditingController(text: oneSilver.toString());
     textController6=TextEditingController(text: twoSilver.toString());
     textController7=TextEditingController(text: fiveSilver.toString());
     textController8=TextEditingController(text: tenSilver.toString());
    super.initState();
  }

  int currentSelected=0;
  PageController pc=PageController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items:
      [
        BottomNavigationBarItem(icon: Padding(padding: EdgeInsets.only(bottom: 5 ),child: Text('Au',style: TextStyle(fontSize: 20,color:(currentSelected!=0?Colors.white24:Colors.white)))),label:'Gold'),
        BottomNavigationBarItem(icon:Padding(padding: EdgeInsets.only(bottom: 5 ),child: Text('Ag',style: TextStyle(fontSize: 20,color:(currentSelected!=1?Colors.white24:Colors.white) ))),label:'Silver'),
        BottomNavigationBarItem(icon: Icon(Icons.edit_outlined),label:'Edit')
      ],
        backgroundColor: Color(0xFF323131),
        currentIndex: currentSelected,
        onTap: (index)
        {
          setState(() {
            currentSelected=index;
            pc.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.linear);
          });
        },
        unselectedItemColor: Colors.white24,
        selectedItemColor: Colors.white,

      ),
      backgroundColor: Color(0xFF282828),
      body: SafeArea(
          child: PageView(
            controller: pc,
            scrollDirection: Axis.horizontal,
            children: [
              ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Text(
                      'Coin Editor',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFFEBC480),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CoinImage(isGold: true,),
                        CoinDetails(isGold: true,weight: 1,),
                        CustomTextField(controller: textController1,
                            weightChangeFunction: (value)
                            {
                              if(int.tryParse(value)!=null)
                              {
                                oneGold=int.parse(value);
                              }
                            }
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CoinImage(isGold: true,),
                        CoinDetails(isGold: true,weight: 2,),
                        CustomTextField(controller: textController2,
                            weightChangeFunction: (value)
                            {
                              if(int.tryParse(value)!=null)
                              {
                                twoGold=int.parse(value);
                              }
                            }
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CoinImage(isGold: true,),
                        CoinDetails(isGold: true,weight: 5,),
                        CustomTextField(controller: textController3,
                            weightChangeFunction: (value)
                            {
                              if(int.tryParse(value)!=null)
                              {
                                fiveGold=int.parse(value);
                              }
                            }
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CoinImage(isGold: true,),
                        CoinDetails(isGold: true,weight: 10,),
                        CustomTextField(controller: textController4,
                            weightChangeFunction: (value)
                            {
                              if(int.tryParse(value)!=null)
                              {
                                tenGold=int.parse(value);
                              }
                            }
                        )
                      ],
                    ),
                  )
                ],
              ),
              ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Text(
                      'Coin Editor',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CoinImage(isGold: false,),
                        CoinDetails(isGold: false,weight: 1,),
                        CustomTextField(controller: textController5,
                            weightChangeFunction: (value)
                            {
                              if(int.tryParse(value)!=null)
                              {
                                oneSilver=int.parse(value);
                              }
                            }
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CoinImage(isGold: false,),
                        CoinDetails(isGold: false,weight: 2,),
                        CustomTextField(controller: textController6,
                            weightChangeFunction: (value)
                            {
                              if(int.tryParse(value)!=null)
                              {
                                twoSilver=int.parse(value);
                              }
                            }
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CoinImage(isGold: false,),
                        CoinDetails(isGold: false,weight: 5,),
                        CustomTextField(controller: textController7,
                            weightChangeFunction: (value)
                            {
                              if(int.tryParse(value)!=null)
                              {
                                fiveSilver=int.parse(value);
                              }
                            }
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CoinImage(isGold: false,),
                        CoinDetails(isGold: false,weight: 10,),
                        CustomTextField(controller: textController8,
                            weightChangeFunction: (value)
                            {
                              if(int.tryParse(value)!=null)
                              {
                                tenSilver=int.parse(value);
                              }
                            }
                        )
                      ],
                    ),
                  ),
                ],
              ),
              ListView(
                children: [
                  editScreenWidgets[0],
                  editScreenWidgets[1],
                  Center(
                    child: MaterialButton(onPressed: () async{
                      final FirebaseFirestore firestore=FirebaseFirestore.instance;
                      await firestore
                          .collection("NumberOfCoin")
                          .doc('9gdxPTnIhZAVmvF3leqb')
                          .update({
                        "OneGold": oneGold,
                        "TwoGold": twoGold,
                        "FiveGold": fiveGold,
                        "TenGold": tenGold,
                        "OneSilver":oneSilver,
                        "TwoSilver":twoSilver,
                        "FiveSilver":fiveSilver,
                        "TenSilver":tenSilver,
                          }).then((_) {
                        print("success!");
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Saved all the changes',
                              style: TextStyle(
                                  fontSize:17
                              ),
                            ),
                            action: SnackBarAction(onPressed: () {}, label: 'Close',
                              textColor: Colors.yellow,
                            ),
                            duration: Duration(seconds: 4)
                        ),
                      );

                    },
                      child: Text('Edit',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      elevation: 10,
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
                    ),
                  )
                ],
              )
            ],
            physics: BouncingScrollPhysics(),
            onPageChanged: (index){
              setState(() {
                currentSelected=index;
              });
            },
          )
      ),
    );
  }
}




