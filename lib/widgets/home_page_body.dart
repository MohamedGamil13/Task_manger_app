import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger_app/cubits/cubit/login_cubit.dart';
import 'package:task_manger_app/helpers/app_signture.dart';
import 'package:task_manger_app/widgets/custom_list_tile.dart';
import 'package:task_manger_app/widgets/custom_text.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {},
      child: Column(
        children: [
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.only(left: 80.0),
            child: AppSignture(fontSize: 50, logoHeight: 65),
          ),
          SizedBox(height: 100),
          CustomText(text: 'Manage'),
          CustomText(text: 'your task easily'),
          Text("Easy way to manage your tasks "),
          SizedBox(height: 85),
          CustomListTile(
            image:
                'https://w7.pngwing.com/pngs/523/198/png-transparent-google-logo-google-search-google-play-google-text-logo-number-thumbnail.png',
            onpressed: BlocProvider.of<LoginCubit>(context).signInWithGoogle,
          ),
          CustomListTile(
            image:
                'https://logos-world.net/wp-content/uploads/2020/05/Facebook-Logo.jpg',
            onpressed: () {},
          ),
        ],
      ),
    );
  }
}
