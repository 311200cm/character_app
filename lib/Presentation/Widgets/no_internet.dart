import 'package:flutter/material.dart';
import 'package:omar_ahmed_flutter/constants/colors.dart';

import '../../constants/strings.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Can not connected,cheak internet",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.MyGrey,
            ),
            ),
            Image.asset(NoInternetConnection),
          ],
        ),
      ),
    );
  }
}
