import 'package:assignment_submitted_by_sachinmall/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  int selectedDays = 0;

  void updateSelectedDays() {
    final difference = selectedEndDate.difference(selectedStartDate).inDays;
    setState(() {
      selectedDays = difference;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
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
              "Check Out",
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
            Container(
              margin: const EdgeInsets.all(22),
              padding: const EdgeInsets.all(16),
              height: 185,
              width: screenwidth,
              decoration: BoxDecoration(
                color: const Color(0xFFBABABA),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                children: [
                  Container(
                    height: 70,
                    width: screenwidth,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5E5E5),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: ListTile(
                      title: Column(
                        children: [
                          Text(
                            "Start Date",
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF8C7E7E)),
                          ),
                        height5,
                          Text(
                              selectedStartDate
                                  .toLocal()
                                  .toString()
                                  .split(' ')[0],
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: kblack)),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () async {
                          final startDate = await showDatePicker(
                            currentDate: DateTime.now(),
                            context: context,
                            initialDate: selectedEndDate,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2040),
                          );
                          if (startDate != null) {
                            setState(() {
                              selectedStartDate = startDate;
                              updateSelectedDays();
                            });
                          }
                        },
                        icon: const Icon(Icons.calendar_month, color: kblack),
                      ),
                    ),
                  ),
                  height10,
                  Container(
                    height: 70,
                    width: screenwidth,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5E5E5),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: ListTile(
                      title: Column(
                        children: [
                          Text(
                            "End Date",
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF8C7E7E)),
                          ),
                         height5,
                          Text(
                              selectedEndDate
                                  .toLocal()
                                  .toString()
                                  .split(' ')[0],
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: kblack)),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () async {
                          final endDate = await showDatePicker(
                            context: context,
                            initialDate: selectedEndDate,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2040),
                          );
                          if (endDate != null) {
                            setState(() {
                              selectedEndDate = endDate;
                              updateSelectedDays();
                            });
                          }
                        },
                        icon: const Icon(Icons.calendar_month, color: kblack),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: TextFormField(
                style: GoogleFonts.roboto(
                    fontSize: 20, fontWeight: FontWeight.w400, color: kblack),
                decoration: InputDecoration(
                  suffixIcon: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Apply",
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.green),
                      )),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: "Apply Coupon",
                  hintStyle: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF8C7E7E)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Details",
                  style: GoogleFonts.roboto(
                      fontSize: 18, fontWeight: FontWeight.w500, color: kblack),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                color: kblack,
                height: 0,
                thickness: 0.5,
              ),
            ),
            const PaymentDetails(name: "Days", amount: "4"),
            const PaymentDetails(name: "Rent", amount: "₹5990"),
            const PaymentDetails(name: "Additional items", amount: "₹6440"),
            const PaymentDetails(name: "Coupon Discount", amount: "₹396"),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                color: kblack,
                height: 0,
                thickness: 0.5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Amount",
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: kblack),
                  ),
                  Text(
                    "₹ 12000",
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: kblack),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(12),
              width: screenwidth,
              height: 65,
              decoration: BoxDecoration(
                  color: const Color(0xFF000000),
                  borderRadius: BorderRadius.circular(22)),
              child: Center(
                child: Text(
                  "PAY",
                  style: GoogleFonts.roboto(
                      fontSize: 26,
                      color: const Color(0XFFFFFFFF),
                      fontWeight: FontWeight.w700),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PaymentDetails extends StatelessWidget {
  final String name;
  final String amount;
  const PaymentDetails({super.key, required this.name, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Text(
            name,
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: kblack,
            ),
          ),
          const Spacer(),
          Text(
            amount,
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: kblack,
            ),
          ),
        ],
      ),
    );
  }
}
