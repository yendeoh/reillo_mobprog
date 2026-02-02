import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_font.dart';
import '../screens/detail_screen.dart';

class AdvertisementCard extends StatelessWidget {
  final List<Map<String, String>> ads;
  const AdvertisementCard({super.key, required this.ads});

  @override
  Widget build(BuildContext context) {
    final slides = ads.take(5).toList();
    return Card(
      margin: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFont(
              text: 'Advertisement / Promotion',
              fontSize: ScreenUtil().setSp(14),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            SizedBox(height: ScreenUtil().setHeight(8)),
            CarouselSlider(
              options: CarouselOptions(
                height: ScreenUtil().setHeight(200),
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                viewportFraction: 0.85,
                autoPlay: true,
              ),
              items: slides.map((ad) {
                final img = ad['image'] ?? '';
                final title = ad['title'] ?? '';
                final desc = ad['description'] ?? '';
                return GestureDetector(
                  onTap: () {
                    final post = {
                      'userName': title,
                      'postContent': desc,
                      'postImage': img,
                      'date': 'Sponsored',
                      'hasImage': true,
                      'numOfLikes': 0,
                      'isLiked': false,
                    };
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(post: post),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: img.startsWith('http')
                              ? CachedNetworkImage(
                                  imageUrl: img,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  placeholder: (c, u) => Center(child: CircularProgressIndicator()),
                                  errorWidget: (c, u, e) => Center(child: Icon(Icons.image)),
                                )
                              : Image.asset(
                                  img,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(8)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setSp(6)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomFont(
                              text: title,
                              fontSize: ScreenUtil().setSp(13),
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            SizedBox(height: ScreenUtil().setHeight(4)),
                            CustomFont(
                              text: desc,
                              fontSize: ScreenUtil().setSp(11),
                              color: Colors.grey[700] ?? Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
