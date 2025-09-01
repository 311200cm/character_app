import 'package:flutter/material.dart';

import 'package:omar_ahmed_flutter/constants/colors.dart';

import '../../data/models/characters_model.dart';

class CharacterInfoAndDivider extends StatelessWidget {
  Results character;
  String keyItem;
  double endInet;
  String value;
   CharacterInfoAndDivider({super.key,required this.character,
     required this.keyItem,
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
                  text: "$keyItem : ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.myWhite
                  ),
                ),
                TextSpan(
                  text: value,
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColors.myWhite
                  ),
                ),
              ]
            )
        ),
        Divider(
          height: 30,
          thickness: 2,
          color: AppColors.myYello,
          endIndent: endInet,
          //قد ايه من divider عايزه ميبقاش ملون وبتتحسب المسافه من اليمين
        )
      ],
    );
  }
}
