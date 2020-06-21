import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:furniture_project/productsPage.dart';

import 'config/config.dart';

class ProductsCategoryPage extends StatefulWidget {
  final String category;
  ProductsCategoryPage({this.category});

  @override
  _ProductsCategoryPageState createState() => _ProductsCategoryPageState();
}

class _ProductsCategoryPageState extends State<ProductsCategoryPage> {
  Firestore _db = Firestore.instance;
  List<DocumentSnapshot> productcategories = [];
  bool _loading = true;
  _getProductCategories() async {
    Query q = _db
        .collection("SubCategories")
        .where("tag", isEqualTo: widget.category);
    setState(() {
      _loading = true;
    });
    QuerySnapshot querySnapshot = await q.getDocuments();
    productcategories = querySnapshot.documents;
    setState(() {
      _loading = false;
    });
    print(widget.category);
  }

  @override
  void initState() {
    _getProductCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Text(
            widget.category,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _loading == true
                      ? Container(
                          child: Text("Loading"),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: productcategories.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                height: 160,
                                child: InkWell(
                                  onTap: (){
                                    String subCatName = productcategories[index]
                                                        .data["Product"];
                                     Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProductsPage(

                                      category: widget.category,
                                      subCategory: subCatName,
                                      )
                                      ));
                           
                                  },
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: <Widget>[
                                      Container(
                                        height: 136,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(22),
                                            boxShadow: [kDefaultShadow]),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(22),
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
                                              child: Image.network(
                                                productcategories[index]
                                                    .data["image"],
                                                fit: BoxFit.cover,
                                                height: 130.0,
                                              ),
                                            )),
                                      ),
                                      Positioned(
                                        left: 0,
                                        bottom: 0,
                                        child: SizedBox(
                                            height: 136,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
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
                                                    productcategories[index]
                                                        .data["Product"],
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black54),
                                                  ),
                                                ),
                                                Spacer(),
                                                // Container(
                                                //   padding: EdgeInsets.symmetric(
                                                //     horizontal: 20 * 1.5, // 30 padding
                                                //     vertical: 20 / 4, // 5 top and bottom
                                                //   ),
                                                //   decoration: BoxDecoration(
                                                //     color: Colors.blue,
                                                //     borderRadius: BorderRadius.only(
                                                //       bottomLeft: Radius.circular(22),
                                                //       topRight: Radius.circular(22),
                                                //     ),
                                                //   ),
                                                //   child:  Text(
                                                //     productcategories[index].data["ProductCode"],
                                                //     style: TextStyle(fontSize: 13),
                                                //   ),
                                                // ),
                                              ],
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
