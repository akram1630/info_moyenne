import 'package:flutter/material.dart';


import '../data.dart';
import '../histotyTest.dart';
import '../homePage.dart';
// T = TP  , D = TD , M = Moyenne module
class infoLmd1S2 extends StatefulWidget {
  const infoLmd1S2({Key? key}) : super(key: key);

  @override
  State<infoLmd1S2> createState() => _infoLmd1S2();
}

class _infoLmd1S2 extends State<infoLmd1S2> {

  @override
  void initState() {  //=== initialeState == first setState
    // TODO: implement initState
    super.initState();
    dat.createDB(); // run when execute
  }
  data dat = data();

  TextEditingController tpAlgo2 = TextEditingController(); //2it's a class // tpalgo.text // attribue .text
  TextEditingController tdAlgo2 = TextEditingController();
  TextEditingController examenAlgo2 = TextEditingController();
  double ? Talgo2=0 , Malgo2=0 , Ealgo2=0 ,Dalgo2=0 ;

  TextEditingController tdAnalyse2 = TextEditingController();
  TextEditingController examenAnalyse2 = TextEditingController();
  double ? Manalyse2=0 , Eanalyse2=0 ,Danalyse2=0  ;

  TextEditingController tdSM2 = TextEditingController();
  TextEditingController examenSM2 = TextEditingController();
  double ? Msm2=0 , Esm2=0 ,Dsm2=0 ;

  TextEditingController tdAlgebre2 = TextEditingController();
  TextEditingController examenAlgebre2 = TextEditingController();
  double ? Malgebre2=0 , Ealgebre2=0 ,Dalgebre2=0 ;

  TextEditingController tpOPM = TextEditingController();
  TextEditingController examenOPM = TextEditingController();
  double ? Mopm=0 , Eopm=0 , Topm=0 ;

  TextEditingController tdIPSD = TextEditingController();
  TextEditingController examenIPSD = TextEditingController();
  double ? Mipsd=0 , Eipsd=0 ,Dipsd=0 ;

  TextEditingController tdPhysique2 = TextEditingController();
  TextEditingController examenPhysique2 = TextEditingController();
  double ? Mphysique2=0 , Ephysique2=0 ,Dphysique2=0  ;

  TextEditingController examenTic = TextEditingController();
  double ? Mtic=0 ;


  double ? result=0;

  var scaffoldKey = GlobalKey<ScaffoldState>(); //bottomsheet
  var formKey = GlobalKey<FormState>();         //validation

  bool isShownBottomSheet = false;
  @override
  Widget build(BuildContext context) {
    calculate(){
      setState(() {

        /////////////////////////////////////
        Talgo2 = double.tryParse(tpAlgo2.text);
        if (Talgo2 == null) Talgo2 = 0; // cauze null + value == Error
        Dalgo2 = double.tryParse(tdAlgo2.text);
        if (Dalgo2 == null) Dalgo2 = 0;
        Ealgo2 = double.tryParse(examenAlgo2.text);
        if (Ealgo2 == null) Ealgo2 = 0;
        Malgo2 = Talgo2! * 0.2 + Dalgo2! * 0.2 + Ealgo2! * 0.6;
        /////////////////////////////////////////////////
        Dalgebre2 = double.tryParse(tdAlgebre2.text);
        if (Dalgebre2 == null) Dalgebre2 = 0;
        Ealgebre2 = double.tryParse(examenAlgebre2.text);
        if (Ealgebre2 == null) Ealgebre2 = 0;
        Malgebre2 = Dalgebre2! * 0.4 + Ealgebre2! * 0.6;
        /**********************************************/
        Dipsd = double.tryParse(tdIPSD.text);
        if (Dipsd == null) Dipsd = 0;
        Eipsd = double.tryParse(examenIPSD.text);
        if (Eipsd == null) Eipsd = 0;
        Mipsd = Dipsd! * 0.4 + Eipsd! * 0.6;
        /**********************************************/
        Topm = double.tryParse(tpOPM.text);
        if (Topm == null) Topm = 0;
        Eopm = double.tryParse(examenOPM.text);
        if (Eopm == null) Eopm = 0;
        Mopm = Topm! * 0.4 + Eopm! * 0.6;
        /**********************************************/
        Dphysique2 = double.tryParse(tdPhysique2.text);
        if (Dphysique2 == null) Dphysique2 = 0;
        Ephysique2 = double.tryParse(examenPhysique2.text);
        if (Ephysique2 == null) Ephysique2 = 0;
        Mphysique2 = Dphysique2! * 0.4 + Ephysique2! * 0.6;
        /**********************************************/
        Danalyse2 = double.tryParse(tdAnalyse2.text);
        if (Danalyse2 == null) Danalyse2 = 0;
        Eanalyse2 = double.tryParse(examenAnalyse2.text);
        if (Eanalyse2 == null) Eanalyse2 = 0;
        Manalyse2 = Danalyse2! * 0.4 + Eanalyse2! * 0.6;
        /**********************************************/
        Dsm2 = double.tryParse(tdSM2.text);
        if (Dsm2 == null) Dsm2 = 0;
        Esm2 = double.tryParse(examenSM2.text);
        if (Esm2 == null) Esm2 = 0;
        Msm2 = Dsm2! * 0.4 + Esm2! * 0.6;
        /**********************************************/
        Mtic = double.tryParse(examenTic.text);
        if (Mtic == null) Mtic = 0;
        /**********************************************/
        result = ( Malgo2!*4 + Malgebre2!*2  + Manalyse2!*4
            + Msm2!*2 + Mphysique2!*2 + Mtic! + Mipsd! * 2 + Mopm! ) / 18 ;
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
                      child: Text('SAVE' , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold),),
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
                                        annee: 'infoLmd1S2',
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
                        //mode = !mode ;

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
            child: Text(' LICENCE L1 S2 ')),
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
                          dat.module2('ANALYSE 2', tdAnalyse2, examenAnalyse2 , Manalyse2! ,
                                  (value){ calculate();  } , validator:(value){
                                return dat.valid(value!);
                              }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module2('ALGEBRE 2', tdAlgebre2, examenAlgebre2 , Malgebre2! ,
                                  (value){ calculate(); }  , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module3('ALGORITHME ET STRUCTURE DES DONNES 2', tpAlgo2, tdAlgo2, examenAlgo2 , Malgo2! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value);
                          }),
                          SizedBox(height: 20,),
                          dat.module2('STRUCTURE MACHINE 2',  tdSM2, examenSM2 , Msm2!
                              , (value){ calculate();  }  , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module2("INTRODUCTION AUX PROBABILITES ET STATISTIQUE DESCRIPTIVE", tdIPSD, examenIPSD, Mipsd!,
                                  (value){ calculate();} , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module1("TECHNOLOGIE DE L'INFORMATION ET DE LA COMMUNICATION", examenTic , Mtic! ,
                                  (value){ calculate();  }  , validator: (String ?value) {
                                return dat.valid(value);
                          }),
                          SizedBox(height: 20,),
                          dat.module2("Outils de programmation scientifique", tpOPM, examenOPM, Mopm!,
                                  (value){ calculate();} , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TP'),
                          SizedBox(height: 20,),
                          dat.module2('PHISIQUE 2', tdPhysique2, examenPhysique2 , Mphysique2!
                              , (value){ calculate();  } , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TD'),
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
                            data.listIndex = 1;
                            dat.getfromDB().then((value){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=> historyTest("LICENCE L1 S2")
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
