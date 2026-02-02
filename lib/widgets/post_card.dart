import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../widgets/custom_inkwell_button.dart';
import '../screens/detail_screen.dart';
import '../constants.dart';
import 'custom_font.dart';

class PostCard extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final int numOfComments;
  final int numOfShares;
  final bool hasImage;
  final String? postImage; // Now treats this as a URL
  final String? profileImage; // Now treats this as a URL
  final String? adsMarket;
  final VoidCallback? onTap;

  const PostCard({
    super.key,
    required this.userName,
    required this.postContent,
    this.numOfLikes = 0,
    this.numOfComments = 0,
    this.numOfShares = 0,
    this.hasImage = false,
    this.postImage,
    this.profileImage,
    this.adsMarket,
    required this.date,
    this.onTap,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late int _currentLikes;

  @override
  void initState() {
    super.initState();
    _currentLikes = widget.numOfLikes;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ?? () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(
            post: {
              'userName': widget.userName,
              'postContent': widget.postContent,
              'date': widget.date,
              'numOfLikes': _currentLikes,
              'postImage': widget.postImage,
              'profileImage': widget.profileImage,
              'hasImage': widget.hasImage,
              'isLiked': false,
            },
          ),
        ),
      ),
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Padding(
          padding: EdgeInsets.all(ScreenUtil().setSp(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Header Section ---
              Row(
                children: [
                  widget.profileImage == null || widget.profileImage == ""
                      ? Icon(Icons.person, size: 30.sp)
                      : ClipOval(
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            width: 35.w,
                            height: 35.w,
                            imageUrl: widget.profileImage!,
                            progressIndicatorBuilder: (context, url, progress) =>
                                CircularProgressIndicator(value: progress.progress, color: FB_DARK_PRIMARY),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                  SizedBox(width: ScreenUtil().setWidth(10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFont(
                        text: widget.userName,
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          CustomFont(text: widget.date, fontSize: 12.sp, color: Colors.grey),
                          SizedBox(width: 3.w),
                          Icon(Icons.public, color: Colors.grey, size: 15.sp),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.more_horiz),
                ],
              ),
              SizedBox(height: 10.h),

              // --- Content Section ---
              CustomFont(
                text: widget.postContent,
                fontSize: 13.sp,
                color: Colors.black,
              ),
              SizedBox(height: 10.h),

              // --- Image Section ---
              if (widget.hasImage && widget.postImage != null)
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: widget.postImage!,
                      progressIndicatorBuilder: (context, url, progress) =>
                          CircularProgressIndicator(value: progress.progress, color: FB_DARK_PRIMARY),
                      errorWidget: (context, url, error) => const Icon(Icons.image_not_supported),
                    ),
                  ),
                ),

              // --- Interactions Row ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () => setState(() => _currentLikes++),
                    icon: const Icon(Icons.thumb_up_alt_outlined, color: FB_DARK_PRIMARY),
                    label: CustomFont(
                      text: _currentLikes == 0 ? 'Like' : '$_currentLikes',
                      fontSize: 12.sp,
                      color: FB_DARK_PRIMARY,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.comment, color: FB_DARK_PRIMARY),
                    label: CustomFont(text: 'Comment', fontSize: 12.sp, color: FB_DARK_PRIMARY),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.redo, color: FB_DARK_PRIMARY),
                    label: CustomFont(text: 'Share', fontSize: 12.sp, color: FB_DARK_PRIMARY),
                  ),
                ],
              ),

              // --- Comment Input Mock ---
              Row(
                children: [
                  const Icon(Icons.person_outline),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CustomFont(text: "Write a comment...", fontSize: 11.sp, color: Colors.grey),
                    ),
                  ),
                ],
              ),

              // --- Ads/Market Section (From Image 2) ---
              if (widget.adsMarket != null && widget.adsMarket!.isNotEmpty) ...[
                SizedBox(height: 15.h),
                Container(
                  padding: EdgeInsets.all(8.sp),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomFont(text: 'SHOP DETAILS', fontSize: 11.sp, color: Colors.grey),
                          CustomFont(
                            text: widget.adsMarket!,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      CustomInkwellButton(
                        width: 80.w,
                        height: 35.h,
                        icon: Icon(Icons.arrow_right_alt, color: FB_LIGHT_PRIMARY),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              post: {
                                'userName': widget.userName,
                                'postContent': widget.postContent,
                                'date': widget.date,
                                'numOfLikes': _currentLikes,
                                'postImage': widget.postImage,
                                'profileImage': widget.profileImage,
                                'hasImage': widget.hasImage,
                                'isLiked': false,
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              SizedBox(height: 10.h),
              CustomFont(
                text: "View comments",
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}