import 'package:flutter/material.dart';
import 'package:omar_ahmed_flutter/Data/Models/Characters_Model.dart';
import 'package:omar_ahmed_flutter/constants/colors.dart';

class CharacterInfoAndDivider extends StatelessWidget {
  Results character;
  String Key;
  double endInet;
  String value;
   CharacterInfoAndDivider({super.key,required this.character,
     required this.Key,
   required this.endInet,
     required this.value
   });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text:TextSpan(
              children: [
                TextSpan(
                  text: "$Key : ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.MyWhite
                  ),
                ),
                TextSpan(
                  text: value,
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColors.MyWhite
                  ),
                ),
              ]
            )
        ),
        Divider(
          height: 30,
          thickness: 2,
          color: AppColors.MyYello,
          endIndent: endInet,
          //قد ايه من divider عايزه ميبقاش ملون وبتتحسب المسافه من اليمين
        )
      ],
    );
  }
}
