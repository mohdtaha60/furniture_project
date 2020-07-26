import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FullImage extends StatelessWidget {
  final String image, title, code;
  const FullImage({this.image, this.title, this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Hero(
                  tag: image,
                  child: Container(
                    child: CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Hero(
                  tag: title,
                  child: Material(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        title,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Hero(
                  tag: code,
                  child: Material(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        code,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
