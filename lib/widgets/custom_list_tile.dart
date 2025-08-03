import 'package:flutter/material.dart';
import 'package:task_manger_app/widgets/Custom_icon.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.image,
    required this.onpressed,
  });
  final String image;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 30,
            child: ListTile(
              title: Row(
                children: [
                  Text(
                    'Sign In with ',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Image.asset(image, height: 60),
                ],
              ),
              trailing: CustomIcon(
                pageicon: Icons.arrow_forward,
                onpressed: onpressed,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
