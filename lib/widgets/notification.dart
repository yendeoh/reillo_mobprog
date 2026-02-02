import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../widgets/custom_font.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notification extends StatelessWidget {
  const Notification({
  super.key,
  required this.name,
  required this.post,
  required this.description,
  required this.time,
  this.profileImage = 'assets/images/pfplaceholde.jpg',
  this.onTap,
});

  final String name;
  final String post;
  final String description;
  final String time;
  final String profileImage;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      padding: EdgeInsets.all(ScreenUtil().setSp(15)),
      child: Row(
        children: [
          CircleAvatar(
            radius: ScreenUtil().setSp(25),
            backgroundImage: profileImage.startsWith('http')
                ? CachedNetworkImageProvider(profileImage)
                : AssetImage(profileImage) as ImageProvider,
          ),
          SizedBox(
            width: ScreenUtil().setWidth(10),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              CustomFont(
                text: name, 
                fontSize: ScreenUtil().setSp(20), 
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
              CustomFont(
                text: 'Posted: $post', 
                fontSize: ScreenUtil().setSp(13), 
                color: Colors.black,
              ),
              CustomFont(
                text: description,
                fontSize: ScreenUtil().setSp(12),
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
              CustomFont(
                text: time,
                fontSize: 10.sp,
                color: Colors.grey,
          ),
              ],
            ),
          ),
          const Spacer(),
          const Icon(Icons.more_horiz),
      ],),
    );

    if (onTap != null) {
      content = GestureDetector(
        onTap: onTap,
        child: content,
      );
    }

    return content;
  }
}