import 'package:flutter/material.dart';

import 'package:omar_ahmed_flutter/constants/colors.dart';

import '../../data/models/characters_model.dart';

class SliversAppBar extends StatelessWidget {
  Results character;
   SliversAppBar({super.key,required this.character});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(character.name!,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color:AppColors.myWhite
          ),
        ),
        background: Hero(
          /*
          * استخدمت hero هنا علشان هو هيعمل انيميشن وهو بينقل من الاسكرين
          * الاولى للاسكرين التانيه فلازم احددله اثر الانيميشن
          * هيظهر فين فى الاسكرين الاولى وفين فى الاسكرين التانيه*/
            tag: character.id!,
            child: Image.network(character.image!,
              fit: BoxFit.cover,
            ),
        ),
      ),
      stretch: true,
      pinned: true,
      expandedHeight: 500,//طول الصوره
    );
  }
}
