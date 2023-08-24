import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quiz_app/routes/routes_string.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/screens/widgets/elevated_button.dart';
import 'package:quiz_app/screens/widgets/text_form_field.dart';

import '../blocs/auth_bloc/auth_bloc.dart';
import '../data/services/validators.dart';

class QuizSignIn extends StatefulWidget {
  const QuizSignIn({super.key});

  @override
  State<QuizSignIn> createState() => _QuizSignInState();
}

class _QuizSignInState extends State<QuizSignIn> {
  Validators validators = Validators();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.colorScheme3,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthenticatedState) {
                Fluttertoast.showToast(
                    backgroundColor: ColorPicker.colorScheme6,
                    textColor: ColorPicker.colorScheme5,
                    msg: 'Success');
                Navigator.pushReplacementNamed(context, RouteString.categories);
              }
              if (state is AuthErrorState) {
                Fluttertoast.showToast(
                    backgroundColor: ColorPicker.colorScheme6,
                    textColor: ColorPicker.colorScheme5,
                    msg: state.error);
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextFormField(
                          hintText: 'Email',
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) =>
                              validators.emailValidator(value!),
                        ),
                        CustomTextFormField(
                          hintText: 'Password',
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          validator: (value) =>
                              validators.passwordValidator(value!),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomElevatedButton(
                            buttonColor: ColorPicker.colorScheme1,
                            textColor: ColorPicker.colorScheme6,
                            text: "Sign in",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                final String email = emailController.text;
                                final String password = passwordController.text;
                                context
                                    .read<AuthBloc>()
                                    .add(SignInEvent(email, password));
                              }
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        const Center(
                          child: Text(
                            'Or With',
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorPicker.colorScheme4,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomElevatedButton(
                            buttonColor: ColorPicker.colorScheme6,
                            textColor: ColorPicker.colorScheme4,
                            text: "Sign in with google",
                            onPressed: () {
                              context
                                  .read<AuthBloc>()
                                  .add(const SignInWithGoogleEvent());
                            }),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomElevatedButton(
                            buttonColor: ColorPicker.colorScheme4,
                            textColor: ColorPicker.colorScheme6,
                            text: "Don't have an account?",
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, RouteString.signUp);
                            }),
                      ]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
