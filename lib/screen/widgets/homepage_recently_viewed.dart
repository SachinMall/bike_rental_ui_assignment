import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const.dart';

class RecentlyViewed extends StatefulWidget {
  const RecentlyViewed({super.key});

  @override
  State<RecentlyViewed> createState() => _RecentlyViewedState();
}

class _RecentlyViewedState extends State<RecentlyViewed> {
  List<Map<String, dynamic>> recentlyviewditems = [
    {
      "imageUrl": "assets/images/hayabusa.png",
      "name": "Hayabusa",
      "rent": "2000/",
      "availability": "Available"
    },
    {
      "imageUrl": "assets/images/classic350.png",
      "name": "Classic 350",
      "rent": "1500/",
      "availability": "Booked"
    },
    {
      "imageUrl": "assets/images/ninjazx.png",
      "name": "Ninja ZX 10r",
      "rent": "3000/",
      "availability": "Available"
    },
  ];
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return ListView.builder(
      itemCount: recentlyviewditems.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final availability = recentlyviewditems[index]["availability"];
        final isBooked = availability == "Booked";

        final containerColor =
            isBooked ? const Color.fromARGB(255, 208, 212, 208) : kblack;
        final textColor = isBooked ? kblack : kwhite;
        return Container(
          margin: const EdgeInsets.all(8),
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
            contentPadding: EdgeInsets.zero,
            leading: Image.asset(
              recentlyviewditems[index]["imageUrl"]!,
              fit: BoxFit.cover,
              width: 70,
              height: 70,
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
                      fontSize: 18, fontWeight: FontWeight.w400, color: kblack),
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
            trailing: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Container(
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
