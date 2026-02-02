import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../constants.dart';
import 'custom_font.dart';

class NewsFeedCard extends StatelessWidget {
  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final int numOfComments;
  final int numOfShares;

  // Enhancement 1:  Create a dynamic post with these considerations: 
  //Assigning number of values, Assigning date in every post, Whether a post has a placeholder or none.
  final bool hasImage; 
  final String? profileImage;
  final String? postImage;
  final bool isLiked;
  final VoidCallback? onLikePressed;
  final VoidCallback? onTap;
  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    this.numOfLikes = 0,
    this.numOfComments = 0,
    this.numOfShares = 0,
    this.hasImage = false,
    required this.date,
    this.profileImage,
    this.postImage,
    this.isLiked = false,
    this.onLikePressed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final card = Card(
      margin: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [ 
                CircleAvatar(
                  radius: ScreenUtil().setSp(20),
                  backgroundImage: (profileImage != null && profileImage!.startsWith('http'))
                      ? CachedNetworkImageProvider(profileImage!)
                      : AssetImage(profileImage ?? 'assets/images/pfplaceholde.jpg') as ImageProvider,
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
                Spacer(),
                Icon(Icons.more_horiz),
              ],
            ),

            SizedBox(height: ScreenUtil().setHeight(5)),
            // post content
            CustomFont(
              text: postContent,
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black,
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            hasImage == true
                ? Container(
                    width: double.infinity,
                    height: ScreenUtil().setHeight(350),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: postImage != null
                        ? (postImage!.startsWith('http')
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl: postImage!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  placeholder: (c, u) => Center(child: CircularProgressIndicator()),
                                  errorWidget: (c, u, e) => Center(
                                    child: Icon(Icons.image, color: Colors.grey[400], size: ScreenUtil().setSp(50)),
                                  ),
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  postImage!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Center(
                                      child: Icon(Icons.image, color: Colors.grey[400], size: ScreenUtil().setSp(50)),
                                    );
                                  },
                                ),
                              ))
                        : Center(
                            child: Icon(Icons.image, color: Colors.grey[400], size: ScreenUtil().setSp(50)),
                          ),
                  )
                : const SizedBox(),
            Row( // Lab Act 1 Enhancement 3: Change Like, Comment, and Share Buttons to Widget Based
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(
                  icon: Icons.thumb_up,
                  label: '$numOfLikes', 
                  color: isLiked ? Colors.blue : FB_DARK_PRIMARY,
                  onPressed: onLikePressed ?? () {},
                ),
                ActionButton(
                  icon: Icons.comment,
                  label: numOfComments > 0 ? 'Comment ($numOfComments)' : 'Comment',
                  color: FB_DARK_PRIMARY,
                  onPressed: () {},
                ),
                ActionButton(
                  icon: Icons.redo,
                  label: numOfShares > 0 ? 'Share ($numOfShares)' : 'Share',
                  color: FB_DARK_PRIMARY,
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              children: [
                const CircleAvatar(
                  radius: 13,
                  backgroundImage: AssetImage('assets/images/pfplaceholde.jpg'),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(ScreenUtil().setSp(10), 0, 0, 0),
                  alignment: Alignment.centerLeft,
                  height: ScreenUtil().setHeight(25),
                  width: ScreenUtil().setWidth(330),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(
                      Radius.circular(ScreenUtil().setSp(10))),
                    ),
                  child: CustomFont(
                  text: 'Write a comment...',
                  fontSize: ScreenUtil().setSp(11),
                  color: Colors.grey
                  ),  
                ),
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
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

    return GestureDetector(onTap: onTap, child: card);
  }
}

// Lab Act 1 Enhancement 3: Change Like, Comment, and Share Buttons to Widget Based
class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: color),
      label: CustomFont(
        text: label,
        fontSize: ScreenUtil().setSp(12),
        color: color,
      ),
    );
  }
}