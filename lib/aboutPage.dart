import 'package:flutter/material.dart';


class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
      child: Column(

        children: <Widget>[
         Text("About"),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(20, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 200,
                  child: InkWell(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Container(
                           height: 136,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                        Center(
                          child: Container(
                            height: 160,
                            width: 160,
                            child: Image.asset(
                              "assets/11.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: SizedBox(
                              height: 136,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20 * 1.5, // 30 padding
                                      vertical: 20 / 4, // 5 top and bottom
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(22),
                                        topRight: Radius.circular(22),
                                      ),
                                    ),
                                    child: Text(
                                      "2344",
                                    ),
                                  ),
                                  
                                ],
                              )),
                        ),
                        
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
