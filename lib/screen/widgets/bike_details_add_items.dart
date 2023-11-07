import 'package:assignment_submitted_by_sachinmall/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddItemsDetail extends StatefulWidget {
  const AddItemsDetail({Key? key}) : super(key: key);

  @override
  State<AddItemsDetail> createState() => _AddItemsDetailState();
}

class _AddItemsDetailState extends State<AddItemsDetail> {
  List<Map<String, dynamic>> recentlyviewditems = [
    {
      "imageUrl": "assets/images/jacket.png",
      "name": "Riding Jacket",
      "rent": "800/",
      "availability": "1"
    },
    {
      "imageUrl": "assets/images/gloves.png",
      "name": "Riding Gloves",
      "rent": "800/",
      "availability": "Add"
    },
    {
      "imageUrl": "assets/images/helmet.png",
      "name": "Helmet",
      "rent": "800/",
      "availability": "1"
    },
    {
      "imageUrl": "assets/images/shoes.png",
      "name": "Riding Shoes",
      "rent": "800/",
      "availability": "Add"
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: recentlyviewditems.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final availability = recentlyviewditems[index]["availability"];
        final isQuantity = availability == "1";

        final containerColor =
            isQuantity ? kblack : const Color.fromARGB(255, 208, 212, 208);
        final textColor = isQuantity ? kwhite : kblack;

        return GestureDetector(
          onTap: () {
            setState(() {
              if (recentlyviewditems[index]["availability"] == "Add") {
                recentlyviewditems[index]["availability"] = "1";
              } else {
                recentlyviewditems[index]["availability"] = "Add";
              }
            });
          },
          child: Container(
            margin: const EdgeInsets.all(5),
            width: screenwidth,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFBABABA),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(22),
            ),
            child: ListTile(
              leading: Image.asset(
                recentlyviewditems[index]["imageUrl"]!,
                fit: BoxFit.cover,
                width: 60,
                height: 60,
              ),
              title: Text(
                recentlyviewditems[index]["name"].toString(),
                style: GoogleFonts.roboto(
                    fontSize: 18, fontWeight: FontWeight.w700, color: kblack),
              ),
              subtitle: Row(
                children: [
                  Text(
                    recentlyviewditems[index]["rent"]!,
                    style: GoogleFonts.risque(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: kblack),
                  ),
                  Text(
                    "per day",
                    style: GoogleFonts.roboto(
                      color: kblack,
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              trailing: Container(
                height: 30,
                width: 90,
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    recentlyviewditems[index]["availability"].toString(),
                    style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: textColor),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
