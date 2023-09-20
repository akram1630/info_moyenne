import 'package:flutter/material.dart';


import '../data.dart';
import '../histotyTest.dart';
import '../homePage.dart';
// T = TP  , D = TD , M = Moyenne module
class infoLmd3S2 extends StatefulWidget {
  const infoLmd3S2({Key? key}) : super(key: key);

  @override
  State<infoLmd3S2> createState() => _infoLmd3S2();
}

class _infoLmd3S2 extends State<infoLmd3S2> {

  @override
  void initState() {  //=== initialeState == first setState
    // TODO: implement initState
    super.initState();
    dat.createDB(); // run when execute
  }
  data dat = data();

  TextEditingController tdCYBER = TextEditingController();
  TextEditingController examenCYBER = TextEditingController();
  double ?  Mcyber=0 , Ecyber=0 ,Dcyber=0 ;

  TextEditingController tpAPP = TextEditingController(); //2it's a class // tpalgo.text // attribue .text
  TextEditingController examenAPP = TextEditingController();
  double ? Tapp=0 , Mapp=0 , Eapp=0  ;

  TextEditingController tpINTEL = TextEditingController(); //2it's a class // tpalgo.text // attribue .text
  TextEditingController examenINTEL = TextEditingController();
  double ? Tintel=0 , Mintel=0 , Eintel=0  ;


  TextEditingController tpDONNEE = TextEditingController();
  TextEditingController examenDONNEE = TextEditingController();
  double ? Mdonnee=0 , Edonnee=0 , Tdonnee ;

  TextEditingController examenPROJ = TextEditingController();
  double ? Mproj=0  ;

  TextEditingController tdREDA = TextEditingController();
  TextEditingController examenREDA = TextEditingController();
  double ? Mreda=0 , Ereda=0 , Dreda=0 ;


  TextEditingController examenSTARTUP = TextEditingController();
  double ? Mstartup=0 ;


  double ? result=0;

  var scaffoldKey = GlobalKey<ScaffoldState>(); //bottomsheet
  var formKey = GlobalKey<FormState>();         //validation

  bool isShownBottomSheet = false;
  @override
  Widget build(BuildContext context) {
    calculate(){
      setState(() {
        /////////////////////////////////////
        // cauze null + value == Error
        Dcyber = double.tryParse(tdCYBER.text);
        if (Dcyber == null) Dcyber = 0;
        Ecyber = double.tryParse(examenCYBER.text);
        if (Ecyber == null) Ecyber = 0;
        Mcyber =  Dcyber! * 0.4 + Ecyber! * 0.6;
        /////////////////////////////////////
        Tapp = double.tryParse(tpAPP.text);
        if (Tapp == null) Tapp = 0; // cauze null + value == Error
        Eapp = double.tryParse(examenAPP.text);
        if (Eapp == null) Eapp = 0;
        Mapp = Tapp! * 0.4 + Eapp! * 0.6;
        /////////////////////////////////////
        Tintel = double.tryParse(tpINTEL.text);
        if (Tintel == null) Tintel = 0; // cauze null + value == Error
        Eintel = double.tryParse(examenINTEL.text);
        if (Eintel == null) Eintel = 0;
        Mintel = Tintel! * 0.4 + Eintel! * 0.6;
        /////////////////////////////////////////////////
        Mproj = double.tryParse(examenPROJ.text);
        if (Mproj == null) Mproj = 0;
        /**********************************************/
        Dreda = double.tryParse(tdREDA.text);
        if (Dreda == null) Dreda = 0;
        Ereda = double.tryParse(examenREDA.text);
        if (Ereda == null) Ereda = 0;
        Mreda = Dreda! * 0.4 + Ereda! * 0.6;
        /**********************************************/
        Tdonnee = double.tryParse(tpDONNEE.text);
        if (Tdonnee == null) Tdonnee = 0;
        Edonnee = double.tryParse(examenDONNEE.text);
        if (Edonnee == null) Edonnee = 0;
        Mdonnee =  Tdonnee!*0.4 + Edonnee! * 0.6;
        /**********************************************/
        Mstartup = double.tryParse(examenSTARTUP.text);
        if (Mstartup == null) Mstartup = 0;
        /**********************************************/
        result = ( Mcyber!*3 + Mapp! * 3 + Mintel!*3 +  Mproj!*3
            + Mdonnee!*3 + Mstartup!  + Mreda!  ) / 17;
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
                                          annee: 'infoLmd3S2',
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
            child: Text(' LICENCE L3 S2 ')
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
                          dat.module2('APPLICATIONS MOBILE', tpAPP, examenAPP , Mapp! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value);
                              }, tdOrTp: 'TP'),
                          SizedBox(height: 20,),
                            dat.module2("SÉCURITÉ INFORMATIQUE", tdCYBER, examenCYBER , Mcyber! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value);
                              }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module2("INTELLIGENCE ARTIFICIELLE", tpINTEL , examenINTEL , Mintel! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value) ;
                              }, tdOrTp: 'TP'),
                          SizedBox(height: 20,),
                          dat.module2('DONNÉES SÉMI STRUCTUREES', tpDONNEE, examenDONNEE , Mdonnee!
                              , (value){ calculate();  }  , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TP'),
                          SizedBox(height: 20,),
                          dat.module1('PROJET', examenPROJ , Mproj! ,
                                  (value){ calculate(); }  , validator: (String ?value) {
                                return dat.valid(value);
                              }),
                          SizedBox(height: 20,),
                          dat.module2("RÉDACTION SCIENTIFIQUE", tdREDA, examenREDA, Mreda!,
                                  (value){ calculate();} , validator: (String ?value) {
                                return dat.valid(value);
                              } , tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module1('CRÉER ET DÉVELOPPER UNE STARTUP', examenSTARTUP , Mstartup! ,
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
                            data.listIndex = 5;
                            dat.getfromDB().then((value){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=> historyTest("LICENCE L3 S2")
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
