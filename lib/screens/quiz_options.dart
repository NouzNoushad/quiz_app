import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quiz_app/data/services/quiz_service.dart';
import 'package:quiz_app/routes/routes_string.dart';

import '../blocs/quiz_bloc/quiz_bloc.dart';
import '../data/models/quiz_response.dart';
import '../utils/colors.dart';

class QuizOptions extends StatefulWidget {
  final List<QuizResponse> response;
  const QuizOptions({super.key, required this.response});

  @override
  State<QuizOptions> createState() => _QuizOptionsState();
}

class _QuizOptionsState extends State<QuizOptions> {
  QuizService quizService = QuizService();
  int selectedOption = 0;
  int optionIndex = -1;

  @override
  void initState() {
    quizService.arrangeQuiz(widget.response);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(quizService),
      child: BlocConsumer<QuizBloc, QuizState>(
        listener: (context, state) {
          if (state is QuizFinishedState) {
            Fluttertoast.showToast(msg: 'score ${state.score}');
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, RouteString.categories);
          }
        },
        builder: (BuildContext context, state) {
          if (state is QuizOnGoingState) {
            return Scaffold(
              backgroundColor: ColorPicker.colorScheme3,
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Quiz: ${state.currentIndex + 1} / 10',
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                            color: ColorPicker.colorScheme4,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Flexible(
                          child: Text(
                            state.currentQuestion,
                            style: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                              color: ColorPicker.colorScheme4,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var option = state.options[index];

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedOption = index;
                                  optionIndex = index;
                                });
                              },
                              child: Card(
                                color: optionIndex == index
                                    ? ColorPicker.colorScheme1
                                    : ColorPicker.colorScheme4,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  child: Text(
                                    option,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: ColorPicker.colorScheme6,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemCount: state.options.length),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorPicker.colorScheme4,
                              ),
                              child: const Text(
                                'Finish',
                              )),
                          ElevatedButton(
                              onPressed: () {
                                if (state.currentIndex <= 8) {
                                  int selectedIndex = selectedOption;
                                  selectedOption = -1;
                                  optionIndex = -1;
                                  context
                                      .read<QuizBloc>()
                                      .add(QuizNextEvent(selectedIndex));
                                } else {
                                  context
                                      .read<QuizBloc>()
                                      .add(QuizFinishedEvent(selectedOption));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorPicker.colorScheme1,
                              ),
                              child: const Text(
                                'Next',
                              )),
                        ],
                      )),
                ]),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
