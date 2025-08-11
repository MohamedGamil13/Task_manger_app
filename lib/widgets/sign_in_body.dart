import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger_app/cubits/login_cubit/login_cubit.dart';
import 'package:task_manger_app/helpers/constants.dart';
import 'package:task_manger_app/pages/board_page.dart';
import 'package:task_manger_app/pages/forgot_password_page.dart';
import 'package:task_manger_app/pages/sign_up_page.dart';
import 'package:task_manger_app/widgets/horzontail_divider.dart';
import 'package:task_manger_app/widgets/custom_button.dart';
import 'package:task_manger_app/widgets/custom_text.dart';
import 'package:task_manger_app/widgets/data_list_tile.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSucess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Login successful!'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const BoardPage()),
            );
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 120),
                  const CustomText(text: 'Sign IN', fonstsize: 35),
                  const SizedBox(height: 100),

                  // Email
                  // Email
                  DataListTile(
                    icon: Icons.email,
                    title: "Email",
                    controller: _emailController,
                    isPassword: false,
                    onChanged: (value) {
                      context.read<LoginCubit>().validateEmail(value.trim());
                    },
                    errorText: state is ValidationState
                        ? state.emailError
                        : null,
                  ),

                  // Password
                  DataListTile(
                    icon: Icons.lock,
                    title: "Password",
                    controller: _passwordController,
                    isPassword: !_isPasswordVisible,
                    onTogglePasswordVisibility: () {
                      setState(() => _isPasswordVisible = !_isPasswordVisible);
                    },
                    onChanged: (value) {
                      context.read<LoginCubit>().validatePassword(value.trim());
                    },
                    errorText: state is ValidationState
                        ? state.passwordError
                        : null,
                  ),

                  // Forget password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ForgotPasswordPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Forget password?",
                        style: TextStyle(color: primarycolor),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Sign in button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CustomButton(
                      text: state is LoginLoading ? 'Signing In...' : 'Sign In',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginCubit>().signIN(
                            emailAddress: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          );
                        }
                      },
                      buttonColor: state is LoginLoading
                          ? Colors.grey
                          : primarycolor,
                    ),
                  ),

                  const SizedBox(height: 25),
                  const HorzontailDivider(),
                  const SizedBox(height: 25),

                  // Create account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Didn\'t have account? '),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignUpPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Create account",
                          style: TextStyle(color: primarycolor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
