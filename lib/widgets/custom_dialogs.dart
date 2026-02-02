import '../constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'custom_font.dart';

customDialog(BuildContext context, {required title, required content}) {
  AlertDialog alertDialog = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: <Widget>[
      ElevatedButton(
        child: Text('Okay'),
        style: ElevatedButton.styleFrom(
            backgroundColor: FB_DARK_PRIMARY, foregroundColor: Colors.white),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}

customOptionDialog(BuildContext context,
    {required title, required content, required Function onYes}) {
  AlertDialog alertDialog = AlertDialog(
    title: CustomFont(
      text: title,
      fontSize: 30.sp,
      color: Colors.black,
    ),
    content: CustomFont(text: content, fontSize: 16.sp, color: Colors.black),
    actions: <Widget>[
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: CustomFont(text: 'No', fontSize: 14.sp, color: FB_DARK_PRIMARY),
      ),
      ElevatedButton(
        child: CustomFont(
          text: 'Yes',
          fontSize: 14.sp,
          color: FB_TEXT_COLOR_WHITE,
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: FB_DARK_PRIMARY, foregroundColor: Colors.white),
        onPressed: () {
          Navigator.of(context).pop();
          onYes();
        },
      ),
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}

customShowImageDialog(BuildContext context, {required String imageUrl}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: EdgeInsets.all(12.w),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 420.h, maxWidth: ScreenUtil().screenWidth * 0.9),
                child: imageUrl.startsWith('http')
                    ? CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.contain,
                        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                            color: FB_DARK_PRIMARY,
                            value: downloadProgress.progress,
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(
                          Icons.error,
                          size: 100.sp,
                        ),
                      )
                    : Image.asset(imageUrl, fit: BoxFit.contain),
              ),
            ),
            Positioned(
              top: 4.h,
              right: 4.w,
              child: IconButton(
                icon: Icon(Icons.close, size: 24.sp),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      );
    },
  );
}