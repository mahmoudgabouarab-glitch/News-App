import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_color.dart';

class CategoryNews extends StatefulWidget {
  const CategoryNews({super.key});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  int isActive = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final title = categories[index];

          return GestureDetector(
            onTap: () {
              setState(() {
                isActive = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: isActive == index ? AppColor.textThrird : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  color: isActive == index ? Colors.white : Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

List<String> categories = [
  "All",
  "Science",
  "Health",
  "Culture",
  "Culture",
  "Culture",
  "Culture",
  "Culture",
];
