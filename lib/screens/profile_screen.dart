import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_font.dart';
import '../widgets/custom_button.dart';
import '../widgets/post_card.dart';
import '../constants.dart';
import 'detail_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  int followers = 324;
  int following = 292;

  
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
      'postImage': 'assets/images/post/me.jpg',
    },
  ];

  final List<String> postImage = [
    'assets/images/user/cat.jpg',
    'assets/images/post/langga.jpg',
    'assets/images/post_placeholder.png',
    'assets/images/post_placeholder.png',
    'assets/images/user/me.jpg',
    'assets/images/post/date.jpg',

  ];

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
                            image: const DecorationImage(
                              image: AssetImage('assets/images/post/baby.jpg'),
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
                              const CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage('assets/images/user/me.jpg'),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.grey[300],
                                  child: const Icon(
                                    Icons.camera_alt,
                                    size: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(55)),
                    
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomFont(
                            text: 'Rhoedney Isid S Reillo',
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(20),
                            color: Colors.black,
                          ),
                          SizedBox(height: ScreenUtil().setHeight(5)),
                          CustomFont(
                            text: 'San Mateo Rizal',
                            fontSize: ScreenUtil().setSp(15),
                            color: Colors.black,
                          ),
                          SizedBox(height: ScreenUtil().setHeight(10)),
                          CustomFont(
                            text: 'gogogo daddy',
                            fontSize: ScreenUtil().setSp(15),
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10)),
                    
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(20),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                CustomFont(
                                  text: '2',
                                  fontSize: ScreenUtil().setSp(16),
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomFont(
                                  text: 'Posts',
                                  fontSize: ScreenUtil().setSp(12),
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                CustomFont(
                                  text: following.toString(),
                                  fontSize: ScreenUtil().setSp(16),
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomFont(
                                  text: 'Following',
                                  fontSize: ScreenUtil().setSp(12),
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                CustomFont(
                                  text: followers.toString(),
                                  fontSize: ScreenUtil().setSp(16),
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomFont(
                                  text: 'Followers',
                                  fontSize: ScreenUtil().setSp(12),
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15)),
                    // Action Buttons
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(20),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              buttonName: 'Follow',
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(10)),
                          Expanded(
                            child: CustomButton(
                              buttonName: 'Message',
                              buttonType: 'outlined',
                              onPressed: () {},
                            ),
                          ),
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
                    Tab(
                      child: CustomFont(
                        text: 'Posts',
                        fontSize: ScreenUtil().setSp(15),
                        color: Colors.black,
                      ),
                    ),
                    Tab(
                      child: CustomFont(
                        text: 'About',
                        fontSize: ScreenUtil().setSp(15),
                        color: Colors.black,
                      ),
                    ),
                    Tab(
                      child: CustomFont(
                        text: 'Photos',
                        fontSize: ScreenUtil().setSp(15),
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: profilePosts.length,
                itemBuilder: (context, index) {
                  final post = profilePosts[index];
                  return NewsFeedCard(
                    userName: post['userName'],
                    postContent: post['postContent'],
                    date: post['date'],
                    numOfLikes: post['likes'],
                    numOfComments: post['comments'],
                    numOfShares: post['shares'],
                    hasImage: post['hasImage'],
                    postImage: post['postImage'],
                    profileImage: post['profileImage'],
                    commentUserImage: post['profileImage'],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(post: post),
                        ),
                      );
                    },
                  );
                },
              ),
                      
                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(ScreenUtil().setSp(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomFont(
                                text: 'About Me',
                                fontSize: ScreenUtil().setSp(20),
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: ScreenUtil().setHeight(12)),
                              CustomFont(
                                text:
                                    'Hi, I\'m Rhoedney! Currently a 3rd year IT student, Professional bug maker. Always down for a collab or just vibing in online games.',
                                fontSize: ScreenUtil().setSp(14),
                                color: Colors.grey[700] ?? Colors.grey,
                              ),
                              SizedBox(height: ScreenUtil().setHeight(20)),
                              
                              // Skills Section
                              Row(
                                children: [
                                  Icon(Icons.code, color: FB_DARK_PRIMARY, size: ScreenUtil().setSp(20)),
                                  SizedBox(width: ScreenUtil().setWidth(8)),
                                  CustomFont(
                                    text: 'Tech Stack',
                                    fontSize: ScreenUtil().setSp(16),
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              SizedBox(height: ScreenUtil().setHeight(8)),
                              Wrap(
                                spacing: ScreenUtil().setWidth(8),
                                runSpacing: ScreenUtil().setHeight(8),
                                children: [
                                  _buildSkillChip('Flutter'),
                                  _buildSkillChip('Dart'),
                                  _buildSkillChip('HTML/CSS'),
                                  _buildSkillChip('React.js'),
                                  _buildSkillChip('JavaScript'),
                                  _buildSkillChip('Git'),
                                ],
                              ),
                              SizedBox(height: ScreenUtil().setHeight(15)),
                              
                              // Education Section
                              Row(
                                children: [
                                  Icon(Icons.school, color: FB_DARK_PRIMARY, size: ScreenUtil().setSp(20)),
                                  SizedBox(width: ScreenUtil().setWidth(8)),
                                  CustomFont(
                                    text: 'Education',
                                    fontSize: ScreenUtil().setSp(16),
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              SizedBox(height: ScreenUtil().setHeight(8)),
                              CustomFont(
                                text: 'Bachelor of Science in Information Technology',
                                fontSize: ScreenUtil().setSp(14),
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(height: ScreenUtil().setHeight(4)),
                              CustomFont(
                                text: 'Currently in 3rd Year | Mobile and Web Application Development',
                                fontSize: ScreenUtil().setSp(12),
                                color: Colors.grey[700] ?? Colors.grey,
                              ),
                              SizedBox(height: ScreenUtil().setHeight(4)),
                              CustomFont(
                                text: 'National University - Manila | 2023-2027',
                                fontSize: ScreenUtil().setSp(12),
                                color: Colors.grey[500] ?? Colors.grey,
                              ),
                              SizedBox(height: ScreenUtil().setHeight(15)),
                              
                              // Interests Section
                              Row(
                                children: [
                                  Icon(Icons.interests, color: FB_DARK_PRIMARY, size: ScreenUtil().setSp(20)),
                                  SizedBox(width: ScreenUtil().setWidth(8)),
                                  CustomFont(
                                    text: 'Interests & Goals',
                                    fontSize: ScreenUtil().setSp(16),
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              SizedBox(height: ScreenUtil().setHeight(8)),
                              Wrap(
                                spacing: ScreenUtil().setWidth(8),
                                runSpacing: ScreenUtil().setHeight(8),
                                children: [
                                  _buildSkillChip('Mobile Apps'),
                                  _buildSkillChip('Software Design'),
                                  _buildSkillChip('Problem Solving'),
                                  _buildSkillChip('Learning New Tech'),
                                  _buildSkillChip('Open Source'),
                                  _buildSkillChip('Internships'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: ScreenUtil().setWidth(5),
                          mainAxisSpacing: ScreenUtil().setHeight(5),
                          childAspectRatio: 1,
                        ),
                        itemCount: postImage.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[300],
                            ),
                            child: Image.asset(
                              postImage[index],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  child: Icon(
                                    Icons.image,
                                    color: Colors.grey[600],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
        ),
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(12),
        vertical: ScreenUtil().setHeight(6),
      ),
      decoration: BoxDecoration(
        color: FB_DARK_PRIMARY.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: FB_DARK_PRIMARY),
      ),
      child: CustomFont(
        text: skill,
        fontSize: ScreenUtil().setSp(12),
        color: FB_DARK_PRIMARY,
      ),
    );
  }
}