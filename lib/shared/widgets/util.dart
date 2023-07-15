import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class Utils {
  Size getScreenSize() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
  }

  showSnackBar({required BuildContext context, required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(

        backgroundColor:   Color.fromRGBO(4, 131, 153 ,1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        content: SizedBox(
          height: getScreenSize().height*0.03,
          width: getScreenSize().width,
          child: ListView(
            scrollDirection: Axis.horizontal,
           // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontFamily: "title"
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }}