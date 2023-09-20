import 'package:flutter/material.dart';
import '../data.dart';
import '../histotyTest.dart';
import '../homePage.dart';
// T = TP  , D = TD , M = Moyenne module
class infoIng2S1 extends StatefulWidget {
  const infoIng2S1({Key? key}) : super(key: key);

  @override
  State<infoIng2S1> createState() => _infoIng2S1();
}

class _infoIng2S1 extends State<infoIng2S1> {

  @override
  void initState() {  //=== initialeState == first setState
    // TODO: implement initState
    super.initState();
    dat.createDB(); // run when execute
  }
  data dat = data();

  TextEditingController tpSTRUCT = TextEditingController(); //2it's a class // tpalgocomp.text // attribue .text
  TextEditingController examenSTRUCT = TextEditingController();
  double ? Tstruct=0 , Mstruct=0 , Estruct=0  ;

  TextEditingController tdALGOCOMP = TextEditingController();
  TextEditingController examenALGOCOMP = TextEditingController();
  double ?  Malgocomp=0 , Ealgocomp=0 ,Dalgocomp=0 ;

  TextEditingController tdANALYSE3 = TextEditingController();
  TextEditingController examenANALYSE3 = TextEditingController();
  double ?  Manalyse3=0 , Eanalyse3=0 ,Danalyse3=0 ;


  TextEditingController tpPOO1 = TextEditingController();
  TextEditingController examenPOO1 = TextEditingController();
  double ? Mpoo1=0 , Epoo1=0 ,Tpoo1=0 ;

  TextEditingController tdALGEBRE3 = TextEditingController();
  TextEditingController examenALGEBRE3 = TextEditingController();
  double ? Malgebre3=0 , Ealgebre3=0 ,Dalgebre3=0 ;

 TextEditingController tdAO2 = TextEditingController();
  TextEditingController examenAO2 = TextEditingController();
  double ? Mao2=0 , Eao2=0 ,Dao2=0 ;


TextEditingController examenENTREP = TextEditingController();
  double ? Mentrep=0 ;


  TextEditingController examenPROBASTAT2 = TextEditingController();
  TextEditingController tdPROBASTAT2 = TextEditingController();
  double ? Mprobastat2=0 , Dprobastat2 = 0 , Eprobastat2;


  double ? result=0;

  var scaffoldKey = GlobalKey<ScaffoldState>(); //bottomsheet
  var formKey = GlobalKey<FormState>();         //validation

  bool isShownBottomSheet = false;
  @override
  Widget build(BuildContext context) {
    calculate(){
      setState(() {
        /////////////////////////////////////
        Tstruct = double.tryParse(tpSTRUCT.text);
        if (Tstruct == null) Tstruct = 0; // cauze null + value == Error
        Estruct = double.tryParse(examenSTRUCT.text);
        if (Estruct == null) Estruct = 0;
        Mstruct = Tstruct! * 0.4 + Estruct! * 0.6;
        /////////////////////////////////////
        Dalgocomp = double.tryParse(tdALGOCOMP.text);
        if (Dalgocomp == null) Dalgocomp = 0; // cauze null + value == Error
        Ealgocomp = double.tryParse(examenALGOCOMP.text);
        if (Ealgocomp == null) Ealgocomp = 0;
        Malgocomp = Dalgocomp! * 0.4 + Ealgocomp! * 0.6;
        /////////////////////////////////////
        // cauze null + value == Error
        Danalyse3 = double.tryParse(tdANALYSE3.text);
        if (Danalyse3 == null) Danalyse3 = 0;
        Eanalyse3 = double.tryParse(examenANALYSE3.text);
        if (Eanalyse3 == null) Eanalyse3 = 0;
        Manalyse3 =  Danalyse3! * 0.4 + Eanalyse3! * 0.6;
        /////////////////////////////////////////////////
        Dalgebre3 = double.tryParse(tdALGEBRE3.text);
        if (Dalgebre3 == null) Dalgebre3 = 0;
        Ealgebre3 = double.tryParse(examenALGEBRE3.text);
        if (Ealgebre3 == null) Ealgebre3 = 0;
        Malgebre3 = Dalgebre3! * 0.4 + Ealgebre3! * 0.6;
        /**********************************************/
        Dao2 = double.tryParse(tdAO2.text);
        if (Dao2 == null) Dao2 = 0;
        Eao2 = double.tryParse(examenAO2.text);
        if (Eao2 == null) Eao2 = 0;
        Mao2 = Dao2! * 0.4 + Eao2! * 0.6;
        /**********************************************/
        Mentrep = double.tryParse(examenENTREP.text);
        if (Mentrep == null) Mentrep = 0;
        /**********************************************/
        Tpoo1 = double.tryParse(tpPOO1.text);
        if (Tpoo1 == null) Tpoo1 = 0;
        Epoo1 = double.tryParse(examenPOO1.text);
        if (Epoo1 == null) Epoo1 = 0;
        Mpoo1 = Tpoo1! * 0.4 + Epoo1! * 0.6;
        /**********************************************/
        Eprobastat2 = double.tryParse(examenPROBASTAT2.text);
        if (Eprobastat2 == null) Eprobastat2 = 0;
        Dprobastat2 = double.tryParse(tdPROBASTAT2.text);
        if (Dprobastat2 == null) Dprobastat2 = 0;
        Mprobastat2 = 0.4 * Dprobastat2! + 0.6 * Eprobastat2! ;
        /**********************************************/
        result = ( Mstruct!*5 + Malgocomp! * 4 + Manalyse3!*4 +  Malgebre3!*4
            + Mao2! * 5 + Mpoo1!*5 + Mprobastat2! * 2 + Mentrep!  ) / 30 ;
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
                                          annee: 'infoIng2S1',
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
            child: Text(' INGENIEUR 2eme S1 ' ,style: TextStyle(fontSize: 18),)
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
                          dat.module2("STRUCTURES DE FICHIERS ET STRUCTURE DE DONNEES " ,tpSTRUCT, examenSTRUCT , Mstruct! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value);
                              } , tdOrTp: 'TP'),
                          SizedBox(height: 20,),
                          dat.module2('ALGEBRE3', tdALGEBRE3, examenALGEBRE3 , Malgebre3! ,
                                  (value){ calculate(); }  , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module2('PROGRAMMATION ORIENTEE OBJET 1',   tpPOO1, examenPOO1 , Mpoo1!
                              , (value){ calculate();  }  , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TP'),
                          SizedBox(height: 20,),
                          dat.module2('ALGORITHMIQUE ET COMPLEXITE', tdALGOCOMP, examenALGOCOMP , Malgocomp! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value);
                              } , tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module2('ARCHITECTURE DES ORDINATEURS 2', tdAO2, examenAO2 , Mao2! ,
                                  (value){ calculate(); }  , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module2("ANALYSE 3", tdANALYSE3, examenANALYSE3 , Manalyse3! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value) ;
                              }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module2('PROBABILITES ET STATISTIQUE 2',tdPROBASTAT2, examenPROBASTAT2 , Mprobastat2! ,
                                  (value){ calculate();  }  , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module1("ENTREPRENARIAT", examenENTREP, Mentrep!,
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
                            data.listIndex = 8;
                            dat.getfromDB().then((value){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=> historyTest("INGENIEUR 2eme S1")
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