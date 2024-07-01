import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/Constant/pallete.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.black,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: Container(
                width: double.infinity - 30,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Pallete.textFieldFillColor,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Pallete.textColor.withOpacity(0.5)),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Pallete.textColor.withOpacity(0.8),
                    ),
                  ),
                  style: const TextStyle(color: Pallete.textColor),
                  cursorColor: Pallete.textColor.withOpacity(0.3),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: GridView.builder(
                controller: ScrollController(),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 2),
                itemBuilder: (_, index) => Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          'https://cdn.pixabay.com/photo/2024/01/31/19/25/sunset-8544672_1280.jpg',
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                itemCount: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
