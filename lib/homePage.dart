import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:furniture_project/config/config.dart';
import 'package:furniture_project/productsCategoryPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Firestore _db = Firestore.instance;
  //List<DocumentSnapshot> categories = [];
  // bool _loading = true;
  // _getCategories() async {
  //   Query q = _db.collection("Categories");
  // setState(() {
  //     _loading = true;
  //   });
  //   QuerySnapshot querySnapshot = await q.getDocuments();
  //   categories = querySnapshot.documents;
  //   print(categories.length);
  // setState(() {
  //     _loading = false;
  //   });
  // }

  @override
  void initState() {
    // _getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              child: SizedBox(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: Carousel(
                  // defaultImage: snapshot.data.documents.map((e) {
                  //   return Image.network(e.data["image"] );
                  // }),
                  images: [
                    CachedNetworkImage(
                      imageUrl: "http://marc-m.in/assets/images/caro.jpg",
                      fit: BoxFit.fitWidth,
                    ),
                    CachedNetworkImage(
                      imageUrl: "http://marc-m.in/assets/images/caro2.jpg",
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                  dotSize: 4.0,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(milliseconds: 1000),
                  autoplay: true,
                  autoplayDuration: Duration(milliseconds: 7500),
                  dotSpacing: 15.0,
                  dotIncreasedColor: primaryColor,
                  dotColor: Colors.white,
                  indicatorBgPadding: 5.0,
                  dotBgColor: Colors.transparent,
                  borderRadius: true,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height + 220,
              child: StreamBuilder(
                stream: _db.collection("Categories").snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: snapshot.data.documents.map((e) {
                        return Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            height: 160,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProductsCategoryPage(
                                        category: e.data["title"])));
                              },
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
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        height: 160,
                                        width: 200,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: CachedNetworkImage(
                                            imageUrl: e.data["image"],
                                            placeholder: (context, url) =>
                                                Container(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                            fit: BoxFit.fitHeight,
                                          ),
                                        )),
                                  ),
                                  Positioned(
                                    left: 0,
                                    bottom: 0,
                                    child: SizedBox(
                                        height: 136,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                200,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(20),
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 25, 0, 0),
                                              child: Text(
                                                e.data["title"],
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black54),
                                              ),
                                            ),
                                            Spacer(),
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }
                  return Container(
                    child: Text("Loading"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
