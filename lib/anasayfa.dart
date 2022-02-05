import 'package:flutter/material.dart';
import 'package:login_ekrani_sp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

   String? spkullaniciAdi;
   String? spsifre;

  Future<void> oturumBilgisiOku() async {

    var sp = await SharedPreferences.getInstance();

    setState(() {
      spkullaniciAdi = (sp.getString("Kullanıcı Adı") ?? "Kullanıcı adı yok");
      spsifre = (sp.getString("Sifre") ?? "Sifre yok");

    });
  }


  Future<void> cikisYap() async {
    var sp = await SharedPreferences.getInstance();
    
    sp.remove("Kullanıcı Adı");
    sp.remove("Sifre");
    
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(title: "title")));
  }


  @override

  void initState() {
    super.initState();
    oturumBilgisiOku();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("Anasayfa"),
        actions: [
          IconButton(onPressed:(){

          },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          Text("$spkullaniciAdi"),
          Text("$spsifre"),

          ],
        ),
      ),
    );
  }
}

