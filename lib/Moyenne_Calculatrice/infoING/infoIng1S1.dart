import 'package:flutter/material.dart';
import '../data.dart';
import '../histotyTest.dart';
import '../homePage.dart';
// T = TP  , D = TD , M = Moyenne module
class infoIng1S1 extends StatefulWidget {
  const infoIng1S1({Key? key}) : super(key: key);

  @override
  State<infoIng1S1> createState() => _infoIng1S1();
}

class _infoIng1S1 extends State<infoIng1S1> {

  @override
  void initState() {  //=== initialeState == first setState
    // TODO: implement initState
    super.initState();
    dat.createDB(); // run when execute
  }
  data dat = data();

  TextEditingController tpSE = TextEditingController(); //2it's a class // tpalgo.text // attribue .text
  TextEditingController examenSE = TextEditingController();
  double ? Tse=0 , Mse=0 , Ese=0  ;

  TextEditingController tpALGO = TextEditingController(); //2it's a class // tpalgo.text // attribue .text
  TextEditingController tdALGO = TextEditingController();
  TextEditingController examenALGO = TextEditingController();
  double ? Talgo=0 , Malgo=0 , Ealgo=0 ,Dalgo=0 ;

  TextEditingController tdANALYSE1 = TextEditingController();
  TextEditingController examenANALYSE1 = TextEditingController();
  double ?  Manalyse1=0 , Eanalyse1=0 ,Danalyse1=0 ;


  TextEditingController tdAO1 = TextEditingController();
  TextEditingController examenAO1 = TextEditingController();
  double ? Mao1=0 , Eao1=0 ,Dao1=0 ;

  TextEditingController tdALGEBRE1 = TextEditingController();
  TextEditingController examenALGEBRE1 = TextEditingController();
  double ? Malgebre1=0 , Ealgebre1=0 ,Dalgebre1=0 ;


  TextEditingController examenTSE = TextEditingController();
  double ? Mtse=0 ;


  TextEditingController examenBUREAU = TextEditingController();
  TextEditingController tpBUREAU = TextEditingController();
  double ? Mbureau=0 , Tbureau = 0 , Ebureau;


  double ? result=0;

  var scaffoldKey = GlobalKey<ScaffoldState>(); //bottomsheet
  var formKey = GlobalKey<FormState>();         //validation

  bool isShownBottomSheet = false;
  @override
  Widget build(BuildContext context) {
    calculate(){
      setState(() {
        /////////////////////////////////////
        Tse = double.tryParse(tpSE.text);
        if (Tse == null) Tse = 0; // cauze null + value == Error
        Ese = double.tryParse(examenSE.text);
        if (Ese == null) Ese = 0;
        Mse = Tse! * 0.4 + Ese! * 0.6;
        /////////////////////////////////////
        Talgo = double.tryParse(tpALGO.text);
        if (Talgo == null) Talgo = 0; // cauze null + value == Error
        Dalgo = double.tryParse(tdALGO.text);
        if (Dalgo == null) Dalgo = 0;
        Ealgo = double.tryParse(examenALGO.text);
        if (Ealgo == null) Ealgo = 0;
        Malgo = Talgo! * 0.2 + Dalgo! * 0.2 + Ealgo! * 0.6;
        /////////////////////////////////////
         // cauze null + value == Error
        Danalyse1 = double.tryParse(tdANALYSE1.text);
        if (Danalyse1 == null) Danalyse1 = 0;
        Eanalyse1 = double.tryParse(examenANALYSE1.text);
        if (Eanalyse1 == null) Eanalyse1 = 0;
        Manalyse1 =  Danalyse1! * 0.4 + Eanalyse1! * 0.6;
        /////////////////////////////////////////////////
        Dalgebre1 = double.tryParse(tdALGEBRE1.text);
        if (Dalgebre1 == null) Dalgebre1 = 0;
        Ealgebre1 = double.tryParse(examenALGEBRE1.text);
        if (Ealgebre1 == null) Ealgebre1 = 0;
        Malgebre1 = Dalgebre1! * 0.4 + Ealgebre1! * 0.6;
        /**********************************************/
        Mtse = double.tryParse(examenTSE.text);
        if (Mtse == null) Mtse = 0;
        /**********************************************/
        Dao1 = double.tryParse(tdAO1.text);
        if (Dao1 == null) Dao1 = 0;
        Eao1 = double.tryParse(examenAO1.text);
        if (Eao1 == null) Eao1 = 0;
        Mao1 = Dao1! * 0.4 + Eao1! * 0.6;
        /**********************************************/
        Ebureau = double.tryParse(examenBUREAU.text);
        if (Ebureau == null) Ebureau = 0;
        Tbureau = double.tryParse(tpBUREAU.text);
        if (Tbureau == null) Tbureau = 0;
        Mbureau = 0.4 * Tbureau! + 0.6 * Ebureau! ;
        /**********************************************/
        result = ( Mse!*4 + Malgo! * 6 + Manalyse1!*6 +  Malgebre1!*4
            + Mao1!*4 + Mbureau!  + Mtse!  ) / 26 ;
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
                                          annee: 'infoIng1S1',
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
            child: Text(' INGENIEUR 1ere S1 ',style: TextStyle(fontSize: 18),)
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
                          dat.module3('ALGORITHMIQUE ET STRUCTURE DE DONNEES', tpALGO, tdALGO, examenALGO , Malgo! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value);
                              }),
                          SizedBox(height: 20,),
                          dat.module2("ANALYSE 1", tdANALYSE1, examenANALYSE1 , Manalyse1! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value) ;
                              }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module2('ARCHITECTURE DES ORDINATEURS 1',   tdAO1, examenAO1 , Mao1!
                              , (value){ calculate();  }  , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module2("INTRODUCTION AUX SYSTEMES D'EXPLOITATION 1 ", tpSE, examenSE , Mse! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value);
                              } , tdOrTp: 'TP' ),
                          SizedBox(height: 20,),
                          dat.module2('ALGEBRE1', tdALGEBRE1, examenALGEBRE1 , Malgebre1! ,
                                  (value){ calculate(); }  , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module1("TECHNIQUE D'EXPRESSION ECRITE", examenTSE, Mtse!,
                                  (value){ calculate();} , validator: (String ?value) {
                                return dat.valid(value);
                              },),
                          SizedBox(height: 20,),
                          dat.module2('BUREAUTIQUE ET WEB',tpBUREAU, examenBUREAU , Mbureau! ,
                                  (value){ calculate();  }  , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TP'),
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
                            data.listIndex = 6;
                            dat.getfromDB().then((value){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=> historyTest("INGENIEUR 1ere S1")
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
                              Text('S1 : ${result!.toStringAsFixed(2)}',
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