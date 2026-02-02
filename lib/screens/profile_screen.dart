import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../widgets/custom_font.dart';
import '../widgets/custom_button.dart';
import '../widgets/newsfeed_card.dart';
import '../constants.dart';
import 'detail_screen.dart';
import '../services/user_session.dart';
import '../widgets/custom_dialogs.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int followers = 324;
  int following = 292;

  String coverImage = 'assets/images/post/baby.jpg';
  String profileImage = 'assets/images/user/me.jpg';

  final List<Map<String, dynamic>> profilePosts = [
    {
      'userName': 'Rhoedney Isid S Reillo',
      'postContent': 'Eh nung nakaligo',
      'date': '1 hour ago',
      'likes': 67,
      'comments': 15,
      'shares': 0,
      'hasImage': true,
      'profileImage': 'assets/images/user/me.jpg',
      'postImage': 'assets/images/user/me.jpg',
    },
    {
      'userName': 'Rhoedney Isid S Reillo',
      'postContent': 'Shoot your shot!',
      'date': '1 month ago',
      'likes': 145,
      'comments': 24,
      'shares': 2,
      'hasImage': true,
      'profileImage': 'assets/images/user/me.jpg',
      'postImage': 'assets/images/post/gold.jpg',
    },
  ];

  // Logic from image snippet: Helper to show image dialog
  void customShowImageDialog(BuildContext context, {required String imageUrl}) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            imageUrl.startsWith('http') 
              ? CachedNetworkImage(imageUrl: imageUrl) 
              : Image.asset(imageUrl),
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("Close"))
          ],
        ),
      ),
    );
  }

  void toggleProfileLike(int index) {
    setState(() {
      if (profilePosts[index]['isLiked'] == true) {
        profilePosts[index]['likes'] -= 1;
        profilePosts[index]['isLiked'] = false;
      } else {
        profilePosts[index]['likes'] += 1;
        profilePosts[index]['isLiked'] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            image: DecorationImage(
                              image: coverImage.startsWith('http')
                                  ? CachedNetworkImageProvider(coverImage) as ImageProvider
                                  : AssetImage(coverImage) as ImageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -50,
                          left: ScreenUtil().setWidth(20),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: profileImage.startsWith('http')
                                    ? CachedNetworkImageProvider(profileImage)
                                    : AssetImage(profileImage) as ImageProvider,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.grey[300],
                                  child: const Icon(Icons.camera_alt, size: 16, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(55)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ValueListenableBuilder<String?>(
                            valueListenable: UserSession.username,
                            builder: (context, value, child) {
                              return CustomFont(
                                text: (value == null || value.isEmpty) ? 'Rhoedney Isid S Reillo' : value,
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenUtil().setSp(20),
                                color: Colors.black,
                              );
                            },
                          ),
                          SizedBox(height: ScreenUtil().setHeight(5)),
                          CustomFont(text: 'San Mateo Rizal', fontSize: ScreenUtil().setSp(15), color: Colors.black),
                          SizedBox(height: ScreenUtil().setHeight(10)),
                          CustomFont(text: 'gogogo daddy', fontSize: ScreenUtil().setSp(15), color: Colors.black, fontWeight: FontWeight.bold),
                        ],
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                      child: Row(
                        children: [
                          _buildStatColumn('2', 'Posts'),
                          _buildStatColumn(following.toString(), 'Following'),
                          _buildStatColumn(followers.toString(), 'Followers'),
                        ],
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                      child: Row(
                        children: [
                          Expanded(child: CustomButton(buttonName: 'Follow', onPressed: () {})),
                          SizedBox(width: ScreenUtil().setWidth(10)),
                          Expanded(child: CustomButton(buttonName: 'Message', buttonType: 'outlined', onPressed: () {})),
                        ],
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15)),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: TabBar(
                  indicatorColor: FB_DARK_PRIMARY,
                  tabs: [
                    Tab(child: CustomFont(text: 'Posts', fontSize: ScreenUtil().setSp(15), color: Colors.black)),
                    Tab(child: CustomFont(text: 'About', fontSize: ScreenUtil().setSp(15), color: Colors.black)),
                    Tab(child: CustomFont(text: 'Photos', fontSize: ScreenUtil().setSp(15), color: Colors.black)),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              // Tab 1: Posts
              _buildPostsTab(),
              // Tab 2: About
              _buildAboutTab(),
              // Tab 3: Photos (MIXED FROM YOUR IMAGE SNIPPET)
              _buildPhotosGridTab(),
            ],
          ),
        ),
      ),
    );
  }

  // Mixed Logic
  Widget _buildPhotosGridTab() {
    const String petImage = 'https://www.petplace.com/article/breed/media_15ad72c2fdb39acf09aafa9934912c89bfa08665a.jpeg?width=1200&format=pjpg&optimize=medium';

    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        GestureDetector(
          child: CachedNetworkImage(
            imageUrl: petImage,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) => Center(
              child: CircularProgressIndicator(
                color: FB_DARK_PRIMARY,
                value: downloadProgress.progress,
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error, size: 48.sp),
          ),
          onTap: () => customShowImageDialog(context, imageUrl: petImage),
        ),
        GestureDetector(
          onTap: () => customShowImageDialog(context, imageUrl: petImage),
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: CachedNetworkImage(
              imageUrl: petImage,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                child: CircularProgressIndicator(
                  color: FB_DARK_PRIMARY,
                  value: downloadProgress.progress,
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error, size: 48.sp),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => customShowImageDialog(context, imageUrl: petImage),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.teal[200],
              image: DecorationImage(
                image: NetworkImage(petImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Rest of your existing UI components...
  Widget _buildStatColumn(String count, String label) {
    return Expanded(
      child: Column(
        children: [
          CustomFont(text: count, fontSize: ScreenUtil().setSp(16), color: Colors.black, fontWeight: FontWeight.bold),
          CustomFont(text: label, fontSize: ScreenUtil().setSp(12), color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildPostsTab() {
    return ValueListenableBuilder<String?>(
      valueListenable: UserSession.username,
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: profilePosts.length,
          itemBuilder: (context, index) {
            final post = profilePosts[index];
            return NewsFeedCard(
              userName: (value == null || value.isEmpty) ? post['userName'] : value,
              postContent: post['postContent'],
              date: post['date'],
              numOfLikes: post['likes'],
              numOfComments: post['comments'] ?? 0,
              numOfShares: post['shares'] ?? 0,
              hasImage: post['hasImage'],
              postImage: post['postImage'],
              profileImage: post['profileImage'],
              isLiked: post['isLiked'] ?? false,
              onLikePressed: () => toggleProfileLike(index),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(post: post))),
            );
          },
        );
      },
    );
  }

  Widget _buildAboutTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFont(text: 'About Me', fontSize: ScreenUtil().setSp(20), color: Colors.black, fontWeight: FontWeight.bold),
            SizedBox(height: ScreenUtil().setHeight(12)),
            CustomFont(text: 'Hi, I\'m Rhoedney! Professional bug maker.', fontSize: ScreenUtil().setSp(14), color: Colors.grey[700] ?? Colors.grey),
            SizedBox(height: ScreenUtil().setHeight(20)),
            Row(children: [Icon(Icons.code, color: FB_DARK_PRIMARY), SizedBox(width: 8), CustomFont(text: 'Tech Stack', fontSize: ScreenUtil().setSp(15), color: Colors.black, fontWeight: FontWeight.bold)]),
            Wrap(spacing: 8, children: [_buildSkillChip('Flutter'), _buildSkillChip('Dart'), _buildSkillChip('React.js')]),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(
      label: CustomFont(text: skill, fontSize: 12, color: FB_DARK_PRIMARY),
      backgroundColor: FB_DARK_PRIMARY.withOpacity(0.1),
      side: BorderSide(color: FB_DARK_PRIMARY),
    );
  }
}