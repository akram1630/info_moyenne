import 'package:flutter/material.dart';


import '../data.dart';
import '../histotyTest.dart';
import '../homePage.dart';
// T = TP  , D = TD , M = Moyenne module
class infoLmd3S1 extends StatefulWidget {
  const infoLmd3S1({Key? key}) : super(key: key);

  @override
  State<infoLmd3S1> createState() => _infoLmd3S1();
}

class _infoLmd3S1 extends State<infoLmd3S1> {

  @override
  void initState() {  //=== initialeState == first setState
    // TODO: implement initState
    super.initState();
    dat.createDB(); // run when execute
  }
  data dat = data();

  TextEditingController tpSE2 = TextEditingController(); //2it's a class // tpalgo.text // attribue .text
  TextEditingController tdSE2 = TextEditingController();
  TextEditingController examenSE2 = TextEditingController();
  double ? Tse2=0 , Mse2=0 , Ese2=0 ,Dse2=0 ;

  TextEditingController tpCOMP = TextEditingController(); //2it's a class // tpalgo.text // attribue .text
  TextEditingController tdCOMP = TextEditingController();
  TextEditingController examenCOMP = TextEditingController();
  double ? Tcomp=0 , Mcomp=0 , Ecomp=0 ,Dcomp=0 ;

  TextEditingController tpGL = TextEditingController(); //2it's a class // tpalgo.text // attribue .text
  TextEditingController tdGL = TextEditingController();
  TextEditingController examenGL = TextEditingController();
  double ? Tgl=0 , Mgl=0 , Egl=0 ,Dgl=0 ;


  TextEditingController tdIHM = TextEditingController();
  TextEditingController tpIHM = TextEditingController();
  TextEditingController examenIHM = TextEditingController();
  double ? Mihm=0 , Eihm=0 ,Dihm=0 , Tihm ;

  TextEditingController tpPROSTA = TextEditingController();
  TextEditingController examenPROSTA = TextEditingController();
  double ? Mprosta=0 , Eprosta=0 ,Tprosta=0 ;

  TextEditingController tdPL = TextEditingController();
  TextEditingController examenPL = TextEditingController();
  double ? Mpl=0 , Epl=0 , Dpl=0  ;


  TextEditingController examenECO = TextEditingController();
  TextEditingController tdECO = TextEditingController();
  double ? Meco=0 , Deco = 0 , Eeco;


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
        if (Dse2 == null) Dse2 = 0;
        Ese2 = double.tryParse(examenSE2.text);
        if (Ese2 == null) Ese2 = 0;
        Mse2 = Tse2! * 0.2 + Dse2! * 0.2 + Ese2! * 0.6;
        /////////////////////////////////////
        Tcomp = double.tryParse(tpCOMP.text);
        if (Tcomp == null) Tcomp = 0; // cauze null + value == Error
        Dcomp = double.tryParse(tdCOMP.text);
        if (Dcomp == null) Dcomp = 0;
        Ecomp = double.tryParse(examenCOMP.text);
        if (Ecomp == null) Ecomp = 0;
        Mcomp = Tcomp! * 0.2 + Dcomp! * 0.2 + Ecomp! * 0.6;
        /////////////////////////////////////
        Tgl = double.tryParse(tpGL.text);
        if (Tgl == null) Tgl = 0; // cauze null + value == Error
        Dgl = double.tryParse(tdGL.text);
        if (Dgl == null) Dgl = 0;
        Egl = double.tryParse(examenGL.text);
        if (Egl == null) Egl = 0;
        Mgl = Tgl! * 0.2 + Dgl! * 0.2 + Egl! * 0.6;
        /////////////////////////////////////////////////
        Tprosta = double.tryParse(tpPROSTA.text);
        if (Tprosta == null) Tprosta = 0;
        Eprosta = double.tryParse(examenPROSTA.text);
        if (Eprosta == null) Eprosta = 0;
        Mprosta = Tprosta! * 0.4 + Eprosta! * 0.6;
        /**********************************************/
        Dpl = double.tryParse(tdPL.text);
        if (Dpl == null) Dpl = 0;
        Epl = double.tryParse(examenPL.text);
        if (Epl == null) Epl = 0;
        Mpl = Dpl! * 0.4 + Epl! * 0.6;
        /**********************************************/
        Dihm = double.tryParse(tdIHM.text);
        if (Dihm == null) Dihm = 0;
        Tihm = double.tryParse(tpIHM.text);
        if (Tihm == null) Tihm = 0;
        Eihm = double.tryParse(examenIHM.text);
        if (Eihm == null) Eihm = 0;
        Mihm = Dihm! * 0.2 + Tihm!*0.2 + Eihm! * 0.6;
        /**********************************************/
        Eeco = double.tryParse(examenECO.text);
        if (Eeco == null) Eeco = 0;
        Deco = double.tryParse(tdECO.text);
        if (Deco == null) Deco = 0;
        Meco = 0.4 * Deco! + 0.6 * Eeco! ;
        /**********************************************/
        result = ( Mse2!*3 + Mcomp! * 3 + Mgl!*3 +  Mprosta!*2
            + Mihm!*3 + Meco!  + Mpl! *2 ) / 17 ;
      });
    }
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
                                          annee: 'infoLmd3S1',
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
            child: Text(' LICENCE L3 S1 ')
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
                          dat.module3("SYSTEME D'EXPLOITATION 2", tpSE2, tdSE2, examenSE2 , Mse2! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value);
                              }),
                          SizedBox(height: 20,),
                          dat.module3('COMPILATION', tpCOMP, tdCOMP, examenCOMP , Mcomp! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value);
                              }),
                          SizedBox(height: 20,),
                            dat.module3("GÉNIE LOGICIEL", tpGL, tdGL, examenGL , Mgl! ,
                                  (value){    calculate();    } , validator: (String ?value){
                                return dat.valid(value) ;
                              }),
                          SizedBox(height: 20,),
                          dat.module3('INTERFACE HOMME-MACHINE', tpIHM,  tdIHM, examenIHM , Mihm!
                              , (value){ calculate();  }  , validator: (String ?value) {
                                return dat.valid(value);
                              }),
                          SizedBox(height: 20,),
                          dat.module2("PROGRAMMATION LINEAIRE", tdPL, examenPL, Mpl!,
                                  (value){ calculate();} , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module2('PROBABILITÉS ET STATISTIQUE', tpPROSTA, examenPROSTA , Mprosta! ,
                                  (value){ calculate(); }  , validator: (String ?value) {
                                return dat.valid(value);
                              }, tdOrTp: 'TD'),
                          SizedBox(height: 20,),
                          dat.module2('ECONOMIE NUMERIQUE ET VEILLE STRATEGIQUE',tdECO, examenECO , Meco! ,
                                  (value){ calculate();  }  , validator: (String ?value) {
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
                            data.listIndex = 4;
                            dat.getfromDB().then((value){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=> historyTest("LICENCE L3 S1")
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
