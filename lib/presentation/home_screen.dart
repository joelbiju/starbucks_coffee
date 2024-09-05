import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_coffee/utils/hover_button.dart';
import 'package:starbucks_coffee/utils/image_holder.dart';
import 'package:starbucks_coffee/utils/navbar_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color color = Colors.purple;
  double image1right = 200.0;
  double image2right = -700.0;
  double image3right = -700.0;

  void changer(int a) {
    setState(() {
      if (a == 1) {
        color = Colors.purple;
        image1right = 200.0;
        image2right = -700.0;
        image3right = -700.0;
      } else if (a == 2) {
        color = Colors.pink.shade100;
        image1right = -700.0;
        image2right = 200.0;
        image3right = -700.0;
      } else if (a == 3) {
        color = Colors.green.shade800;
        image1right = -700.0;
        image2right = -700.0;
        image3right = 200.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    bool isTablet = MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 1024;

    return Scaffold(
      appBar: isMobile || isTablet
      ? AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Image.asset('assets/logo.png', height: 50),
              ),
            ],
          ),
        )
      : null,
      drawer: isMobile || isTablet
          ? Drawer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DrawerHeader(
                    child: Image.asset('assets/logo.png', height: 100),
                  ),
                  NavbarButtons(text: "What's New"),
                  NavbarButtons(text: "Home"),
                  NavbarButtons(text: "Contact"),
                  NavbarButtons(text: "Menu"),
                ],
              ),
            )
          : null,
      body: Stack(
        children: [
          Positioned(
            bottom: -200,
            right: -100,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 370),
              curve: Curves.easeIn,
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.height * 0.9,
              decoration: BoxDecoration(
                color: color,
                borderRadius:
                    BorderRadius.circular(MediaQuery.of(context).size.height * 0.5),
              ),
            ),
          ),
          ImageHolder(
            image: 'assets/coffee1.png',
            right: image1right,
          ),
          ImageHolder(
            image: 'assets/coffee2.png',
            right: image2right,
          ),
          ImageHolder(
            image: 'assets/coffee3.png',
            right: image3right,
          ),
          Positioned(
            bottom: 20,
            right: isMobile ? 20 : MediaQuery.of(context).size.width * 0.3,
            child: Container(
              width: isMobile ? MediaQuery.of(context).size.width * 0.9 : 400,
              child: Row(
                mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
                children: [
                  HoverButton(
                    image: 'assets/coffee1.png',
                    hover: () {
                      changer(1);
                    },
                  ),
                  HoverButton(
                    image: 'assets/coffee2.png',
                    hover: () {
                      changer(2);
                    },
                  ),
                  HoverButton(
                    image: 'assets/coffee3.png',
                    hover: () {
                      changer(3);
                    },
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isMobile && !isTablet)
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 30.0, top: 25.0, right: 20.0),
                        height: 80,
                        child: Image(image: AssetImage('assets/logo.png'))),
                    Spacer(),
                    Row(
                      children: [
                        NavbarButtons(text: "What's New"),
                        NavbarButtons(text: "Home"),
                        NavbarButtons(text: "Contact"),
                        NavbarButtons(text: "Menu"),
                      ],
                    ),
                  ],
                ),
              SizedBox(
                height: isMobile || isTablet ? 40.0 : 80.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.0),
                child: Text(
                  'Its not just a Coffee',
                  style: GoogleFonts.rubik(
                    fontSize: isMobile ? 30.0 : 60.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.0),
                child: Row(
                  children: [
                    Text(
                      'Its ',
                      style: GoogleFonts.rubik(
                        fontSize: isMobile ? 30.0 : 60.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Starbucks',
                      style: GoogleFonts.montserrat(
                        fontSize: isMobile ? 30.0 : 60.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 50.0, top: 10.0),
                width: isMobile
                    ? MediaQuery.of(context).size.width * 0.9
                    : MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using content here',
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 12.0 : 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 15.0, left: 50.0, right: isMobile ? 20.0 : 50.0),
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: Colors.green.shade700,
                  borderRadius: BorderRadius.circular(7.0),
                ),
                child: Text(
                  'Learn More',
                  style: GoogleFonts.montserrat(
                    fontSize: isMobile ? 14.0 : 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}