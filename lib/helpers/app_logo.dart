import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Image.network(
        'https://tse2.mm.bing.net/th/id/OIP.Biaq4Cdsay_X6gYlL-dxMAAAAA?pid=ImgDet&w=170&h=170&c=7&dpr=1.3&o=7&rm=3',
      ),
    );
  }
}
