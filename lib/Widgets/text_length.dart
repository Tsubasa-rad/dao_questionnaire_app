//  長い文章などの時に最初は、短く表示してタップすると全てが表示される
// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class TextLength extends StatefulWidget {
  TextLength({Key? key, required this.caption, this.count = 50})
      : super(key: key);

  final String caption;
  final int count;
  final textStyle = const TextStyle(
      fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500);

  @override
  State<TextLength> createState() => _TextLengthState();
}

class _TextLengthState extends State<TextLength> {
  late String firstHalf;
  late String secondHalf;
  late int nu = '\n'.allMatches(widget.caption).length + 2;
  bool flag = true;

  @override
  void initState() {
    super.initState();
    textLength();
  }

  Future<void> textLength() async {
    if (widget.caption.length > widget.count) {
      firstHalf = widget.caption.substring(0, widget.count);
      secondHalf =
          widget.caption.substring(widget.count + 1, widget.caption.length);
    } else {
      firstHalf = widget.caption;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: widget.caption.length < widget.count
            ? Text(widget.caption)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        flag = !flag;
                      });
                    },
                    child: Text(
                        flag ? firstHalf + "  \n...続きを見る" : widget.caption),
                  ),
                ],
              ));
  }
}
