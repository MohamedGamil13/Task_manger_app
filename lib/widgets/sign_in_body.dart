import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger_app/cubits/login_cubit/login_cubit.dart';
import 'package:task_manger_app/helpers/constants.dart';
import 'package:task_manger_app/pages/Board_page.dart';
import 'package:task_manger_app/widgets/Horzontail_divider.dart';
import 'package:task_manger_app/widgets/custom_button.dart';
import 'package:task_manger_app/widgets/custom_text.dart';
import 'package:task_manger_app/widgets/data_list_tile.dart';
import 'package:task_manger_app/pages/forgot_password_page.dart';
import 'package:task_manger_app/pages/sign_up_page.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSucess) {
            // Navigate to home page or show success message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login successful!'),
                backgroundColor: Colors.green,
              ),
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
                  SizedBox(height: 120),
                  Center(child: CustomText(text: 'Sign IN', fonstsize: 35)),
                  SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DataListTile(
                      icon: Icons.email,
                      title: "Email",
                      controller: _emailController,
                      errorText: _getEmailError(state),
                      onChanged: (email) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DataListTile(
                      icon: Icons.lock,
                      title: "Password",
                      controller: _passwordController,
                      errorText: _getPasswordError(state),
                      isPassword: !_isPasswordVisible,
                      onChanged: (password) {},
                      onTogglePasswordVisibility: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
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
                    ],
                  ),
                  SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CustomButton(
                      text: state is LoginLoading ? 'Signing In...' : 'Sign In',
                      onTap: () {
                        _handleSignIn(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const BoardPage()),
                        );
                      },
                      buttonColor: state is LoginLoading
                          ? Colors.grey
                          : primarycolor,
                    ),
                  ),
                  SizedBox(height: 25),
                  HorzontailDivider(),
                  SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Didn\'t have account? '),
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

  String? _getEmailError(LoginState state) {
    if (state is ValidationState) {
      return state.emailError;
    }
    return null;
  }

  String? _getPasswordError(LoginState state) {
    if (state is ValidationState) {
      return state.passwordError;
    }
    return null;
  }

  void _handleSignIn(BuildContext context) {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // Validate form
    context.read<LoginCubit>().validateForm(email, password);

    // Check if form is valid using the current state
    final currentState = context.read<LoginCubit>().state;
    if (currentState is ValidationState && currentState.isFormValid) {
      context.read<LoginCubit>().signIN(
        emailAddress: email,
        password: password,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fix the validation errors'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }
}
