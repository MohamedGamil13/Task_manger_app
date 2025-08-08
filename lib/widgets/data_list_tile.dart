import 'package:flutter/material.dart';

class DataListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function(String) onChanged;
  final String? errorText;
  final bool isPassword;
  final TextEditingController? controller;
  final VoidCallback? onTogglePasswordVisibility;

  const DataListTile({
    required this.icon,
    required this.title,
    required this.onChanged,
    this.errorText,
    this.isPassword = false,
    this.controller,
    this.onTogglePasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 330,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: Color(0xffe9e9e9),
                width: 1,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              controller: controller,
              validator: (data) {
                if (data == null || data.isEmpty) {
                  return "Please enter your data";
                }
                return null;
              },
              onChanged: onChanged,
              obscureText: isPassword,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                icon: Icon(icon, color: Colors.grey),
                hintText: title,
                border: InputBorder.none,
                suffixIcon: isPassword || (onTogglePasswordVisibility != null)
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
          ),
          if (errorText != null)
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 4),
              child: Text(
                errorText!,
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
