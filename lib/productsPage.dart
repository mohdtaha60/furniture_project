import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:furniture_project/productTile.dart';

class ProductsPage extends StatefulWidget {
  final String category;
  final String subCategory;

  ProductsPage({this.category, this.subCategory, Key key});

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  Firestore _db = Firestore.instance;
  List<DocumentSnapshot> products = [];
  bool _loading = true;
  _getCategories() async {
    Query q = _db
        .collection("Furniture")
        .where("Category", isEqualTo: widget.category)
        .where("SubCategory", isEqualTo: widget.subCategory);
    setState(() {
      _loading = true;
    });
    QuerySnapshot querySnapshot = await q.getDocuments();
    products = querySnapshot.documents;
    print(widget.category);
    print(widget.subCategory);
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _getCategories();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            title: Text(
              widget.category + " -> " + widget.subCategory,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.black,
          ),
        ),
        body: _loading == true
            ? Center(child: CircularProgressIndicator())
            : ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: products.map((e) {
                  return ProductTile(
                    image: e.data["url"],
                    title: e.data["ProductName"],
                    code: e.data["ProductCode"],
                  );
                }).toList())
        // Container(
        //     child: GridView.builder(
        //         gridDelegate:
        //             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        //         itemCount: products.length,
        //         itemBuilder: (BuildContext context, int index) {
        //           return Container(
        //             margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        //             height: 200,
        //             child: InkWell(
        //               child: Stack(
        //                 alignment: Alignment.bottomCenter,
        //                 children: <Widget>[
        //                   Container(
        //                     height: 136,
        //                     decoration: BoxDecoration(
        //                       color: Colors.white,
        //                       borderRadius: BorderRadius.circular(22),
        //                     ),
        //                   ),
        //                   Center(
        //                     child: Container(
        //                       height: 160,
        //                       width: 160,
        //                       child: Image.network(
        //                         products[index].data["url"],
        //                         fit: BoxFit.cover,
        //                       ),
        //                     ),
        //                   ),
        //                   Positioned(
        //                     left: 0,
        //                     bottom: 0,
        //                     child: SizedBox(
        //                         height: 136,
        //                         child: Column(
        //                           mainAxisAlignment: MainAxisAlignment.end,
        //                           children: <Widget>[
        //                             Container(
        //                               padding: EdgeInsets.symmetric(
        //                                 horizontal: 20 * 1.5, // 30 padding
        //                                 vertical: 20 / 4, // 5 top and bottom
        //                               ),
        //                               decoration: BoxDecoration(
        //                                 color: Colors.blue,
        //                                 borderRadius: BorderRadius.only(
        //                                   bottomLeft: Radius.circular(22),
        //                                   topRight: Radius.circular(22),
        //                                 ),
        //                               ),
        //                               child: Text(
        //                                   products[index].data["ProductName"]),
        //                             ),
        //                           ],
        //                         )),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           );
        //         })),
        );
  }
}
// products[index].data["ProductName"]
