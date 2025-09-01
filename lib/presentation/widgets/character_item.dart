import 'package:flutter/material.dart';

import 'package:omar_ahmed_flutter/constants/colors.dart';
import 'package:omar_ahmed_flutter/constants/strings.dart';

import '../../data/models/characters_model.dart';

class CharacterItem extends StatelessWidget {
  Results character;
   CharacterItem({super.key,required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
     width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.myWhite
      ),
      child:InkWell(
        onTap:() {
          Navigator.pushNamed(context, charactersDetailsScreenRoute
              ,arguments:character );
          //لما كتبت argument واديتله المتغير اللى عندى انا كده باعته للاسكرين
        },
        child: Hero(
          //بستخدمها علشان اعمل انيميشن وانا بنقل من الاسكرين للتانيه
          tag: character.id!,
          child: GridTile(
              child: character.image!.isNotEmpty?FadeInImage.assetNetwork(
                  placeholder: loadingCharacter,
                  image: character.image!,
                  width: double.infinity,
                  fit: BoxFit.cover,
              ):Image.asset(noCharacterImage),
              footer:Container(
                width: double.infinity,
                height: 50,
                color: Colors.black54,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(character.name!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.myWhite
                  ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ) ,
          ),
        ),
      ) ,
    );
  }
}
