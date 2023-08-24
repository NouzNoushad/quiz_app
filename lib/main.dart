import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:quiz_app/data/repositories/auth_repository.dart';
import 'package:quiz_app/routes/quiz_routes.dart';
import 'package:quiz_app/routes/routes_string.dart';
import 'package:quiz_app/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
                authRepository: RepositoryProvider.of<AuthRepository>(context)),
          ),
        ],
        child: MaterialApp(
          title: 'Quiz App',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: ColorPicker.primarySwatch),
            // useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: QuizRoutes.onGenerateRoute,
          initialRoute: RouteString.categories,
        ),
      ),
    );
  }
}
