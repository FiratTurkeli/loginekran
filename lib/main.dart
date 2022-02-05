
import 'dart:ui';

import 'package:flutter/material.dart';
import 'anasayfa.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,


      home: MyHomePage(title: "GİRİŞ EKRANI"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var tfKullaniciAdi = TextEditingController();
  var tfSifre = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> girisKontrol() async {

    var ka = tfKullaniciAdi.text;
    var sf = tfSifre.text;

    if (ka == "admin" && sf == "123") {

      var sp = await SharedPreferences.getInstance();

      sp.setString("Kullanıcı Adı", ka);
      sp.setString("Sifre", sf);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AnaSayfa()));

    }else{
      scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text("Hatalı Giriş")));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Center(child: Text("GİRİŞ EKRANI")),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("HOŞGELDİNİZ", textAlign: TextAlign.center, style: TextStyle(color: Colors.purple, fontSize: 30 , fontStyle: FontStyle.italic, fontFamily: "Yellowtail", fontWeight: FontWeight.bold),),
                )),
            SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 8.0),
                child: TextField(
                  cursorColor: Colors.red,
                  controller: tfKullaniciAdi,
                  decoration: InputDecoration(
                      hintText: "Kullanıcı Adı",
                      fillColor: Colors.orangeAccent,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orangeAccent,
                        ),
                        borderRadius: BorderRadius.circular(20),

                      )
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              child: Padding(
                padding: EdgeInsets.only(left: 18.0, right: 18.0, bottom: 8.0),
                child: TextField(
                  cursorColor: Colors.red,

                  controller: tfSifre,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Sifreyi Giriniz",
                      fillColor: Colors.orangeAccent,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepOrangeAccent
                        ),
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),
              ),
            ),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                ),
                onPressed: (){
                  girisKontrol();

                }, child: Text("GİRİŞ YAP", textAlign: TextAlign.center, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),))

          ],
        ),
      ),

    );
  }
}


