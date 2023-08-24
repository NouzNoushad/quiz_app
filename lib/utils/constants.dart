import 'package:flutter/material.dart';

import '../data/models/quiz_category.dart';

Size contextSize(context) => MediaQuery.of(context).size;

final List<String> modes = [
  'easy',
  'medium',
  'hard',
];

final List<QuizCategory> quizCategories = [
  QuizCategory(
    title: 'Art and Literature',
    category: 'arts_and_literature',
  ),
  QuizCategory(
    title: 'Film and TV',
    category: 'film_and_tv',
  ),
  QuizCategory(
    title: 'Food and Drink',
    category: 'food_and_drink',
  ),
  QuizCategory(
    title: 'General Knowledge',
    category: 'general_knowledge',
  ),
  QuizCategory(
    title: 'Geography',
    category: 'geography',
  ),
  QuizCategory(
    title: 'History',
    category: 'history',
  ),
  QuizCategory(
    title: 'Music',
    category: 'music',
  ),
  QuizCategory(
    title: 'Science',
    category: 'science',
  ),
  QuizCategory(
    title: 'Society and Culture',
    category: 'society_and_culture',
  ),
  QuizCategory(
    title: 'Sports and Leisure',
    category: 'sport_and_leisure',
  ),
];
