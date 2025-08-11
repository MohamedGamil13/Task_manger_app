import 'package:flutter/material.dart';

class DataListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function(String)? onChanged;
  final String? errorText;
  final bool isPassword;
  final TextEditingController? controller;
  final VoidCallback? onTogglePasswordVisibility;
  final String? Function(String?)? validator;

  const DataListTile({
    super.key,
    required this.icon,
    required this.title,
    this.onChanged,
    this.errorText,
    this.isPassword = false,
    this.controller,
    this.onTogglePasswordVisibility,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      title: TextFormField(
        controller: controller,
        onChanged: onChanged,
        obscureText: isPassword,
        validator:
            validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your $title";
              }
              return null;
            },
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey),
          hintText: title,
          errorText: errorText,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          suffixIcon: onTogglePasswordVisibility != null
              ? IconButton(
                  icon: Icon(
                    isPassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: onTogglePasswordVisibility,
                )
              : null,
        ),
      ),
    );
  }
}
