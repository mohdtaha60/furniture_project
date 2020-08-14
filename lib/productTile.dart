import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:furniture_project/fullscreen.dart';

import 'config/config.dart';

class ProductTile extends StatelessWidget {
  @required
  final String image, title, code;

  const ProductTile({
    this.image,
    this.title,
    this.code,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 160,
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FullImage(
                  image: image,
                  code: code,
                  title: title,
                ))),
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
              child: Hero(
                tag: image,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 160,
                  width: 200,
                  child: CachedNetworkImage(
                    imageUrl: image,
                    placeholder: (context, url) => SizedBox(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
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
                      Hero(
                        tag: title,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Material(
                            color: Colors.white,
                            child: Text(
                              title,
                              maxLines: 4,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Hero(
                        tag: code,
                        child: Material(
                          child: Container(
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
                              code,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
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
