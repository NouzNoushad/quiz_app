import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quiz_app/data/services/validators.dart';
import 'package:quiz_app/routes/routes_string.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/screens/widgets/elevated_button.dart';
import 'package:quiz_app/screens/widgets/text_form_field.dart';

import '../blocs/auth_bloc/auth_bloc.dart';

class QuizSignUp extends StatefulWidget {
  const QuizSignUp({super.key});

  @override
  State<QuizSignUp> createState() => _QuizSignUpState();
}

class _QuizSignUpState extends State<QuizSignUp> {
  final Validators validators = Validators();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.colorScheme3,
      body: SafeArea(
        child: Center(
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
                if (state is AuthLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: ColorPicker.colorScheme3,
                      color: ColorPicker.colorScheme1,
                    ),
                  );
                }
                if (state is UnAuthenticatedState) {
                  return SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              hintText: 'Name',
                              controller: fullNameController,
                              keyboardType: TextInputType.name,
                              validator: (value) =>
                                  validators.nameValidator(value!),
                            ),
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
                              obscureText: true,
                              validator: (value) =>
                                  validators.passwordValidator(value!),
                            ),
                            CustomTextFormField(
                              hintText: 'Confirm Password',
                              controller: confirmPasswordController,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              validator: (value) =>
                                  validators.confirmPasswordValidator(
                                      value!, passwordController.text),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomElevatedButton(
                                buttonColor: ColorPicker.colorScheme1,
                                textColor: ColorPicker.colorScheme6,
                                text: "Sign up",
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    String name = fullNameController.text;
                                    String email = emailController.text;
                                    String password = passwordController.text;
                                    context.read<AuthBloc>().add(
                                        SignUpEvent(name, email, password));
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
                                text: "Sign up with google",
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
                                text: "Already have an account?",
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, RouteString.signIn);
                                }),
                          ]),
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
