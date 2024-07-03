import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/Constant/pallete.dart';
import 'package:instagram_clone_flutter/Services/auth_service.dart';
import 'package:instagram_clone_flutter/Widgets/custom_elevated_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Username',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Pallete.textColor,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              size: 30,
            ),
            color: Pallete.textColor,
            onPressed: () async {
              await AuthServiceImpl().signOut();
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.menu,
              size: 30,
            ),
            color: Pallete.textColor,
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Pallete.textFieldFillColor,
                  backgroundImage: NetworkImage(
                    'https://middaycdn.s.llnwi.net/Radiocity-images/images/uploads/web-stories/viratkohlit20worldcuptrophy_ws.jpg',
                  ),
                  radius: 40,
                ),
                Column(
                  children: [
                    Text(
                      '2',
                      style: TextStyle(
                        color: Pallete.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'posts',
                      style: TextStyle(
                        color: Pallete.textColor,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '256',
                      style: TextStyle(
                        color: Pallete.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'followers',
                      style: TextStyle(
                        color: Pallete.textColor,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '196',
                      style: TextStyle(
                        color: Pallete.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'following',
                      style: TextStyle(
                        color: Pallete.textColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Abinash Karki',
              style: TextStyle(
                color: Pallete.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Front-end, back-end, I speak the Code rythm.',
              maxLines: 5,
              style: TextStyle(
                color: Pallete.textColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 185,
                  child: CustomElevatedButton(
                    text: 'Edit Profile',
                    onPressed: () {},
                    buttonColor: Pallete.textFieldFillColor,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 185,
                  child: CustomElevatedButton(
                    text: 'Share Profile',
                    onPressed: () {},
                    buttonColor: Pallete.textFieldFillColor,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
