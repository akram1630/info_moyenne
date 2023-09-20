import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
class data{


  static List<Map> ? historyMoyenneL1MIS1 = [] ; // [] required to give a value when lenght
  static List<Map> ? historyMoyenneL1MIS2 = [] ;
  static List<Map> ? historyMoyenneL2MIS1 = [] ;
  static List<Map> ? historyMoyenneL2MIS2 = [] ;
  static List<Map> ? historyMoyenneL3MIS1 = [] ;
  static List<Map> ? historyMoyenneL3MIS2 = [] ;
  static List<Map> ? historyMoyenneIng1S1 = [] ;
  static List<Map> ? historyMoyenneIng1S2 = [] ;
  static List<Map> ? historyMoyenneIng2S1 = [] ;
  static List<Map> ? historyMoyenneIng2S2 = [] ;

  Database ? database;
  static int listIndex=0;
  void navigateTo(context , widget)=>
      Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => widget,
          )
      );


  ///////////////////////////////////////////////////////////////////////////////////////
  void createDB() async {
    database = await openDatabase(
        'moyenne.db' ,
        version: 1 ,
        onCreate: (databaseee , version){
          print('DB is created');
          databaseee.execute(
              'create table historyMoyenne( id INTEGER primary key ,date TEXT , moyenne TEXT , annee TEXT  )'
          ).then((value){
            print('Table historyMoyenne is created');
          }).catchError((error){
            print('error while creating Table historyMoyenne  : ${error.toString()}');
          });
        },
        onOpen: (databaseee){
          print('Database is opened');
        }
    );
  }
  Future deleteData({required int id,})async{
    database = await openDatabase(
        'moyenne.db', // if this DB exists : goes immidiately to onOpen else :OnCreate && OnOpen
        //version: 1 , // we increase when we change the structure of DB
        onOpen: (database) {}
    );
    await database!.rawDelete('delete from historyMoyenne where id = ?',[id]);
  }
  Future getfromDB  () async {
    historyMoyenneL1MIS1=[];
    historyMoyenneL1MIS2=[];
    historyMoyenneL2MIS1=[];
    historyMoyenneL2MIS2=[];
    historyMoyenneL3MIS1=[];
    historyMoyenneL3MIS2=[];
    historyMoyenneIng1S1=[];
    historyMoyenneIng1S2=[];
    historyMoyenneIng2S1=[];
    historyMoyenneIng2S2=[];
    database = await openDatabase(
        'moyenne.db', // if this DB exists : goes immidiately to onOpen else :OnCreate && OnOpen
        //version: 1 , // we increase when we change the structure of DB
        onOpen: (database) {}
    );
    await database!.rawQuery('select * from historyMoyenne').then((value) {
      value.forEach((element) {
        if(element['annee'] == 'infoLmd1S1')
          historyMoyenneL1MIS1!.add(element);
        if(element['annee'] == 'infoLmd1S2')
          historyMoyenneL1MIS2!.add(element);
        if(element['annee'] == 'infoLmd2S1')
          historyMoyenneL2MIS1!.add(element);
        if(element['annee'] == 'infoLmd2S2')
          historyMoyenneL2MIS2!.add(element);
        if(element['annee'] == 'infoLmd3S1')
          historyMoyenneL3MIS1!.add(element);
        if(element['annee'] == 'infoLmd3S2')
          historyMoyenneL3MIS2!.add(element);
        if(element['annee'] == 'infoIng1S1')
          historyMoyenneIng1S1!.add(element);
        if(element['annee'] == 'infoIng1S2')
          historyMoyenneIng1S2!.add(element);
        if(element['annee'] == 'infoIng2S1')
          historyMoyenneIng2S1!.add(element);
        if(element['annee'] == 'infoIng2S2')
          historyMoyenneIng2S2!.add(element);
      });
    });
  }
  Future insertDB({required String moyenne , required String date , required String annee,})async {
    database = await openDatabase(
        'moyenne.db', // if this DB exists : goes immidiately to onOpen else :OnCreate && OnOpen
        //version: 1 , // we increase when we change the structure of DB
        onOpen: (database) {}
    );
    // database shouldn't be null even when we use ! ? operator
    await database!.transaction((txn)async{
      await txn.rawInsert(
          'insert into historyMoyenne (moyenne , date , annee) values("$moyenne","$date","$annee")'
      ).then((value){
        print('$value inserted seccessfully');
        //setState(() {});
      }).catchError((error){
        print("error when inserting new record : ${error.toString()}");
      });
    });
  }

  Widget item({required String moy , required String date ,required int id ,
    required void Function()? onPressed })
  => Container(
    height: 40,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadiusDirectional.circular(10)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              SizedBox(width: 10,),
              Text("moyenne : "),
              Container(
                padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadiusDirectional.circular(10)
                  ),
                  child: Text(moy)
              ),
              SizedBox(width: 5,),
              Text('date: $date'),
              SizedBox(width: 5,),
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red[400],
                    borderRadius: BorderRadiusDirectional.circular(10)
                ),
                width: 40,
                child: IconButton(
                icon: Icon(Icons.delete),
                  onPressed: onPressed ,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 10,)
      ],
    ),
  );




  Container markInput(
      String choice ,
      TextEditingController controller,
      void Function(String)? onChanged,
      {String? Function(String?)? validator}
      ) => Container(
    height: 40,
    width: double.infinity,
    child: TextFormField(
      onChanged: onChanged,
      validator: validator ,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      controller: controller,
      decoration: InputDecoration(
          labelText: '$choice',
          border: OutlineInputBorder()
      ),
    ),
  );






  Container module3(
      @required String name ,
      TextEditingController tp,
      TextEditingController td,
      TextEditingController exam ,
      double mark ,
      void Function(String)? onChanged,
      {String? Function(String?)? validator}
      ){
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20)
      ) ,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(child: markInput('TD', tp , onChanged , validator: validator)),
                SizedBox(width: 20,),
                Expanded(child: markInput('TP', td , onChanged , validator: validator)),
                SizedBox(width: 20,),
                Expanded(child:markInput('EXAM', exam , onChanged , validator: validator)),
              ],
            ),
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)
                  ) ,
                  child: Text(name ,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('TOTAL : ',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize:14),),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text('${mark.toStringAsFixed(2)}' ,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle (
                              fontSize: 20,
                              color: Colors.black
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ) ,
            ],
          )
        ],
      ),
    );
  }



  Container module2(
      @required String name ,
      TextEditingController td,
      TextEditingController exam ,
      double mark ,
      void Function(String)? onChanged,
      {String? Function(String?)? validator ,
      required String tdOrTp
      }
      ){
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20)
      ) ,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(child: markInput(tdOrTp, td , onChanged , validator: validator)),
                SizedBox(width: 20,),
                Expanded(child:markInput('EXAM', exam , onChanged , validator: validator)),
              ],
            ),
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)
                  ) ,
                  child: Text(name ,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('TOTAL : ',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize:14),),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text('${mark.toStringAsFixed(2)}' ,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle (
                              fontSize: 20,
                              color: Colors.black
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ) ,
            ],
          )
        ],
      ),
    );
  }




  Container module1(
      @required String name ,
      TextEditingController exam ,
      double mark ,
      void Function(String)? onChanged,
      {String? Function(String?)? validator}
      ){
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20)
      ) ,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(child:markInput('EXAM', exam , onChanged , validator: validator)),
              ],
            ),
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)
                  ) ,
                  child: Text(name ,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('TOTAL : ',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize:14),),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text('${mark.toStringAsFixed(2)}' ,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle (
                              fontSize: 20,
                              color: Colors.black
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ) ,
            ],
          )
        ],
      ),
    );
  }






  String ? valid(String ? val){
    if(val!.isEmpty)
      return 'empty';
    double ? note = double.tryParse(val);
    if(note! < 0)
      return '<0';
    if(note > 20)
      return '>20';
    return null;
  }
}
