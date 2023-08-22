import 'package:flutter/material.dart';
import 'package:quiz_app/repositories/validators.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/widgets/elevated_button.dart';
import 'package:quiz_app/widgets/text_form_field.dart';

class QuizSignUp extends StatelessWidget {
  const QuizSignUp({super.key});
  static Validators validators = Validators();
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static TextEditingController fullNameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.colorScheme3,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      hintText: 'Name',
                      controller: fullNameController,
                      keyboardType: TextInputType.name,
                      validator: (value) => validators.nameValidator(value!),
                    ),
                    CustomTextFormField(
                      hintText: 'Email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => validators.nameValidator(value!),
                    ),
                    CustomTextFormField(
                      hintText: 'Password',
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      validator: (value) => validators.nameValidator(value!),
                    ),
                    CustomTextFormField(
                      hintText: 'Confirm Password',
                      controller: confirmPasswordController,
                      keyboardType: TextInputType.text,
                      validator: (value) => validators.nameValidator(value!),
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
                        onPressed: () {}),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomElevatedButton(
                        buttonColor: ColorPicker.colorScheme4,
                        textColor: ColorPicker.colorScheme6,
                        text: "Already have an account?",
                        onPressed: () {}),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
