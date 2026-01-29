import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'custom_font.dart';

class NewsFeedCard extends StatelessWidget {
  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final int numOfComments;
  final int numOfShares;
  final bool hasImage;
  final String? postImage;
  final String? profileImage;
  final String? commentUserImage;
  final VoidCallback? onTap;
  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    this.numOfLikes = 0,
    this.numOfComments = 0,
    this.numOfShares = 0,
    this.hasImage = false,
    this.postImage,
    this.profileImage,
    this.commentUserImage,
    required this.date,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget cardContent = Card(
      margin: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Profile Image
                profileImage != null
                    ? CircleAvatar(
                        radius: ScreenUtil().setSp(20),
                        backgroundImage: AssetImage(profileImage!),
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        radius: ScreenUtil().setSp(20),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: ScreenUtil().setSp(25),
                        ),
                      ),
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFont(
                      text: userName,
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomFont(
                          text: date,
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(3),
                        ),
                        Icon(
                          Icons.public,
                          color: Colors.grey,
                          size: ScreenUtil().setSp(15),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            // Post Content
            CustomFont(
              text: postContent,
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black,
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            
            // Enhancement: Post Image
            hasImage == true
                ? Container(
                    width: double.infinity,
                    height: ScreenUtil().setHeight(200),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: postImage != null
                        ? Image.asset(
                            postImage!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.image,
                                color: Colors.grey[400],
                                size: ScreenUtil().setSp(50),
                              );
                            },
                          )
                        : Icon(
                            Icons.image,
                            color: Colors.grey[400],
                            size: ScreenUtil().setSp(50),
                          ),
                  )
                : SizedBox(
                    height: ScreenUtil().setHeight(1),
                  ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_up, color: FB_DARK_PRIMARY),
                    ),
                    CustomFont(
                      text: '$numOfLikes',
                      fontSize: ScreenUtil().setSp(12),
                      color: Colors.grey,
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.comment, color: FB_DARK_PRIMARY),
                    ),
                    CustomFont(
                      text: '$numOfComments',
                      fontSize: ScreenUtil().setSp(12),
                      color: Colors.grey,
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share, color: FB_DARK_PRIMARY),
                    ),
                    CustomFont(
                      text: '$numOfShares',
                      fontSize: ScreenUtil().setSp(12),
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                // Comment Input Avatar
                commentUserImage != null
                    ? CircleAvatar(
                        radius: ScreenUtil().setSp(15),
                        backgroundImage: AssetImage(commentUserImage!),
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        radius: ScreenUtil().setSp(15),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: ScreenUtil().setSp(20),
                        ),
                      ),
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(ScreenUtil().setSp(10), 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    height: ScreenUtil().setHeight(25),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(
                        Radius.circular(ScreenUtil().setSp(5)),
                      ),
                    ),
                    child: CustomFont(
                      text: 'Write a comment...',
                      fontSize: ScreenUtil().setSp(11),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(1),
            ),
            CustomFont(
              text: 'View comments',
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.bold,
              color: Colors.black,

            ),
          ],
        ),
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: cardContent,
      );
    }

    return cardContent;
  }
}