import 'package:assignment_submitted_by_sachinmall/const.dart';
import 'package:assignment_submitted_by_sachinmall/screen/check_out.dart';
import 'package:assignment_submitted_by_sachinmall/screen/widgets/bike_details_add_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BikeDetails extends StatefulWidget {
  const BikeDetails({Key? key}) : super(key: key);

  @override
  State<BikeDetails> createState() => _BikeDetailsState();
}

class _BikeDetailsState extends State<BikeDetails> {
  final selectedItem = Get.arguments as Map<String, dynamic>;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        elevation: 0,
        leading: Transform.scale(
          scale: 0.7,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  const Color(0xFFC4C4C4).withOpacity(0.71),
                  const Color(0xFFC4C4C4).withOpacity(0.0),
                ],
              ),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.keyboard_backspace_rounded,
                color: kblack,
                size: 40,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
        title: Container(
          margin: const EdgeInsets.only(right: 10, top: 10),
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              "Bike Details",
              style: GoogleFonts.roboto(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: kblack,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            height20,
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectedItem["model"].toString(),
                          style: GoogleFonts.robotoSlab(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: kblack,
                          ),
                        ),
                        Text(
                          selectedItem["name"].toString(),
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: kblack,
                          ),
                        ),
                        height25,
                        DetailPage(
                          label: "Category",
                          value: selectedItem["category"].toString(),
                        ),
                        height25,
                        DetailPage(
                          label: "Displacement",
                          value: selectedItem["displacement"],
                        ),
                        height25,
                        DetailPage(
                          label: "Max. Speed",
                          value: selectedItem["speed"],
                        ),
                      ],
                    ),
                  ),
                  kwidth10,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 16),
                              height: Get.height / 3,
                              width: Get.width / 2.5,
                              decoration: BoxDecoration(
                                color: const Color(0x66B9B9B9),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Image.asset(
                                  selectedItem["imagedetail"],
                                  fit: BoxFit.fitWidth,
                                  width: 240,
                                ),
                              ),
                            ),
                          ],
                        ),
                        height10,
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const CheckOut(),
                                transition: Transition.leftToRight);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 24),
                            width: Get.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: kblack,
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Rent",
                                  style: GoogleFonts.roboto(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: kwhite,
                                  ),
                                ),
                                height3,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      selectedItem["rent"],
                                      style: GoogleFonts.risque(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: kwhite,
                                      ),
                                    ),
                                    Text(
                                      " per day",
                                      style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: kwhite,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            height30,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Add",
                    style: GoogleFonts.roboto(
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      color: kblack,
                    ),
                  ),
                  kwidth5,
                  Text(
                    "items",
                    style: GoogleFonts.roboto(
                      fontSize: 21,
                      fontWeight: FontWeight.w300,
                      color: kblack,
                    ),
                  ),
                ],
              ),
            ),
            height10,
            const AddItemsDetail(),
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

class DetailPage extends StatelessWidget {
  final String label;
  final String value;

  const DetailPage({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFBABABA), width: 1.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF8C7E7E),
            ),
          ),
          height3,
          Text(
            value,
            style: GoogleFonts.roboto(
                fontSize: 18, fontWeight: FontWeight.w500, color: kblack),
          )
        ],
      ),
    );
  }
}
