import 'package:flutter/material.dart';
import '../data.dart';
import '../histotyTest.dart';
import '../homePage.dart';
// T = TP  , D = TD , M = Moyenne module
class infoIng2S2 extends StatefulWidget {
  const infoIng2S2({Key? key}) : super(key: key);

  @override
  State<infoIng2S2> createState() => _infoIng2S2();
}

class _infoIng2S2 extends State<infoIng2S2> {

  @override
  void initState() {  //=== initialeState == first setState
    // TODO: implement initState
    super.initState();
    dat.createDB(); // run when execute
  }
  data dat = data();

  TextEditingController tpSI = TextEditingController(); //2it's a class // tptg.text // attribue .text
  TextEditingController examenSI = TextEditingController();
  double ? Tsi=0 , Msi=0 , Esi=0  ;

  TextEditingController tdTG = TextEditingController();
  TextEditingController examenTG = TextEditingController();
  double ?  Mtg=0 , Etg=0 ,Dtg=0 ;

  TextEditingController tdRES = TextEditingController();
  TextEditingController tpRES = TextEditingController();
  TextEditingController examenRES = TextEditingController();
  double ?  Mres=0 , Eres=0 ,Dres=0  , Tres=0 ;


  TextEditingController tpPOO2 = TextEditingController();
  TextEditingController examenPOO2 = TextEditingController();
  double ? Mpoo2=0 , Epoo2=0 ,Tpoo2=0 ;

  TextEditingController tdBD = TextEditingController();
  TextEditingController examenBD = TextEditingController();
  double ? Mbd=0 , Ebd=0 ,Dbd=0 ;

  TextEditingController tdTL = TextEditingController();
  TextEditingController examenTL = TextEditingController();
  double ? Mtl=0 , Etl=0 ,Dtl=0 ;


  TextEditingController examenPROJ = TextEditingController();
  TextEditingController tpPROJ = TextEditingController();
  double ? Mproj=0 , Eproj=0 , Tproj=0 ;

  TextEditingController examenANG = TextEditingController();
  double ? Mang=0 ;




  double ? result=0;

  var scaffoldKey = GlobalKey<ScaffoldState>(); //bottomsheet
  var formKey = GlobalKey<FormState>();         //validation

  bool isShownBottomSheet = false;
  @override
  Widget build(BuildContext context) {
    calculate(){
      setState(() {
        /////////////////////////////////////
        Tsi = double.tryParse(tpSI.text);
        if (Tsi == null) Tsi = 0; // cauze null + value == Error
        Esi = double.tryParse(examenSI.text);
        if (Esi == null) Esi = 0;
        Msi = Tsi! * 0.4 + Esi! * 0.6;
        /////////////////////////////////////
        Dtg = double.tryParse(tdTG.text);
        if (Dtg == null) Dtg = 0; // cauze null + value == Error
        Etg = double.tryParse(examenTG.text);
        if (Etg == null) Etg = 0;
        Mtg = Dtg! * 0.4 + Etg! * 0.6;
        /////////////////////////////////////
        // cauze null + value == Error
        Dres = double.tryParse(tdRES.text);
        if (Dres == null) Dres = 0;
        Tres = double.tryParse(tpRES.text);
        if (Tres == null) Tres = 0;
        Eres = double.tryParse(examenRES.text);
        if (Eres == null) Eres = 0;
        Mres =  Dres! * 0.2 + Tres!*0.2 + Eres! * 0.6;
        /////////////////////////////////////////////////
        Dbd = double.tryParse(tdBD.text);
        if (Dbd == null) Dbd = 0;
        Ebd = double.tryParse(examenBD.text);
        if (Ebd == null) Ebd = 0;
        Mbd = Dbd! * 0.4 + Ebd! * 0.6;
        /**********************************************/
        Dtl = double.tryParse(tdTL.text);
        if (Dtl == null) Dtl = 0;
        Etl = double.tryParse(examenTL.text);
        if (Etl == null) Etl = 0;
        Mtl = Dtl! * 0.4 + Etl! * 0.6;
        /**********************************************/
        Eproj = double.tryParse(examenPROJ.text);
        if (Eproj == null) Eproj = 0;
        Tproj = double.tryParse(tpPROJ.text);
        if (Tproj == null) Tproj = 0;
        Mproj = 0.4 * Tproj! + Eproj! * 0.6 ;
        /**********************************************/
        Tpoo2 = double.tryParse(tpPOO2.text);
        if (Tpoo2 == null) Tpoo2 = 0;
        Epoo2 = double.tryParse(examenPOO2.text);
        if (Epoo2 == null) Epoo2 = 0;
        Mpoo2 = Tpoo2! * 0.4 + Epoo2! * 0.6;
        /**********************************************/
        Mang = double.tryParse(examenANG.text);
        if(Mang == null) Mang = 0 ;
        /**********************************************/
        result = ( Msi!*3 + Mtg! * 3 + Mres!*4 +  Mbd!*3
            + Mtl! * 3 + Mpoo2!*6  + Mproj!*6 + Mang!  ) / 29 ;
      });
    } // anonymos function
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green,
            ),
            child: IconButton(
              icon: Icon(Icons.keyboard_return),
              onPressed: (){
                dat.navigateTo(context, moyCalculScreen());
              },
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  child: TextButton(
                      child: Text('SAVE' , style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      onPressed:(){
                        String msg = formKey.currentState!.validate()  ? 'YES' : 'save!' ;
                        Widget texto = formKey.currentState!.validate()  ?
                        Text('CONFIRM SAVING' , style: TextStyle(fontSize: 25),) :
                        Text('you entered false marks',style: TextStyle(fontSize: 18)) ;
                        scaffoldKey.currentState!.showBottomSheet((context){
                          return Container(
                            width: double.infinity,
                            height: 70, color: Colors.grey,
                            child: Row(
                              children: [
                                TextButton(
                                  child:Row(
                                    //mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: texto
                                      ),
                                    ],
                                  ),
                                  onPressed: (){},
                                ),
                                TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                      // if(formKey.currentState!.validate() && msg == 'YES') to save even false
                                      if(result! < 100 && result! >= 0)
                                        dat.insertDB(
                                          annee: 'infoIng2S2',
                                          moyenne: result!.toStringAsFixed(2),
                                          date: DateTime.now().toString().substring(0,10),
                                        ).then((value){
                                          dat.getfromDB();
                                        });
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: msg=='save!' ? Colors.red : Colors.green,
                                        ),
                                        child: Text(msg,style: TextStyle(color: Colors.black),)
                                    )
                                )
                              ],
                            ),
                          );
                        } ,
                          elevation: 20 ,
                        ).closed.then((value){
                          print('finger close');
                          // if finger closes
                        });

                      }
                  ),
                ),
              ),
              SizedBox(width: 5,)
            ],
          )
        ],

        title: Container(
            color: Colors.orange[600],
            child: Text(' INGENIEUR 2eme S2 ' ,style: TextStyle(fontSize: 18),)
        ),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () async {return false;},
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          dat.module2('PROGRAMMATION ORIENTEE OBJET 2',   tpPOO2, examenPOO2 , Mpoo2!
                              , (value){ calculate();  }  , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TP'),
                          SizedBox(height: 20,),
                          dat.module2("INTRODUCTION AUX SYSTEMES D'INFORMATION" ,tpSI, examenSI , Msi! ,
                                  (value){ calculate();    } , validator: (String ?value){
                                return dat.valid(value);
                              } , tdOrTp: 'TP'),
                          SizedBox(height: 20,),
                          dat.module3("INTRODUCTION AUX RESEAUX INFORMATIQUES", tdRES, tpRES,  examenRES , Mres! ,
                                (value){    calculate();    } , validator: (String ?value){
                              return dat.valid(value) ;
                            },),
                          dat.module2('INTRODUCTION AUX BASES DE DONNEES', tdBD, examenBD , Mbd! ,
                                  (value){ calculate(); }  , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module2('THEORIE DES LANGAGES', tdTL, examenTL , Mtl! ,
                                  (value){ calculate(); }  , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module2('THHEORIE DES GRAPHES', tdTG, examenTG , Mtg! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value);
                              } , tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module2("PROJET PLURIDISCIPLINAIRE", tpPROJ , examenPROJ, Mproj!,
                                (value){ calculate();} , validator: (String ?value) {
                              return dat.valid(value);
                            },  tdOrTp: 'TP'),
                          SizedBox(height: 20,),
                          dat.module1('ANGLAIS', examenANG, Mang! ,
                                  (value) { calculate(); } , validator: (String ? value){
                              return dat.valid(value);
                              })
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            data.listIndex = 9;
                            dat.getfromDB().then((value){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=> historyTest("INGENIEUR 2eme S2")
                                  )
                              );
                            });
                          },
                          child: Text(
                            'HISTORY',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                        height: 50,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Text('S2 : ${result!.toStringAsFixed(2)}',
                                style: TextStyle(fontSize: 25),
                              ),
                            ]
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}