import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger_app/cubits/login_cubit/login_cubit.dart';
import 'package:task_manger_app/helpers/constants.dart';
import 'package:task_manger_app/pages/board_page.dart';
import 'package:task_manger_app/widgets/custom_button.dart';
import 'package:task_manger_app/widgets/custom_text.dart';
import 'package:task_manger_app/widgets/data_list_tile.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                content: Text('Account created successfully!'),
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
                  const CustomText(text: 'Sign UP', fonstsize: 35),
                  const SizedBox(height: 60),

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

                  // Confirm password
                  DataListTile(
                    icon: Icons.lock_outline,
                    title: "Confirm Password",
                    controller: _confirmPasswordController,
                    isPassword: !_isConfirmPasswordVisible,
                    onTogglePasswordVisibility: () {
                      setState(
                        () => _isConfirmPasswordVisible =
                            !_isConfirmPasswordVisible,
                      );
                    },
                    onChanged: (value) {
                      final matches =
                          value.trim() == _passwordController.text.trim();
                      // لو حابب تعمل فاليديشن للـ confirm داخل الكيوبت ممكن تبعته من هنا
                      // أو تسيبه يتحقق عند الضغط على الزر
                    },
                    errorText:
                        (state is ValidationState &&
                            _confirmPasswordController.text.isNotEmpty &&
                            _confirmPasswordController.text.trim() !=
                                _passwordController.text.trim())
                        ? 'Passwords do not match'
                        : null,
                  ),

                  const SizedBox(height: 20),

                  // Sign up button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CustomButton(
                      text: state is LoginLoading ? 'Creating...' : 'Sign Up',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginCubit>().signUp(
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
