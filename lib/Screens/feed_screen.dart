import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/Constant/pallete.dart';
import 'package:instagram_clone_flutter/Widgets/post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'Assets/Images/Instagram Logo (1).png',
          scale: 1.5,
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_outline_rounded,
              color: Pallete.textColor,
              size: 25,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              color: Pallete.textColor,
              scale: 22,
              'Assets/Images/chat (2).png',
            ),
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return const PostCard();
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: 10,
      ),
    );
  }
}
