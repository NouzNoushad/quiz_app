import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/blocs/mode_bloc/mode_bloc.dart';
import 'package:quiz_app/data/models/quiz_category.dart';
import 'package:quiz_app/routes/routes_string.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/utils/extension.dart';

import '../utils/constants.dart';
import 'widgets/elevated_button.dart';

class QuizMode extends StatelessWidget {
  final int categoryIndex;
  const QuizMode({super.key, required this.categoryIndex});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ModeBloc()..add(ModeInitialEvent(categoryIndex)),
      child: BlocConsumer<ModeBloc, ModeState>(
        listener: (context, state) {
          if (state is ModeSelectedState) {
            Navigator.pushNamed(context, RouteString.questions, arguments: QuestionModel(mode: state.mode, category: state.category) );
          }
        },
        builder: (context, state) {
          if (state is CategoryLoadedState) {
            QuizCategory quizCategory = quizCategories[state.categoryIndex];
            return Scaffold(
              backgroundColor: ColorPicker.colorScheme3,
              appBar: AppBar(
                backgroundColor: ColorPicker.colorScheme4,
                title: Text(quizCategory.title),
                centerTitle: true,
              ),
              body: SafeArea(
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          modes.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: CustomElevatedButton(
                              text: modes[index].capitalize(),
                              onPressed: () {
                                context.read<ModeBloc>().add(ModeSelectedEvent(
                                    quizCategory.category, modes[index]));
                              },
                              buttonColor: ColorPicker.colorScheme4,
                              overlayColor: ColorPicker.colorScheme1,
                              textColor: ColorPicker.colorScheme6,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
