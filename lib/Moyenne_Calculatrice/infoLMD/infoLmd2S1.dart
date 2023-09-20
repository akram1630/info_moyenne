import 'package:flutter/material.dart';


import '../data.dart';
import '../histotyTest.dart';
import '../homePage.dart';
// T = TP  , D = TD , M = Moyenne module
class infoLmd2S1 extends StatefulWidget {
  const infoLmd2S1({Key? key}) : super(key: key);

  @override
  State<infoLmd2S1> createState() => _infoLmd2S1();
}

class _infoLmd2S1 extends State<infoLmd2S1> {

  @override
  void initState() {  //=== initialeState == first setState
    // TODO: implement initState
    super.initState();
    dat.createDB(); // run when execute
  }
  data dat = data();

  TextEditingController tpAlgo3 = TextEditingController(); //2it's a class // tpalgo.text // attribue .text
  TextEditingController tdAlgo3 = TextEditingController();
  TextEditingController examenAlgo3 = TextEditingController();
  double ? Talgo3=0 , Malgo3=0 , Ealgo3=0 ,Dalgo3=0 ;

  TextEditingController tpAO = TextEditingController(); //2it's a class // tpalgo.text // attribue .text
  TextEditingController tdAO = TextEditingController();
  TextEditingController examenAO = TextEditingController();
  double ? Tao=0 , Mao=0 , Eao=0 ,Dao=0 ;

  TextEditingController tpSI = TextEditingController(); //2it's a class // tpalgo.text // attribue .text
  TextEditingController tdSI = TextEditingController();
  TextEditingController examenSI = TextEditingController();
  double ? Tsi=0 , Msi=0 , Esi=0 ,Dsi=0 ;


  TextEditingController tdTG = TextEditingController();
  TextEditingController examenTG = TextEditingController();
  double ? Mtg=0 , Etg=0 ,Dtg=0 ;

  TextEditingController tdLM = TextEditingController();
  TextEditingController examenLM = TextEditingController();
  double ? Mlm=0 , Elm=0 ,Dlm=0 ;

  TextEditingController tpMN = TextEditingController();
  TextEditingController examenMN = TextEditingController();
  double ? Mmn=0 , Emn=0 , Tmn=0 ;


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
        Talgo3 = double.tryParse(tpAlgo3.text);
        if (Talgo3 == null) Talgo3 = 0; // cauze null + value == Error
        Dalgo3 = double.tryParse(tdAlgo3.text);
        if (Dalgo3 == null) Dalgo3 = 0;
        Ealgo3 = double.tryParse(examenAlgo3.text);
        if (Ealgo3 == null) Ealgo3 = 0;
        Malgo3 = Talgo3! * 0.2 + Dalgo3! * 0.2 + Ealgo3! * 0.6;
        /////////////////////////////////////
        Tao = double.tryParse(tpAO.text);
        if (Tao == null) Tao = 0; // cauze null + value == Error
        Dao = double.tryParse(tdAO.text);
        if (Dao == null) Dao = 0;
        Eao = double.tryParse(examenAO.text);
        if (Eao == null) Eao = 0;
        Mao = Tao! * 0.2 + Dao! * 0.2 + Eao! * 0.6;
        /////////////////////////////////////
        Tsi = double.tryParse(tpSI.text);
        if (Tsi == null) Tsi = 0; // cauze null + value == Error
        Dsi = double.tryParse(tdSI.text);
        if (Dsi == null) Dsi = 0;
        Esi = double.tryParse(examenSI.text);
        if (Esi == null) Esi = 0;
        Msi = Tsi! * 0.2 + Dsi! * 0.2 + Esi! * 0.6;
        /////////////////////////////////////////////////
        Dlm = double.tryParse(tdLM.text);
        if (Dlm == null) Dlm = 0;
        Elm = double.tryParse(examenLM.text);
        if (Elm == null) Elm = 0;
        Mlm = Dlm! * 0.4 + Elm! * 0.6;
        /**********************************************/
        Tmn = double.tryParse(tpMN.text);
        if (Tmn == null) Tmn = 0;
        Emn = double.tryParse(examenMN.text);
        if (Emn == null) Emn = 0;
        Mmn = Tmn! * 0.4 + Emn! * 0.6;
        /**********************************************/
        Dtg = double.tryParse(tdTG.text);
        if (Dtg == null) Dtg = 0;
        Etg = double.tryParse(examenTG.text);
        if (Etg == null) Etg = 0;
        Mtg = Dtg! * 0.4 + Etg! * 0.6;
        /**********************************************/
        Mang = double.tryParse(examenANG.text);
        if (Mang == null) Mang = 0;
        /**********************************************/
        result = ( Malgo3!*3 + Mao! * 3 + Msi!*3 +  Mlm!*2
            + Mtg!*2 + Mang!  + Mmn! *2 ) / 16 ;
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
                                          annee: 'infoLmd2S1',
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
            child: Text(' LICENCE L2 S1 ')),
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
                          dat.module3('ARCHITECTURE DES ORDINATEURS', tpAO, tdAO, examenAO , Mao! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value);
                              }),
                          SizedBox(height: 20,),
                          dat.module3('ALGORITHME ET STRUCTURE DES DONNES 3', tpAlgo3, tdAlgo3, examenAlgo3 , Malgo3! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value);
                              }),
                          SizedBox(height: 20,),
                          dat.module3("SYSTEMES D'INFORMATION", tpSI, tdSI, examenSI , Msi! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value);
                          }),
                          SizedBox(height: 20,),
                          dat.module2('THEORIE DES GRAPHES',  tdTG, examenTG , Mtg!
                              , (value){ calculate();  }  , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module2("METHODES NUMIRIQUES", tpMN, examenMN, Mmn!,
                                  (value){ calculate();} , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TP'),
                          SizedBox(height: 20,),
                          dat.module2('LOGIQUE MATHEMATIQUE', tdLM, examenLM , Mlm! ,
                                  (value){ calculate(); }  , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module1('ANGLAIS', examenANG , Mang! ,
                                  (value){ calculate();  }  , validator: (String ?value) {
                                return dat.valid(value);
                          }),
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
                            data.listIndex = 2;
                            dat.getfromDB().then((value){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=> historyTest("LICENCE L2 S1")
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
