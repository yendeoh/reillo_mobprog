import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/newsfeed_card.dart';

class DetailScreen extends StatefulWidget {
  final Map<String, dynamic> post;

  const DetailScreen({super.key, required this.post});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late int numOfLikes;
  late bool isLiked;

  @override
  void initState() {
    super.initState();
    numOfLikes = widget.post['likes'] ?? widget.post['numOfLikes'] ?? 0;
    isLiked = widget.post['isLiked'] ?? false;
  }

  void _toggleLikes() {
    setState(() {
      if (isLiked) {
        numOfLikes--;
        isLiked = false;
      } else {
        numOfLikes++;
        isLiked = true;
      }
      widget.post['numOfLikes'] = numOfLikes;
      widget.post['isLiked'] = isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Detail'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: NewsFeedCard(
          userName: widget.post['userName'],
          postContent: widget.post['postContent'],
          numOfLikes: numOfLikes,
          hasImage: widget.post['hasImage'] ?? false,
          date: widget.post['date'],
          profileImage: widget.post['profileImage'],
          postImage: widget.post['postImage'],
          isLiked: isLiked,
          onLikePressed: _toggleLikes,
        ),
      ),
    );
  }
}
