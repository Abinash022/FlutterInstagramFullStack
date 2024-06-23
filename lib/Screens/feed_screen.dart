import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/Constant/pallete.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram',
          style: TextStyle(color: Pallete.textColor),
        ),
      ),
    );
  }
}
