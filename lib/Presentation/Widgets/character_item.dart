import 'package:flutter/material.dart';
import 'package:omar_ahmed_flutter/Data/Models/Characters_Model.dart';
import 'package:omar_ahmed_flutter/constants/colors.dart';
import 'package:omar_ahmed_flutter/constants/strings.dart';

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
        color: AppColors.MyWhite
      ),
      child:InkWell(
        onTap:() {
          Navigator.pushNamed(context, CharactersDetailsScreenRoute
              ,arguments:character );
          //لما كتبت argument واديتله المتغير اللى عندى انا كده باعته للاسكرين
        },
        child: Hero(
          //بستخدمها علشان اعمل انيميشن وانا بنقل من الاسكرين للتانيه
          tag: character.id!,
          child: GridTile(
              child: character.image!.isNotEmpty?FadeInImage.assetNetwork(
                  placeholder: LoadingCharacter,
                  image: character.image!,
                  width: double.infinity,
                  fit: BoxFit.cover,
              ):Image.asset(NoCharacterImage),
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
                    color: AppColors.MyWhite
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
