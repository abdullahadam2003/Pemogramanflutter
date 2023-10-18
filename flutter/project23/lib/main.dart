import 'package:flutter/material.dart';
import './pages/gallery_page.dart';
import './pages/photo_page.dart';
import './pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.nameRoute,
      routes: {
        HomePage.nameRoute: (context) => HomePage(),
        GalleryPage.nameRoute: (cotext) => GalleryPage(),
        photoPage.nameRoute: (context) => photoPage(),
      },
    );
  }
}
