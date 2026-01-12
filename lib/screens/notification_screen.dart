import 'package:flutter/material.dart';
import '../widgets/notification.dart' as notif;
import 'detail_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<Map<String, String>> notifications = [
  {
    'name': 'Rhoedney Reillo',
    'post': 'posted: God did',
    'description': 'Tap to view post',
    'time': 'Just now',
    'profileImage': 'assets/images/user/me.jpg'
  },
];

  final Map<String, dynamic> featuredPost = {
    'userName': 'Rhoedney Reillo',
    'postContent': 'God did',
    'numOfLikes': 100,
    'date': 'May 9',
    'hasImage': false,
    'profileImage': 'assets/images/user/me.jpg',
    'isLiked': false,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil().screenWidth,
      child: ListView.separated(  
        padding: EdgeInsets.symmetric(vertical: 10.h), 
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final notifData = notifications[index];
          return notif.Notification(
            name: notifData['name']!,
            post: notifData['post']!,
            description: notifData['description']!,
            time: notifData['time']!,
            profileImage: notifData['profileImage']!,
            onTap: index == 0 ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(post: featuredPost),
                ),
              );
            } : null,
          );
        },
      ),
    );
  }
}