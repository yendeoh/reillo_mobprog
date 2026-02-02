import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import '../widgets/newsfeed_card.dart';
import '../widgets/promo_slide.dart';
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
      // Posts from your screenshot images
      {
        'userName': 'Cyrus Robles',
        'postContent': 'Kamusta',
        'numOfLikes': 2000,
        'date': 'October 11',
        'hasImage': true,
        'profileImage': 'https://image.petmd.com/files/inline-images/shiba-inu-black-and-tan-colors.jpg?VersionId=pLq84BEOjdMjXeDCUJJJLFPuIWYSVMUU',
        'postImage': 'https://www.petplace.com/article/breed/media_15ad72c2fdb39acf09aafa9934912c89bfa08665a.jpeg?width=1200&format=pjpg&optimize=medium',
        'isLiked': false,
      },
      {
        'userName': 'Rhoedney Reillo',
        'postContent': 'Kicking off the holiday season with her!',
        'numOfLikes': 200,
        'date': 'December 2',
        'hasImage': false,
        'profileImage': 'assets/images/user/me.jpg', // Placeholder
        'isLiked': false,
      },
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

  // The helper method for the carousel placed in the middle; it selects up to 5 posts centered around the feed's midpoint
  List<Widget> carouselItems() {
    if (posts.isEmpty) return [];
    final slideCount = posts.length >= 5 ? 5 : posts.length;
    final mid = posts.length ~/ 2;
    int start = mid - (slideCount ~/ 2);
    if (start < 0) start = 0;
    if (start + slideCount > posts.length) start = posts.length - slideCount;
    return List.generate(slideCount, (i) {
      final post = posts[start + i];
      if (post['title'] == null) post['title'] = 'More Details';
      return PromoSlide(post: post);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // We add +1 to the length to account for the Carousel inserted in the middle
      itemCount: posts.length + 1,
      itemBuilder: (context, index) {
        final carouselPosition = (posts.length ~/ 2) + 1; // insert after middle

        // Show the Carousel Slider at the middle position
        if (index == carouselPosition) {
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  height: 308.h,
                  padEnds: false,
                ),
                items: carouselItems(),
              ),
              SizedBox(height: 20.h),
            ],
          );
        }

        // Map builder index to post index (account for the inserted carousel)
        final postIndex = index < carouselPosition ? index : index - 1;
        final post = posts[postIndex];

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
            postImage: post['postImage'] ?? '',
            isLiked: post['isLiked'],
            onLikePressed: () => toggleLike(postIndex),
          ),
        );
      },
    );
  }
}