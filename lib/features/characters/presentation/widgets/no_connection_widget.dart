import 'package:flutter/material.dart';
import 'package:rickandmorty/core/utils/app_colors.dart';

class NoConnectionWidget extends StatelessWidget {
  const NoConnectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'No Internet Connection',
          style: TextStyle(color: Colors.red, fontSize: 25),
        ),
        const SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/images/offline.png',
            color: AppColors.whiteColor,
            width: 200,
          ),
        ),
      ],
    );
  }
}
