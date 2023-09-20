
import 'package:flutter/material.dart';
import 'package:info_calculator/Moyenne_Calculatrice/data.dart';
import 'package:info_calculator/Moyenne_Calculatrice/infoING/infoIng1S1.dart';
import 'package:info_calculator/Moyenne_Calculatrice/infoLMD/infoLmd1S2.dart';
import 'package:info_calculator/Moyenne_Calculatrice/infoLMD/infoLmd3S2.dart';
import 'package:info_calculator/Moyenne_Calculatrice/information.dart';

import 'infoING/infoIng1S2.dart';
import 'infoING/infoIng2S1.dart';
import 'infoING/infoIng2S2.dart';
import 'infoLMD/infoLmd1S1.dart';
import 'infoLMD/infoLmd2S1.dart';
import 'infoLMD/infoLmd2S2.dart';
import 'infoLMD/infoLmd3S1.dart';


class moyCalculScreen extends StatefulWidget {
  const moyCalculScreen({Key? key}) : super(key: key);

  @override
  State<moyCalculScreen> createState() => _moyCalculScreenState();
}

class _moyCalculScreenState extends State<moyCalculScreen> {
  data dat = data();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.info_outline),
          onPressed: (){
            dat.navigateTo(context, information());
          },
        ) ,
        backgroundColor: Colors.teal,
        centerTitle: true,
        titleSpacing: 20,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(0.5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Icon(
                    Icons.code,
                  color: Colors.red,
                ),
              ),
              SizedBox(width: 3.4,),
              Text(
                'INFO MOYENNE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
              SizedBox(width: 3.4,),
              Container(
                padding: EdgeInsets.all(0.5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Icon(
                  Icons.computer ,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {return false;},
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(height:70,),
                  Container( // text medecin
                    width: 135,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.yellow[700],
                        borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(10),
                          topEnd: Radius.circular(10),
                          bottomStart: Radius.circular(10),
                          bottomEnd: Radius.circular(10),
                        )
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'LICENCE',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container( //anne medecin
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow[700],
                      ),
                      width: double.infinity,
                      height: 180,
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 10,),
                              Expanded(child: titleLevel('1ere')),
                              SizedBox(width: 10,),
                              Expanded(child: titleLevel('2eme')),
                              SizedBox(width: 10,),
                              Expanded(child: titleLevel('3eme')),
                              SizedBox(width: 10,),
                            ],

                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    semestreIcon('S1',screen: infoLmd1S1()),
                                    SizedBox(height: 10,),
                                    semestreIcon('S2',screen: infoLmd1S2())
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    semestreIcon('S3',screen:  infoLmd2S1()),
                                    SizedBox(height: 10,),
                                    semestreIcon('S4',screen:  infoLmd2S2())
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    semestreIcon('S5',screen:  infoLmd3S1()),
                                    SizedBox(height: 10,),
                                    semestreIcon('S6',screen: infoLmd3S2())
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(height:70,),
                  Container( // text medecin
                    width: 135,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.purple[700],
                        borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(10),
                          topEnd: Radius.circular(10),
                          bottomStart: Radius.circular(10),
                          bottomEnd: Radius.circular(10),
                        )
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'INGENIEUR',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container( //anne medecin
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.purple[700],
                      ),
                      width: double.infinity,
                      height: 180,
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 10,),
                              Expanded(child: titleLevel('1ere')),
                              SizedBox(width: 10,),
                              Expanded(child: titleLevel('2eme')),
                              SizedBox(width: 10,),
                              Expanded(child: titleLevel('3eme')),
                              SizedBox(width: 10,),
                            ],

                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    semestreIcon('S1',screen: infoIng1S1()),
                                    SizedBox(height: 10,),
                                    semestreIcon('S2',screen: infoIng1S2())
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    semestreIcon('S3',screen: infoIng2S1()),
                                    SizedBox(height: 10,),
                                    semestreIcon('S4',screen: infoIng2S2())
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    semestreIcon('S5',msg: true),
                                    SizedBox(height: 10,),
                                    semestreIcon('S6', msg: true)
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget semestreIcon(String s , {Widget ? screen ,  bool msg=false }){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: TextButton(
          onPressed: msg ? (){
             messageAlert(context);
          } : (){
            dat.navigateTo(context, screen);
          },
          child: Text(s,
            style: TextStyle(
              color: Colors.black ,
              fontSize: 20,
            ) ,
          )
      ),
    );
  }

}
/**********************************----------------****************************/
/**********************************local-components****************************/

Widget titleLevel(String title){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.teal,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text( title
          ,style: TextStyle(
            fontSize: 22,
            color: Colors.white
          ),
        ),
      ],
    ),
  );
}
Future<dynamic> messageAlert(context){ // non async cuz there is no await in the contenent
  return showDialog(
      context: context,
      builder: (context)=> AlertDialog(
        actions: [
          TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text("CLOSE")
          )
        ],
        title: Center(child: Text("we don't have details yet")),
        contentPadding: EdgeInsets.all(8),
      )
  );
}