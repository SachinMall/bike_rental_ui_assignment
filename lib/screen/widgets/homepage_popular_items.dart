import 'package:assignment_submitted_by_sachinmall/screen/bike_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const.dart';

class PopularItems extends StatefulWidget {
  const PopularItems({super.key});

  @override
  State<PopularItems> createState() => _PopularItemsState();
}

class _PopularItemsState extends State<PopularItems> {
  List<Map<String, dynamic>> bikedetails = [
    {
      "imageUrl": "assets/images/meteor1.png",
      "imagedetail": "assets/images/meteor.png",
      "name": "Meteor",
      "model": "Royal Enfield",
      "category": "Cruiser",
      "displacement": "349 cc",
      "speed": "120 km/h",
      "rent": "699/"
    },
    {
      "imageUrl": "assets/images/indian_scout1.png",
      "imagedetail": "assets/images/scoutbobber1.png",
      "name": "Scout Bobber",
      "category": "Cruiser",
      "displacement": "1133 cc",
      "speed": "124 km/h",
      "model": "Indian",
      "rent": "1499/"
    },
    {
      "imageUrl": "assets/images/rebel.png",
      "imagedetail": "assets/images/rebel11001.png",
      "name": "Rebel 1100",
      "model": "Honda",
      "category": "Cruiser",
      "displacement": "1084 cc",
      "speed": "128 km/h",
      "rent": "1899/"
    },
    {
      "imageUrl": "assets/images/cl.png",
      "imagedetail": "assets/images/classic350.png",
      "name": "Classic 350",
      "model": "Royal Enfield",
      "category": "Cruiser",
      "displacement": "349 cc",
      "speed": "140 km/h",
      "rent": "2199/"
    },
  ];

  void _onItemTap(int index) {
    final selectedItem = bikedetails[index];
    Get.to(() => const BikeDetails(),
        transition: Transition.rightToLeft, arguments: selectedItem);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        itemCount: bikedetails.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _onItemTap(index),
            child: Container(
              height: 230,
              width: 143,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.only(
                left: 8,
                top: 10,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFBABABA),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(22)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.only(topRight: Radius.circular(16)),
                    child: Image.asset(
                      bikedetails[index]['imageUrl']!,
                      fit: BoxFit.contain,
                    ),
                  ),
                 height5,
                  Text(
                    bikedetails[index]['name'].toString(),
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: kblack),
                  ),
                  Text(bikedetails[index]['model'].toString(),
                      style: GoogleFonts.robotoSlab(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: kblack)),
                  height5,
                  Row(
                    children: [
                      Text(bikedetails[index]['rent']!,
                          style: GoogleFonts.risque(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: kblack)),
                      Text(" per day",
                          style: GoogleFonts.roboto(
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                              color: kblack))
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
