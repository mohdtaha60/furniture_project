import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Text(
              //   "About us:",
              //   style: TextStyle(
              //     fontSize: 40,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.black54,
              //   ),
              // ),

              // Center(
              //   child: SizedBox(
              //     height: 100,
              //     width: MediaQuery.of(context).size.width - 100,
              //     child: Image.asset(
              //       "assets/logo.png",
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Card(
                child: ExpansionTile(
                  title: Text(
                    "About us:",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: RichText(
                          text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                            TextSpan(
                                text:
                                    "Marc-M is a leading designer and manufacturer of high-performance solutions for today's constantly evolving workplace\n",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "Founded in 1998 in Hyderabad, the company forged an early reputation for reliable, high-quality Institution furniture & etc. Expanding its offerings while maintaining top-quality design and manufacturing standards, Marc-M (TM) grew steadily through the years.\n" +
                                    "Today, amid growing complexity in Institution environments, Marc-M helps its customers keep things simple. Providing precision-engineered products that emphasize compatibilty, adaptability and integration, Marc-M espouses an approach dedicated to meeting the visual and functional demands of any workplace while minimizing ongoing investment even as business needs change. Marc-M overall portfolio includes an array of innovative, configurable product and service solutions that combine to produce office environments characterized by optimized efficiency and enhanced organization.\n" +
                                    "Marc-M monitors each structural, operational and aesthetic detail to ensure the delivery of products that meet the highest standards while providing maximum versatility.\n" +
                                    "Marc-M's integrated team structure balances the agility and personal focus of a smaller firm with the needs of today's versatile customer. Upholding the company's original philosophy of creating aesthetically appealing, structurally superior, functionally harmonious products, Marc-M continues to provide leading-edge workplace solutions that satisfy customers most pressing needs, transforming today's offices into high-performing work environments\n" +
                                    "We maximize return on your investment. Each of our products is retrofittable and future-proofed, allowing our customers to adapt and evolve without having to worry about spending extra along the way. No matter how needs may change over time, we meet them by building cross-functional compatibility and non-obsolescence into every one of our designs."),
                          ])),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                child: ExpansionTile(
                  title: Text(
                    "Certificates:",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            CachedNetworkImage(
                                imageUrl:
                                    "https://marc-m.in/assets/images/c1.jpeg"),
                            CachedNetworkImage(
                                imageUrl:
                                    "https://marc-m.in/assets/images/c2.jpeg"),
                            CachedNetworkImage(
                                imageUrl:
                                    "https://marc-m.in/assets/images/c3.jpeg"),
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                child: ExpansionTile(
                  initiallyExpanded: true,
                  title: Text(
                    "Contact us:",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 60,
                            child: InkWell(
                              onTap: () => launch("tel://919394007786"),
                              child: Image.asset(
                                "assets/call.png",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            child: InkWell(
                              onTap: () => launchWhatsApp(phone: 919394007786),
                              child: Image.asset(
                                "assets/whatsapp.png",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            child: InkWell(
                              onTap: () async {
                                String lat = "17.381723";
                                String lng = "78.462135";
                                final String googleMapsUrl =
                                    "comgooglemaps://?center=$lat,$lng";
                                final String appleMapsUrl =
                                    "https://maps.apple.com/?q=$lat,$lng";
                                if (await canLaunch(googleMapsUrl)) {
                                  await launch(googleMapsUrl);
                                }
                                if (await canLaunch(appleMapsUrl)) {
                                  await launch(appleMapsUrl,
                                      forceSafariVC: false);
                                } else {
                                  throw "Couldn't launch URL";
                                }
                              },
                              child: Image.asset(
                                "assets/maps.png",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Text(
              //   "Mohammed Mobeen Hussain:",
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.black54,
              //   ),
              // ),

              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: InkWell(
        onTap: () => _launchInBrowser(),
        child: new Container(
          height: 40.0,
          width: double.infinity,
          color: Colors.red[800],
          child: Center(
              child: Text("Developed by:               www.gogodevs.in",
                  style: TextStyle(color: Colors.white))),
        ),
      ),
    );
  }

  void launchWhatsApp({
    @required int phone,
  }) async {
    String url() {
      if (Platform.isIOS) {
        return "whatsapp://wa.me/$phone";
      } else {
        return "whatsapp://send?phone=$phone";
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  Future<void> _launchInBrowser() async {
    String url = 'https://www.gogodevs.in';
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
