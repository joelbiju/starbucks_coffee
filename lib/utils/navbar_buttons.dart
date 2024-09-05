import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavbarButtons extends StatefulWidget {
  final String? text;

  const NavbarButtons({super.key, this.text});

  @override
  State<NavbarButtons> createState() => _NavbarButtonsState();
}

class _NavbarButtonsState extends State<NavbarButtons> {
  Color color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return MouseRegion(
      onEnter: (a) {
        if (!isMobile) {
          setState(() {
            color = Colors.black87;
          });
        }
      },
      onExit: (a) {
        if (!isMobile) {
          setState(() {
            color = Colors.transparent;
          });
        }
      },
      child: GestureDetector(
        onTap: () {
          if (isMobile) {
            // Handle tap for mobile, if needed
          }
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 375),
          curve: Curves.easeInOut,
          margin: EdgeInsets.only(right: isMobile ? 10.0 : 15.0),
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 15.0 : 30.0, vertical: isMobile ? 10.0 : 15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(isMobile ? 3.0 : 5.0),
            border: Border.all(color: color, width: 1.5),
          ),
          child: Center(
            child: Text(
              widget.text!,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: isMobile ? 14.0 : 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
