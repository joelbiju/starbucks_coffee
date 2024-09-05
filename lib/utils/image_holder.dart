import 'package:flutter/material.dart';

class ImageHolder extends StatefulWidget {
  final double? right;
  final String? image;

  const ImageHolder({super.key, this.right, this.image});

  @override
  State<ImageHolder> createState() => _ImageHolderState();
}

class _ImageHolderState extends State<ImageHolder> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return AnimatedPositioned(
      duration: Duration(milliseconds: 400),
      bottom: isMobile ? 100 : 140,
      right: isMobile ? widget.right! / 2 : widget.right!,
      child: Container(
        height: isMobile
            ? MediaQuery.of(context).size.height * 0.5
            : MediaQuery.of(context).size.height * 0.65,
        child: Image(image: AssetImage(widget.image!)),
      ),
    );
  }
}
