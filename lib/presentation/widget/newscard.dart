import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsCard extends StatelessWidget {
  final String auther, imageURl, title, desription;
  const NewsCard(
      {Key? key,
      required this.auther,
      required this.imageURl,
      required this.title,
      required this.desription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 5.h,
            ),
            Image.network(imageURl, fit: BoxFit.contain),
            SizedBox(
              height: 5.h,
            ),
            Text(desription),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Auther : $auther",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
