import 'package:flutter/material.dart';
import 'package:furniture_project/productTile.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: SafeArea(
            child: Column(
          children: <Widget>[
            Text(
              "Form",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            ProductTile(),
            ProductTile(),
            ProductTile(),
            ProductTile(),
            ProductTile(),
            ProductTile(),
            ProductTile(),
            ProductTile(),
            ProductTile(),
            ProductTile(),

          ],
        )),
      ),
    );
  }
}
