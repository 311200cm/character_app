import 'package:flutter/material.dart';
import 'package:omar_ahmed_flutter/Data/Models/Characters_Model.dart';
import 'package:omar_ahmed_flutter/constants/colors.dart';

import 'character_item.dart';

class ListOfCharacters extends StatelessWidget {
  List<Results> character;
   ListOfCharacters({super.key,required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.MyGrey,
      child: ShowCharactersOfGridView( character),
    );
  }
}
Widget ShowCharactersOfGridView(List<Results> characters){
  return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        childAspectRatio: 2/3,
          //بتستخدم علشان تحدد مسبه عرض item المكون لل grid بالنسبه لارتفاعه
      ),
      itemCount:characters!.length ,
      itemBuilder: (context,index){
        return CharacterItem(character: characters![index],);
      }
  );
}