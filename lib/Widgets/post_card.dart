import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/Constant/pallete.dart';
import 'package:readmore/readmore.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 20, // Adjust the radius as needed
                backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqQB8FJX8bON8CG692N-xIAKCyZyd_SMGPWw&s',
                ),
                backgroundColor: Pallete.textFieldFillColor,
              ),
              SizedBox(width: 10),
              Text(
                'Username ',
                style: TextStyle(
                  color: Pallete.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Spacer(),
              IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Pallete.textColor,
                  ),
                  onPressed: null),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            color: Pallete.textFieldFillColor,
            height: 470,
            width: double.infinity,
            child: const Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images.pexels.com/photos/2086622/pexels-photo-2086622.jpeg?auto=compress&cs=tinysrgb&w=800')),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: Pallete.textColor,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'Assets/Images/comment.png',
                  color: Pallete.textColor,
                  scale: 20,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'Assets/Images/share.png',
                  color: Pallete.textColor,
                  scale: 20,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'Assets/Images/bookmark.png',
                  color: Pallete.textColor,
                  scale: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          const Text(
            '10,450 likes',
            style: TextStyle(
              color: Pallete.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          ReadMoreText(
            'This is a sample text with a #hashtag, a mention <@123>, and a URL: https://example.com. This is a sample text with a #hashtag, a mention <@123>, and a URL: https://example.com.This is a sample text with a #hashtag, a mention <@123>, and a URL: https://example.com.',
            trimMode: TrimMode.Line,
            trimLines: 2,
            colorClickableText: Colors.grey,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            annotations: [
              Annotation(
                regExp: RegExp(r'#([a-zA-Z0-9_]+)'),
                spanBuilder: ({required String text, TextStyle? textStyle}) =>
                    TextSpan(
                  text: text,
                  style: textStyle?.copyWith(color: Colors.blue),
                ),
              ),
            ],
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Pallete.textColor,
            ),
            moreStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
