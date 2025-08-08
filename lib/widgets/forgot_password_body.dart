import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger_app/cubits/login_cubit/login_cubit.dart';
import 'package:task_manger_app/helpers/constants.dart';
import 'package:task_manger_app/widgets/custom_button.dart';
import 'package:task_manger_app/widgets/custom_text.dart';
import 'package:task_manger_app/widgets/data_list_tile.dart';

class ForgotPasswordBody extends StatefulWidget {
  const ForgotPasswordBody({super.key});

  @override
  State<ForgotPasswordBody> createState() => _ForgotPasswordBodyState();
}

class _ForgotPasswordBodyState extends State<ForgotPasswordBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is PasswordResetSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Password reset email sent.'),
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
                  Center(child: CustomText(text: 'Forgot Password', fonstsize: 28)),
                  const SizedBox(height: 80),
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
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CustomButton(
                      text: state is LoginLoading ? 'Sending...' : 'Send Reset Link',
                      onTap: () => _handleSend(context),
                      buttonColor: state is LoginLoading ? Colors.grey : primarycolor,
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

  void _handleSend(BuildContext context) {
    final email = _emailController.text.trim();
    context.read<LoginCubit>().validateEmail(email);

    final currentState = context.read<LoginCubit>().state;
    final isEmailValid = currentState is ValidationState && currentState.isEmailValid;
    if (isEmailValid) {
      context.read<LoginCubit>().resetPassword(emailAddress: email);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid email'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }
}


