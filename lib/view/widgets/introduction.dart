import 'package:expense_manager/view/widgets/primaryText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Introduction extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  final double imageHeight;
  final double imageWidth;

  Introduction(
      {this.imageUrl,
      this.title,
      this.subTitle,
      this.imageHeight,
      this.imageWidth});

  @override
  State<StatefulWidget> createState() {
    return new IntroductionState();
  }
}

class IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                widget.imageUrl,
                height: widget.imageHeight,
                width: widget.imageWidth,
              ),
            ),
            Center(
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: PrimaryText(widget.title,
                      textColor: Colors.black,
                      fontSize: 21.0,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(
              height: 10.0,
            ),
            PrimaryText(
              widget.subTitle,
              textColor: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
