import 'package:flutter/material.dart';
import '../Constant/pallete.dart';

class CustomCommentTextField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSubmit;
  const CustomCommentTextField(
      {super.key, required this.controller, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      height: 61,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Pallete.textFieldFillColor,
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const CircleAvatar(
                      backgroundColor: Pallete.textFieldFillColor,
                      backgroundImage: NetworkImage(
                          'https://www.hindustantimes.com/ht-img/img/2023/11/19/550x309/India-Cricket-WCup-362_1700416750896_1700416798373.jpg'),
                    ),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(
                        color: Pallete.textColor,
                      ),
                      controller: controller,
                      autocorrect: false,
                      autofocus: false,
                      decoration: const InputDecoration(
                          hintText: "Add a Comment...",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
                color: Pallete.buttonColor, shape: BoxShape.circle),
            child: InkWell(
              onTap: onSubmit,
              child: const Icon(
                Icons.send,
                color: Pallete.textColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
