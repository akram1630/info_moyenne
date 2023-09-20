import 'package:flutter/material.dart';


import '../data.dart';
import '../histotyTest.dart';
import '../homePage.dart';
// T = TP  , D = TD , M = Moyenne module
class infoLmd1S1 extends StatefulWidget {
  const infoLmd1S1({Key? key}) : super(key: key);

  @override
  State<infoLmd1S1> createState() => _infoLmd1S1();
}

class _infoLmd1S1 extends State<infoLmd1S1> {

  @override
  void initState() {  //=== initialeState == first setState
    // TODO: implement initState
    super.initState();
    dat.createDB(); // run when execute
  }
  data dat = data();

  TextEditingController tpAlgo1 = TextEditingController(); // it's a class // tpalgo.text // attribue .text
  TextEditingController tdAlgo1 = TextEditingController();
  TextEditingController examenAlgo1 = TextEditingController();
  double ? Talgo1=0 , Malgo1=0 , Ealgo1=0 ,Dalgo1=0 ;

  TextEditingController tdAnalyse1 = TextEditingController();
  TextEditingController examenAnalyse1 = TextEditingController();
  double ? Manalyse1=0 , Eanalyse1=0 ,Danalyse1=0   ;

  TextEditingController tdSM1 = TextEditingController();
  TextEditingController examenSM1 = TextEditingController();
  double ? Msm=0 , Esm=0 ,Dsm=0 ;

  TextEditingController tdAlgebre1 = TextEditingController();
  TextEditingController examenAlgebre1 = TextEditingController();
  double ? Malgebre1=0 , Ealgebre1=0 ,Dalgebre1=0  ;

  TextEditingController tdPhysique1 = TextEditingController();
  TextEditingController examenPhysique1 = TextEditingController();
  double ? Mphysique1=0 , Ephysique1=0 ,Dphysique1=0  ;

  TextEditingController examenTse = TextEditingController();
  double ? Mtse=0 ;

  TextEditingController examenAnglais1 = TextEditingController();
  double ? MAnglais1=0 ;


  double ? result=0;

  bool mode = false  ;

  var scaffoldKey = GlobalKey<ScaffoldState>(); //bottomsheet
  var formKey = GlobalKey<FormState>();         //validation

  bool isShownBottomSheet = false;
  @override
  Widget build(BuildContext context) {
    calculate(){
      setState(() {

        /////////////////////////////////////
        Talgo1 = double.tryParse(tpAlgo1.text);
        if (Talgo1 == null) Talgo1 = 0; // cauze null + value == Error
        Dalgo1 = double.tryParse(tdAlgo1.text);
        if (Dalgo1 == null) Dalgo1 = 0;
        Ealgo1 = double.tryParse(examenAlgo1.text);
        if (Ealgo1 == null) Ealgo1 = 0;
        Malgo1 = Talgo1! * 0.2 + Dalgo1! * 0.2 + Ealgo1! * 0.6;
        /////////////////////////////////////////////////
        Dalgebre1 = double.tryParse(tdAlgebre1.text);
        if (Dalgebre1 == null) Dalgebre1 = 0;
        Ealgebre1 = double.tryParse(examenAlgebre1.text);
        if (Ealgebre1 == null) Ealgebre1 = 0;
        Malgebre1 = Dalgebre1! * 0.4 + Ealgebre1! * 0.6;
        /**********************************************/
        Dphysique1 = double.tryParse(tdPhysique1.text);
        if (Dphysique1 == null) Dphysique1 = 0;
        Ephysique1 = double.tryParse(examenPhysique1.text);
        if (Ephysique1 == null) Ephysique1 = 0;
        Mphysique1 = Dphysique1! * 0.4 + Ephysique1! * 0.6;
        /**********************************************/
        Danalyse1 = double.tryParse(tdAnalyse1.text);
        if (Danalyse1 == null) Danalyse1 = 0;
        Eanalyse1 = double.tryParse(examenAnalyse1.text);
        if (Eanalyse1 == null) Eanalyse1 = 0;
        Manalyse1 = Danalyse1! * 0.4 + Eanalyse1! * 0.6;
        /**********************************************/
        Dsm = double.tryParse(tdSM1.text);
        if (Dsm == null) Dsm = 0;
        Esm = double.tryParse(examenSM1.text);
        if (Esm == null) Esm = 0;
        Msm = Dsm! * 0.4 + Esm! * 0.6;
        /**********************************************/
        MAnglais1 = double.tryParse(examenAnglais1.text);
        if (MAnglais1 == null) MAnglais1 = 0;
        /**********************************************/
        Mtse = double.tryParse(examenTse.text);
        if (Mtse == null) Mtse = 0;
        /**********************************************/
        result = ( Malgo1!*4 + Malgebre1!*3  + Manalyse1!*4
            + Msm!*3 + Mphysique1!*2 + MAnglais1! + Mtse! ) / 18 ;
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
                                            annee: 'infoLmd1S1',
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
                        //  mode = !mode ;

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
            child: Text(' LICENCE L1 S1 ')
        ),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () async {return false;},
        child: Container(
          color: mode ? Colors.blue[900] : Colors.white,
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
                          dat.module2('ANALYSE 1', tdAnalyse1, examenAnalyse1 , Manalyse1! ,
                                  (value){ calculate();  } , validator:(value){
                                return dat.valid(value!);
                              } , tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module2('ALGEBRE 1', tdAlgebre1, examenAlgebre1 , Malgebre1! ,
                                  (value){ calculate(); }  , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module3('ALGORITHME ET STRUCTURE DES DONNES 1', tpAlgo1, tdAlgo1, examenAlgo1 , Malgo1! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value);
                          }),
                          SizedBox(height: 20,),
                          dat.module2('STRUCTURE MACHINE 1',  tdSM1, examenSM1 , Msm!
                              , (value){ calculate();  }  , validator: (String ?value) {
                                return dat.valid(value);
                          }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module1('TERMINOLOGIE SCIENTIFIQUE ET EXPRESSION ECRITE', examenTse , Mtse! ,
                                  (value){ calculate();  }  , validator: (String ?value) {
                                return dat.valid(value);
                              }),
                          SizedBox(height: 20,),
                          dat.module1('ANGLAIS 1',  examenAnglais1 , MAnglais1! ,
                                  (value){ calculate();  } , validator: (String ?value) {
                                return dat.valid(value);
                              }),
                          SizedBox(height: 20,),
                          dat.module2('PHISIQUE 1', tdPhysique1, examenPhysique1 , Mphysique1!
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
                              data.listIndex = 0;
                              dat.getfromDB().then((value){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context)=> historyTest('LICENCE L1 S1')//historyinfoLmd1S1()
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


