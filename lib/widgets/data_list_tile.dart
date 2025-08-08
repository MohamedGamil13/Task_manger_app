import 'package:flutter/material.dart';

class DataListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function(String) onChanged;

  const DataListTile({
    required this.icon,
    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 330,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Color(0xffe9e9e9)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: TextFormField(
          validator: (data) {
            if (data == null || data.isEmpty) {
              return "Please enter your data";
            }
            return null;
          },
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(20),
            icon: Icon(icon, color: Colors.grey),
            hintText: title,
            border: InputBorder.none,
          ),
          obscureText: title.toLowerCase().contains("password"),
        ),
      ),
    );
  }
}
