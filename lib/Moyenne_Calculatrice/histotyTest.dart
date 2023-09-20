import 'package:flutter/material.dart';
import 'package:info_calculator/Moyenne_Calculatrice/homePage.dart';
import 'package:info_calculator/Moyenne_Calculatrice/infoING/infoIng1S1.dart';
import 'package:info_calculator/Moyenne_Calculatrice/infoLMD/infoLmd1S2.dart';
import 'package:info_calculator/Moyenne_Calculatrice/infoLMD/infoLmd2S1.dart';
import 'data.dart';
import 'infoING/infoIng1S2.dart';
import 'infoING/infoIng2S1.dart';
import 'infoING/infoIng2S2.dart';
import 'infoLMD/infoLmd1S1.dart';
import 'infoLMD/infoLmd2S2.dart';
import 'infoLMD/infoLmd3S1.dart';
import 'infoLMD/infoLmd3S2.dart';


class historyTest extends StatefulWidget {
  historyTest(this.title);
  final String title;
  @override
  State<historyTest> createState() => _historyTest();
}

class _historyTest extends State<historyTest> {

  data dat = data(); // setState doesn't affect it'
  late String _title ;
  @override
  void initState() {
    super.initState();
    _title = widget.title ;
  }

  @override
  Widget build(BuildContext context) {
    List lists = [
      data.historyMoyenneL1MIS1 , data.historyMoyenneL1MIS2 ,
      data.historyMoyenneL2MIS1 , data.historyMoyenneL2MIS2 ,
      data.historyMoyenneL3MIS1 , data.historyMoyenneL3MIS2 ,
      data.historyMoyenneIng1S1 , data.historyMoyenneIng1S2 ,
      data.historyMoyenneIng2S1 , data.historyMoyenneIng2S2
    ] ;
    List screenReturn = [ infoLmd1S1() , infoLmd1S2() , infoLmd2S1() ,
      infoLmd2S2() , infoLmd3S1() , infoLmd3S2() , infoIng1S1(),
      infoIng1S2() , infoIng2S1() , infoIng2S2()
    ];
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green,
            ),
            child: IconButton(
              color: Colors.red,
              icon: Icon(Icons.keyboard_return),
              onPressed: (){
                dat.navigateTo(context, screenReturn[data.listIndex]);
              },
            ),
          ),
        ),
        title: Text(_title),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () async {return false;},
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView.separated(
              itemBuilder: (context, inte)  {
                return dat.item(
                    moy: lists[data.listIndex]![ lists[data.listIndex]!.length - 1 - inte] ['moyenne'],
                    date: lists[data.listIndex]![ lists[data.listIndex]!.length - 1 - inte ]['date'],
                    id: lists[data.listIndex]![ lists[data.listIndex]!.length - 1 - inte ]['id'],
                    onPressed: () async {
                      await dat.deleteData(   id: lists[data.listIndex]![ lists[data.listIndex]!.length - 1 - inte ]['id'],
                      ).then((value)async{
                        await dat.getfromDB();
                        setState(() {});
                      });
                    }
                );
              },
              separatorBuilder: (context, int) =>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 2, color: Colors.blue,),
                  ),
              itemCount: lists[data.listIndex]!.length == null ? 0 : lists[data.listIndex]!.length
          ),
        ),
      ),
    );
  }
}