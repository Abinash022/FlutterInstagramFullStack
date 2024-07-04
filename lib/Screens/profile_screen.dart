import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/Constant/pallete.dart';
import 'package:instagram_clone_flutter/Services/auth_service.dart';
import 'package:instagram_clone_flutter/Widgets/custom_elevated_button.dart';
import 'package:instagram_clone_flutter/providers.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int postLength = 0;
  int followers = 0;
  int following = 0;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    // fetching the post length
    final snap = await FirebaseFirestore.instance
        .collection('Posts')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    // fetch the followers and following
    final userSnap = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    postLength = snap.docs.length;
    followers = userSnap.data()!['followers'].length;
    following = userSnap.data()!['following'].length;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.username,
          style: const TextStyle(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Pallete.textFieldFillColor,
                  backgroundImage: NetworkImage(
                    user.photoURL,
                  ),
                  radius: 40,
                ),
                Column(
                  children: [
                    Text(
                      postLength.toString(),
                      style: const TextStyle(
                        color: Pallete.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
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
                      followers.toString(),
                      style: const TextStyle(
                        color: Pallete.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
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
                      following.toString(),
                      style: const TextStyle(
                        color: Pallete.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
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
            Text(
              user.username,
              style: const TextStyle(
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
            const Divider(),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Posts')
                  .where('uid',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container(
                  color: Colors.black,
                  child: GridView.builder(
                    controller: ScrollController(),
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                    itemBuilder: (_, index) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              snapshot.data!.docs[index]['postURL'],
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    itemCount: snapshot.data!.docs.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
