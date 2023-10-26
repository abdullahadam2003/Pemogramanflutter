import 'package:flutter/material.dart';
import 'package:project24/pages/page_satu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 150,
              color: Colors.red,
              alignment: Alignment.bottomLeft,
              child: Text(
                "Menu pilihan",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => PageSatu()),
                );
              },
              leading: Icon(
                Icons.home,
                size: 35,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) =>
                          SettingPage()), // Pastikan SettingPage sudah diimpor dengan benar
                );
              },
              leading: Icon(
                Icons.settings,
                size: 35,
              ),
              title: Text(
                "Settings",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          "Some Text Here!",
          style: TextStyle(
            fontSize: 35,
          ),
        ),
      ),
    );
  }
}

class SettingPage extends StatelessWidget {
  // Tambahkan definisi SettingPage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting Page"),
      ),
      body: Center(
        child: Text(
          "Ini adalah halaman Pengaturan",
          style: TextStyle(
            fontSize: 35,
          ),
        ),
      ),
    );
  }
}
