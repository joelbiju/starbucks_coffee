import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  final String? image;
  final Function? hover;

  const HoverButton({super.key, this.image, this.hover});

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return GestureDetector(
      onTap: () {
        if (isMobile) {
          widget.hover!();
        }
      },
      child: MouseRegion(
        onEnter: (val) {
          if (!isMobile) {
            widget.hover!();
          }
        },
        child: Container(
          height: isMobile ? 60 : 80,
          width: isMobile ? 80 : 100,
          child: Image(
            image: AssetImage(widget.image!),
          ),
        ),
      ),
    );
  }
}
