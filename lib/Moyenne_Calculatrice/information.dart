import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
class information extends StatelessWidget {

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        titleSpacing: 20,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [

              Container(
                padding: EdgeInsets.all(0.5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Icon(
                  Icons.code,
                  color: Colors.red,
                ),
              ),
              SizedBox(width: 3.4,),
              Text(
                'INFO MOYENNE',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
              SizedBox(width: 3.4,),
              Container(
                padding: EdgeInsets.all(0.5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Icon(
                  Icons.computer ,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView( // EXPANDED + SINGLECHILDVIEW can't meet
        child: Column(
          children: [
            SizedBox(height: 200,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('لتحميل المصدر المعتمد في حساب مقاييس ليسانس',style: TextStyle(
                        fontWeight: FontWeight.bold , fontSize: 16
                    )),
                    TextButton(
                        child: Text('اضغط هنا',style: TextStyle(
                            fontWeight: FontWeight.bold ,  fontSize: 16
                        )),
                        onPressed:()=> _launchURL('https://www.univ-usto.dz/faculte/fac-mathinfo/wp-content/uploads/2021/10/CANEVAS_SI_FINAL.pdf'),
                    ),
                  ],
                ),
                SizedBox(height: 100,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('لتحميل المصدر المعتمد في حساب مقاييس مهندس',style: TextStyle(
                        fontWeight: FontWeight.bold , fontSize: 16
                    )),
                    TextButton(
                      onPressed:()=> _launchURL('https://finfo.usthb.dz/wp-content/uploads/2023/01/Arrete-MI-n%C2%B0060-du-15-janvier-2023-modifiant-larrete-n%C2%B01399-du-22-octobre-2022.pdf'),
                      child: Text('اضغط هنا',style: TextStyle(
                          fontWeight: FontWeight.bold , fontSize: 16
                      )),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 220,),
            Container(
              decoration: BoxDecoration(
              color: Colors.teal,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                )
              ),
              height: 75,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Contact Developer :',style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                  TextButton(
                    child: Text('HERE',
                      style: TextStyle(color: Colors.purple[800],
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: (){
                      Uri emailUri = Uri(
                          scheme: 'mailto' ,
                          path: 'boutoutaou.akram@univ-ouargla.dz'
                      );
                      launchUrl(emailUri);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
