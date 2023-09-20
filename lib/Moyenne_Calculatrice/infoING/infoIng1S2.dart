import 'package:flutter/material.dart';
import '../data.dart';
import '../histotyTest.dart';
import '../homePage.dart';
// T = TP  , D = TD , M = Moyenne module
class infoIng1S2 extends StatefulWidget {
  const infoIng1S2({Key? key}) : super(key: key);

  @override
  State<infoIng1S2> createState() => _infoIng1S2();
}

class _infoIng1S2 extends State<infoIng1S2> {

  @override
  void initState() {  //=== initialeState == first setState
    // TODO: implement initState
    super.initState();
    dat.createDB(); // run when execute
  }
  data dat = data();

  TextEditingController tpSE2 = TextEditingController(); //2it's a class // tpalgo2.text // attribue .text
  TextEditingController tdSE2 = TextEditingController(); //2it's a class // tpalgo2.text // attribue .text
  TextEditingController examenSE2 = TextEditingController();
  double ? Tse2=0, Dse2=0 , Mse2=0 , Ese2=0  ;

  TextEditingController tpALGO2 = TextEditingController(); //2it's a class // tpalgo2.text // attribue .text
  TextEditingController tdALGO2 = TextEditingController();
  TextEditingController examenALGO2 = TextEditingController();
  double ? Talgo2=0 , Malgo2=0 , Ealgo2=0 ,Dalgo2=0 ;

  TextEditingController tdANALYSE2 = TextEditingController();
  TextEditingController examenANALYSE2 = TextEditingController();
  double ?  Manalyse2=0 , Eanalyse2=0 ,Danalyse2=0 ;


  TextEditingController tdLOGIC = TextEditingController();
  TextEditingController examenLOGIC = TextEditingController();
  double ? Mlogic=0 , Elogic=0 ,Dlogic=0 ;

  TextEditingController tdALGEBRE2 = TextEditingController();
  TextEditingController examenALGEBRE2 = TextEditingController();
  double ? Malgebre2=0 , Ealgebre2=0 ,Dalgebre2=0 ;


  TextEditingController examenTSO = TextEditingController();
  double ? Mtso=0 ;


  TextEditingController examenPROBASTAT = TextEditingController();
  TextEditingController tpPROBASTAT = TextEditingController();
  double ? Mprobastat=0 , Tprobastat = 0 , Eprobastat;


  double ? result=0;

  var scaffoldKey = GlobalKey<ScaffoldState>(); //bottomsheet
  var formKey = GlobalKey<FormState>();         //validation

  bool isShownBottomSheet = false;
  @override
  Widget build(BuildContext context) {
    calculate(){
      setState(() {
        /////////////////////////////////////
        Tse2 = double.tryParse(tpSE2.text);
        if (Tse2 == null) Tse2 = 0; // cauze null + value == Error
        Dse2 = double.tryParse(tdSE2.text);
        if (Dse2 == null) Dse2 = 0; // cauze null + value == Error
        Ese2 = double.tryParse(examenSE2.text);
        if (Ese2 == null) Ese2 = 0;
        Mse2 = Tse2! * 0.2 + Dse2!*0.2 + Ese2! * 0.6;
        /////////////////////////////////////
        Talgo2 = double.tryParse(tpALGO2.text);
        if (Talgo2 == null) Talgo2 = 0; // cauze null + value == Error
        Dalgo2 = double.tryParse(tdALGO2.text);
        if (Dalgo2 == null) Dalgo2 = 0;
        Ealgo2 = double.tryParse(examenALGO2.text);
        if (Ealgo2 == null) Ealgo2 = 0;
        Malgo2 = Talgo2! * 0.2 + Dalgo2! * 0.2 + Ealgo2! * 0.6;
        /////////////////////////////////////
        // cauze null + value == Error
        Danalyse2 = double.tryParse(tdANALYSE2.text);
        if (Danalyse2 == null) Danalyse2 = 0;
        Eanalyse2 = double.tryParse(examenANALYSE2.text);
        if (Eanalyse2 == null) Eanalyse2 = 0;
        Manalyse2 =  Danalyse2! * 0.4 + Eanalyse2! * 0.6;
        /////////////////////////////////////////////////
        Dalgebre2 = double.tryParse(tdALGEBRE2.text);
        if (Dalgebre2 == null) Dalgebre2 = 0;
        Ealgebre2 = double.tryParse(examenALGEBRE2.text);
        if (Ealgebre2 == null) Ealgebre2 = 0;
        Malgebre2 = Dalgebre2! * 0.4 + Ealgebre2! * 0.6;
        /**********************************************/
        Mtso = double.tryParse(examenTSO.text);
        if (Mtso == null) Mtso = 0;
        /**********************************************/
        Dlogic = double.tryParse(tdLOGIC.text);
        if (Dlogic == null) Dlogic = 0;
        Elogic = double.tryParse(examenLOGIC.text);
        if (Elogic == null) Elogic = 0;
        Mlogic = Dlogic! * 0.4 + Elogic! * 0.6;
        /**********************************************/
        Eprobastat = double.tryParse(examenPROBASTAT.text);
        if (Eprobastat == null) Eprobastat = 0;
        Tprobastat = double.tryParse(tpPROBASTAT.text);
        if (Tprobastat == null) Tprobastat = 0;
        Mprobastat = 0.4 * Tprobastat! + 0.6 * Eprobastat! ;
        /**********************************************/
        result = ( Mse2!*6 + Malgo2! * 6 + Manalyse2!*6 +  Malgebre2!*4
            + Mlogic!*4 + Mprobastat! * 4  + Mtso!  ) / 31 ;
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
                                          annee: 'infoIng1S2',
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
            child: Text(' INGENIEUR 1ere S2 ',style: TextStyle(fontSize: 18),)
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
                          dat.module3('ALGORITHMIQUE ET STRUCTURE DE DONNEES 2', tpALGO2, tdALGO2, examenALGO2 , Malgo2! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value);
                              }),
                          SizedBox(height: 20,),
                          dat.module2("ANALYSE 2", tdANALYSE2, examenANALYSE2 , Manalyse2! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value) ;
                              }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module3("INTRODUCTION AUX SYSTEMES D'EXPLOITATION 2 ",tdSE2, tpSE2, examenSE2 , Mse2! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value);
                              } ),
                          SizedBox(height: 20,),
                          dat.module2('ALGEBRE2', tdALGEBRE2, examenALGEBRE2 , Malgebre2! ,
                                  (value){ calculate(); }  , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module2('LOGIQUE MATHEMATIQUE',   tdLOGIC, examenLOGIC , Mlogic!
                              , (value){ calculate();  }  , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module2('PROBABILITES ET STATISTIQUE 1',tpPROBASTAT, examenPROBASTAT , Mprobastat! ,
                                  (value){ calculate();  }  , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module1("TECHNIQUE D'EXPRESSION ORALE", examenTSO, Mtso!,
                                (value){ calculate();} , validator: (String ?value) {
                              return dat.valid(value);
                            },),

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
                            data.listIndex = 7;
                            dat.getfromDB().then((value){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=> historyTest("INGENIEUR 1ere S2")
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