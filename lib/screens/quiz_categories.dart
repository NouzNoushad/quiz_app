import 'package:flutter/material.dart';
import 'package:quiz_app/data/models/quiz_category.dart';
import 'package:quiz_app/routes/routes_string.dart';
import 'package:quiz_app/utils/colors.dart';

import '../utils/constants.dart';

class QuizCategories extends StatelessWidget {
  const QuizCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.colorScheme3,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: ColorPicker.colorScheme4,
            title: Text('Quiz Categories'),
            pinned: true,
            centerTitle: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverGrid.builder(
                itemCount: quizCategories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6),
                itemBuilder: (context, index) {
                  QuizCategory category = quizCategories[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, RouteString.modes,
                          arguments: index);
                    },
                    child: Card(
                      color: ColorPicker.colorScheme4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: Text(
                            category.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                height: 1.5,
                                color: ColorPicker.colorScheme6,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
