import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_font.dart';
import '../screens/detail_screen.dart';

class PromoSlide extends StatelessWidget {
  final Map<String, dynamic> post;
  const PromoSlide({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final profile = post['profileImage'] ?? 'assets/images/pfplaceholde.jpg';
    final image = post['postImage'] ?? '';
    final title = (post['title'] as String?) ?? 'MORE DETAILS';
    final subtitle = (post['postContent'] as String?) ?? '';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(post: post),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setSp(10), vertical: ScreenUtil().setSp(6)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(ScreenUtil().setSp(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: ScreenUtil().setSp(18),
                    backgroundImage: profile.startsWith('http')
                        ? CachedNetworkImageProvider(profile)
                        : AssetImage(profile) as ImageProvider,
                  ),
                  SizedBox(width: ScreenUtil().setWidth(8)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFont(
                          text: post['userName'] ?? '',
                          fontSize: ScreenUtil().setSp(14),
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        SizedBox(height: ScreenUtil().setHeight(2)),
                        Row(
                          children: [
                            CustomFont(
                              text: post['date'] ?? '',
                              fontSize: ScreenUtil().setSp(11),
                              color: Colors.grey,
                            ),
                            SizedBox(width: ScreenUtil().setWidth(6)),
                            Icon(Icons.public, size: ScreenUtil().setSp(12), color: Colors.grey),
                          ],
                        )
                      ],
                    ),
                  ),
                  Icon(Icons.more_horiz),
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(8)),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: image.startsWith('http')
                      ? CachedNetworkImage(
                          imageUrl: image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          placeholder: (c, u) => Center(child: CircularProgressIndicator()),
                          errorWidget: (c, u, e) => Center(child: Icon(Icons.image)),
                        )
                      : Image.asset(
                          image.isNotEmpty ? image : 'assets/images/post/baby.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setSp(10), vertical: ScreenUtil().setSp(8)),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomFont(
                            text: title.toUpperCase(),
                            fontSize: ScreenUtil().setSp(10),
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                          ),
                          SizedBox(height: ScreenUtil().setHeight(4)),
                          CustomFont(
                            text: subtitle,
                            fontSize: ScreenUtil().setSp(12),
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(8)),
                    Container(
                      height: ScreenUtil().setSp(36),
                      width: ScreenUtil().setSp(48),
                      decoration: BoxDecoration(
                        color: Colors.teal[900],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
