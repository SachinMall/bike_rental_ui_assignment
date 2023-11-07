import 'package:assignment_submitted_by_sachinmall/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({super.key});

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  int selectedBikeTypeIndex = 1;
  List<String> biketype = [
    "Adventure",
    "Cruiser",
    "SportsBike",
    "Tourer",
    "DirtBike",
    "Streetfighter"
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: biketype.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          bool isSelected = selectedBikeTypeIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedBikeTypeIndex = index;
              });
            },
            child: Container(
              height: 50,
              width: 110,
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: isSelected ? kblack : kwhite,
                  border: Border.all(
                    color: const Color(0xFFBABABA),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(22)),
              child: Center(
                child: Text(
                  biketype[index].toString(),
                  style: GoogleFonts.roboto(
                      color: isSelected ? kwhite : kblack,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
