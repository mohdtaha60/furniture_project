import 'package:flutter/material.dart';

import 'config/config.dart';
class ProductTile extends StatelessWidget {
  const ProductTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 160,
      child: InkWell(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              height: 136,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [kDefaultShadow]),
              width: MediaQuery.of(context).size.width,
              child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 160,
                width: 200,
                child: 
                Image.asset(
                  "assets/Item_1.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: SizedBox(
                  height: 136,
                  width: MediaQuery.of(context).size.width - 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Chair",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Spacer(),
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
  }
}
