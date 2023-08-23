import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../Favourites/Favourite.dart';
import 'Offer.dart';

class SHOWOFFER extends StatefulWidget {
  const SHOWOFFER({super.key});

  @override
  State<SHOWOFFER> createState() => _SHOWOFFERState();
}

class _SHOWOFFERState extends State<SHOWOFFER> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            //temporary
            // height: 500,
            margin: EdgeInsets.symmetric(horizontal: width * 0.021),
            padding: EdgeInsets.only(top: height * 0.015),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(width * 0.05),
                  topRight: Radius.circular(width * 0.05),
                )),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(
                        vertical: height * 0.02, horizontal: width * 0.03),
                    child: Text("العروض",
                        style: TextStyle(
                            fontSize: width * 0.07,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(250, 203, 59, 62)))),
                SizedBox(height: height * 0.03),
                OfferWidget()
              ],
            ),
          )
        ],
      ),
    );
  }
}
