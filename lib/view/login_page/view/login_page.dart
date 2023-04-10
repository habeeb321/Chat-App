import 'package:chat_app/core/constants.dart';
import 'package:chat_app/view/forgot_password_page/view/forgot_password.dart';
import 'package:chat_app/view/login_page/controller/login_controller.dart';
import 'package:chat_app/view/signup_page/view/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Form(
        key: provider.formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<LoginController>(
            builder: (context, value, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: value.emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onSaved: (value) {},
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: value.passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) {},
                  ),
                  kHeight10,
                  ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      if (value.formKey.currentState!.validate()) {
                        value.formKey.currentState!.save();
                        // Implement your authentication logic here
                        provider.signIn(context);
                      }
                    },
                  ),
                  kHeight10,
                  InkWell(
                    onTap: () {
                      nextScreen(context, const ForgotPasswordPage());
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: kBlueColor,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  kHeight10,
                  RichText(
                    text: TextSpan(
                      text: 'No Account? ',
                      style: const TextStyle(color: kBlackcolor),
                      children: [
                        TextSpan(
                          text: 'Register Now',
                          style: const TextStyle(
                              decoration: TextDecoration.underline,
                              color: kBlueColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => nextScreen(context, const SignUpPage()),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
