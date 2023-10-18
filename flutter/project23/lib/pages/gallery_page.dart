import 'package:flutter/material.dart';
import './photo_page.dart';

class GalleryPage extends StatelessWidget {
  static const nameRoute = '/gallerypage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("galleryPage"),
        // leading: Container(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Gallery PAGE",
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "<<Back",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(photoPage.nameRoute);
                  },
                  child: Text(
                    "Next>>",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
