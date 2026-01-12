import 'package:flutter/material.dart';
import '../widgets/newsfeed_card.dart';
import 'detail_screen.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  late List<Map<String, dynamic>> posts;

  @override
  void initState() {
    super.initState();
    posts = [
      {
        'userName': 'Rhoedney Reillo',
        'postContent': 'God did',
        'numOfLikes': 100,
        'date': 'May 9',
        'hasImage': false,
        'profileImage': 'assets/images/user/me.jpg',
        'isLiked': false,
      },
      {
        'userName': 'Jeiazel Lazaro',
        'postContent': 'Meet Panda',
        'numOfLikes': 79,
        'date': '5 hrs ago',
        'hasImage': true,
        'profileImage': 'assets/images/user/langga.jpg',
        'postImage': 'assets/images/post/panda.jpg',
        'isLiked': false,
      },
      {
        'userName': 'Meta',
        'postContent': '...',
        'numOfLikes': 67,
        'date': 'Dec 14',
        'hasImage': true,
        'profileImage': 'assets/images/user/leon.jpg',
        'postImage': 'assets/images/post/gold.jpg',
        'isLiked': false,
      },
      {
        'userName': 'shits',
        'postContent': 'Damn',
        'numOfLikes': 93,
        'date': 'Dec 3',
        'hasImage': false,
        'profileImage': 'assets/images/user/bulat.jpg',
        'isLiked': false,
      },
      {
        'userName': 'Pray and believe',
        'postContent': 'Out here vibin with the gang',
        'numOfLikes': 69,
        'date': 'Jul 15',
        'hasImage': false,
        'profileImage': 'assets/images/user/tatsu.jpg',
        'isLiked': false,
      },
      {
        'userName': 'uuhhhh',
        'postContent': 'Me when i play rank',
        'numOfLikes': 1000,
        'date': 'Dec 14',
        'hasImage': true,
        'profileImage': 'assets/images/user/like.jpg',
        'postImage': 'assets/images/post/rank.jpg',
        'isLiked': false,
      },
      {
        'userName': 'Rhoedney Reillo',
        'postContent': 'so pretty',
        'numOfLikes': 45,
        'date': 'Nov 30',
        'hasImage': true,
        'profileImage': 'assets/images/user/me.jpg',
        'postImage': 'assets/images/post/baby.jpg',
        'isLiked': false,
      },
    ];
  }

  void toggleLike(int index) {
    setState(() {
      if (posts[index]['isLiked']) {
        posts[index]['numOfLikes'] -= 1;
        posts[index]['isLiked'] = false;
      } else {
        posts[index]['numOfLikes'] += 1;
        posts[index]['isLiked'] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(post: post),
              ),
            );
          },
          child: NewsFeedCard(
            userName: post['userName'], 
            postContent: post['postContent'],
            numOfLikes: post['numOfLikes'],
            hasImage: post['hasImage'],
            date: post['date'],
            profileImage: post['profileImage'],
            postImage: post['postImage'],
            isLiked: post['isLiked'],
            onLikePressed: () => toggleLike(index),
          ),
        );
      },
    );
  }
}