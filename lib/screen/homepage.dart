import 'package:assignment_submitted_by_sachinmall/const.dart';
import 'package:assignment_submitted_by_sachinmall/screen/widgets/home_categories.dart';
import 'package:assignment_submitted_by_sachinmall/screen/widgets/homepage_popular_items.dart';
import 'package:assignment_submitted_by_sachinmall/screen/widgets/homepage_recently_viewed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/Ellipse.png'),
              radius: 25,
            ),
            kwidth10,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF8C7E7E),
                  ),
                ),
                height5,
                Text(
                  "Abhi Tiwari",
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18),
              child: TextFormField(
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.grey),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 20),
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                        borderSide: BorderSide.none),
                    fillColor: const Color(0xFFEFEEEE),
                    filled: true,
                    prefixIcon: const Icon(
                      CupertinoIcons.search,
                      color: Color(0xFFD2CFCF),
                      size: 28,
                    ),
                    hintText: 'Search Bike',
                    hintStyle: GoogleFonts.roboto(
                      fontSize: 20,
                      color: const Color(0xFFD2CFCF),
                      decoration: TextDecoration.none,
                    ),
                    alignLabelWithHint: true),
              ),
            ),
            const HomeCategories(),
            height10,
            const Viewname(name: "Popular", subname: "items"),
            const PopularItems(),
            height10,
            const Viewname(name: "Recently", subname: "viewed"),
            const RecentlyViewed(),
            height50,
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.map),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_rounded),
            label: "Wallet",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: "Settings",
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 28,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: kblack,
        unselectedLabelStyle: const TextStyle(color: kblack),
        selectedItemColor: kblack,
        selectedLabelStyle: const TextStyle(color: kblack),
      ),
    );
  }
}

class Viewname extends StatelessWidget {
  final String name;
  final String subname;
  const Viewname({super.key, required this.name, required this.subname});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: GoogleFonts.roboto(
              color: kblack,
              fontWeight: FontWeight.w700,
              fontSize: 21,
            ),
          ),
          kwidth5,
          Text(
            subname,
            style: GoogleFonts.roboto(
                color: kblack, fontWeight: FontWeight.w300, fontSize: 21),
          ),
        ],
      ),
    );
  }
}
