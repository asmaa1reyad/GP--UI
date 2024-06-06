import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Seller extends StatelessWidget {
  const Seller({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(255, 252, 214, 211),
                    blurRadius: 20,
                    spreadRadius: 1)
              ]),
          child: Image.asset(
            "assets/images/sellerh.png",
            filterQuality: FilterQuality.high,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          "Seller.1",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
