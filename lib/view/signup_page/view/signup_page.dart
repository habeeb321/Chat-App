import 'package:chat_app/core/constants.dart';
import 'package:chat_app/view/login_page/view/login_page.dart';
import 'package:chat_app/view/signup_page/controller/signup_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup Page'),
      ),
      body: Form(
        key: provider.formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<SignupController>(
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
                    child: const Text('Sign up'),
                    onPressed: () {
                      if (value.formKey.currentState!.validate()) {
                        value.formKey.currentState!.save();
                        // Implement your authentication logic here
                        value.signUp(context);
                      }
                    },
                  ),
                  kHeight10,
                  RichText(
                    text: TextSpan(
                      text: 'Already have an Account? ',
                      style: const TextStyle(color: kBlackcolor),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: const TextStyle(
                              decoration: TextDecoration.underline,
                              color: kBlueColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => nextScreen(context, const LoginPage()),
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
