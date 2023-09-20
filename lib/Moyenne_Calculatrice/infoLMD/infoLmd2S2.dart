import 'package:flutter/material.dart';


import '../data.dart';
import '../histotyTest.dart';
import '../homePage.dart';
// T = TP  , D = TD , M = Moyenne module
class infoLmd2S2 extends StatefulWidget {
  const infoLmd2S2({Key? key}) : super(key: key);

  @override
  State<infoLmd2S2> createState() => _infoLmd2S2();
}

class _infoLmd2S2 extends State<infoLmd2S2> {

  @override
  void initState() {  //=== initialeState == first setState
    // TODO: implement initState
    super.initState();
    dat.createDB(); // run when execute
  }
  data dat = data();

  TextEditingController tpSE = TextEditingController(); //2it's a class // tpalgo.text // attribue .text
  TextEditingController tdSE = TextEditingController();
  TextEditingController examenSE = TextEditingController();
  double ? Tse=0 , Mse=0 , Ese=0 ,Dse=0 ;

  TextEditingController tpTL = TextEditingController(); //2it's a class // tpalgo.text // attribue .text
  TextEditingController tdTL = TextEditingController();
  TextEditingController examenTL = TextEditingController();
  double ? Ttl=0 , Mtl=0 , Etl=0 ,Dtl=0 ;

  TextEditingController tpBD = TextEditingController(); //2it's a class // tpalgo.text // attribue .text
  TextEditingController tdBD = TextEditingController();
  TextEditingController examenBD = TextEditingController();
  double ? Tbd=0 , Mbd=0 , Ebd=0 ,Dbd=0 ;


  TextEditingController tdRES = TextEditingController();
  TextEditingController tpRES = TextEditingController();
  TextEditingController examenRES = TextEditingController();
  double ? Mres=0 , Eres=0 ,Dres=0 , Tres ;

  TextEditingController tpPOO = TextEditingController();
  TextEditingController examenPOO = TextEditingController();
  double ? Mpoo=0 , Epoo=0 ,Tpoo=0 ;

  TextEditingController tpDAW = TextEditingController();
  TextEditingController examenDAW = TextEditingController();
  double ? Mdaw=0 , Edaw=0 , Tdaw=0 ;


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
        Tse = double.tryParse(tpSE.text);
        if (Tse == null) Tse = 0; // cauze null + value == Error
        Dse = double.tryParse(tdSE.text);
        if (Dse == null) Dse = 0;
        Ese = double.tryParse(examenSE.text);
        if (Ese == null) Ese = 0;
        Mse = Tse! * 0.2 + Dse! * 0.2 + Ese! * 0.6;
        /////////////////////////////////////
        Ttl = double.tryParse(tpTL.text);
        if (Ttl == null) Ttl = 0; // cauze null + value == Error
        Dtl = double.tryParse(tdTL.text);
        if (Dtl == null) Dtl = 0;
        Etl = double.tryParse(examenTL.text);
        if (Etl == null) Etl = 0;
        Mtl = Ttl! * 0.2 + Dtl! * 0.2 + Etl! * 0.6;
        /////////////////////////////////////
        Tbd = double.tryParse(tpBD.text);
        if (Tbd == null) Tbd = 0; // cauze null + value == Error
        Dbd = double.tryParse(tdBD.text);
        if (Dbd == null) Dbd = 0;
        Ebd = double.tryParse(examenBD.text);
        if (Ebd == null) Ebd = 0;
        Mbd = Tbd! * 0.2 + Dbd! * 0.2 + Ebd! * 0.6;
        /////////////////////////////////////////////////
        Tpoo = double.tryParse(tpPOO.text);
        if (Tpoo == null) Tpoo = 0;
        Epoo = double.tryParse(examenPOO.text);
        if (Epoo == null) Epoo = 0;
        Mpoo = Tpoo! * 0.4 + Epoo! * 0.6;
        /**********************************************/
        Tdaw = double.tryParse(tpDAW.text);
        if (Tdaw == null) Tdaw = 0;
        Edaw = double.tryParse(examenDAW.text);
        if (Edaw == null) Edaw = 0;
        Mdaw = Tdaw! * 0.4 + Edaw! * 0.6;
        /**********************************************/
        Dres = double.tryParse(tdRES.text);
        if (Dres == null) Dres = 0;
        Tres = double.tryParse(tpRES.text);
        if (Tres == null) Tres = 0;
        Eres = double.tryParse(examenRES.text);
        if (Eres == null) Eres = 0;
        Mres = Dres! * 0.2 + Tres!*0.2 + Eres! * 0.6;
        /**********************************************/
        Mang = double.tryParse(examenANG.text);
        if (Mang == null) Mang = 0;
        /**********************************************/
        result = ( Mse!*3 + Mtl! * 2 + Mbd!*3 +  Mpoo!*2
            + Mres!*3 + Mang!  + Mdaw! *2 ) / 16 ;
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
                                          annee: 'infoLmd2S2',
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
            child: Text(' LICENCE L2 S2 ')
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
                          dat.module3('THEORIE DES LANGUAGES', tpTL, tdTL, examenTL , Mtl! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value);
                              }),
                          SizedBox(height: 20,),
                          dat.module3("SYSTEME D'EXPLOITATION 1", tpSE, tdSE, examenSE , Mse! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value);
                          }),
                          SizedBox(height: 20,),
                          dat.module3("BASES DE DONNEES", tpBD, tdBD, examenBD , Mbd! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value) ;
                              }),
                          SizedBox(height: 20,),
                          dat.module3(  'RESEAUX', tpRES,  tdRES, examenRES , Mres!
                              , (value){ calculate();  }  , validator: (String ?value) {
                                return dat.valid(value);
                              }),

                          SizedBox(height: 20,),
                          dat.module2('PROGRAMMATION ORIENTÉ OBJET', tpPOO, examenPOO , Mpoo! ,
                                  (value){ calculate(); }  , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TP'),
                          SizedBox(height: 20,),
                          dat.module2("DEVELOPPEMENT D'APPLICATIONS WEB", tpDAW, examenDAW, Mdaw!,
                                  (value){ calculate();} , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TP'),
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
                            data.listIndex = 3;
                            dat.getfromDB().then((value){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=> historyTest("LICENCE L2 S2")
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
