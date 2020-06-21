import 'package:flutter/material.dart';
import 'package:furniture_project/aboutPage.dart';
import 'package:furniture_project/config/config.dart';
import 'package:furniture_project/formPage.dart';

import 'homePage.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: primaryColor,
          fontFamily: "productsans"),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _index = 0;

  List<Widget> _child = [
    HomePage(),
    AboutPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Center(
            child: Text(
              "Furniture",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Colors.black,
        ),
      ),
      body: Center(
        child: (_child.elementAt(_index) ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
                title: Text('About'),

          ),

        ],
         currentIndex: _index,
          onTap: (index) {
            setState(() {
              _index = index;
            });
          },

      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: 
          (context)=>    FormPage(),

          ));
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        shape: new BeveledRectangleBorder(
            borderRadius: new BorderRadius.circular(50.0)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
