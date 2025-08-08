import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger_app/cubits/login_cubit/login_cubit.dart';
import 'package:task_manger_app/helpers/constants.dart';
import 'package:task_manger_app/pages/Board_page.dart';
import 'package:task_manger_app/widgets/custom_button.dart';
import 'package:task_manger_app/widgets/custom_text.dart';
import 'package:task_manger_app/widgets/data_list_tile.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
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
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSucess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Account created successfully!'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context);
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
                  Center(child: CustomText(text: 'Sign UP', fonstsize: 35)),
                  const SizedBox(height: 60),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DataListTile(
                      icon: Icons.lock_outline,
                      title: "Confirm Password",
                      controller: _confirmPasswordController,
                      errorText: null,
                      isPassword: !_isConfirmPasswordVisible,
                      onChanged: (_) {
                        setState(() {});
                      },
                      onTogglePasswordVisibility: () {
                        setState(() {
                          _isConfirmPasswordVisible =
                              !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CustomButton(
                      text: state is LoginLoading ? 'Creating...' : 'Sign Up',
                      onTap: () {
                        _handleSignUp(context);
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String? _getEmailError(LoginState state) {
    if (state is ValidationState) return state.emailError;
    return null;
  }

  String? _getPasswordError(LoginState state) {
    if (state is ValidationState) return state.passwordError;
    return null;
  }

  String? _getConfirmPasswordError() {
    final password = _passwordController.text;
    final confirm = _confirmPasswordController.text;
    if (confirm.isEmpty) return 'Please confirm your password';
    if (confirm != password) return 'Passwords do not match';
    return null;
  }

  void _handleSignUp(BuildContext context) {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    context.read<LoginCubit>().validateForm(email, password);

    final currentState = context.read<LoginCubit>().state;
    final isFormValid =
        currentState is ValidationState && currentState.isFormValid;
    final confirmError = _getConfirmPasswordError();

    if (isFormValid && confirmError == null) {
      context.read<LoginCubit>().signUp(
        emailAddress: email,
        password: password,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fix the validation errors'),
          backgroundColor: Colors.orange,
        ),
      );
      setState(() {});
    }
  }
}
