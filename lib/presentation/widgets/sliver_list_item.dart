import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../data/models/characters_model.dart';
import 'character_info_and_divider.dart';

class SliverListItem extends StatelessWidget {
  Results character;
  SliverListItem({super.key,required this.character});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate:SliverChildListDelegate(
          [
            Container(
              padding: EdgeInsets.all(14),
              color: AppColors.myGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CharacterInfoAndDivider(character: character,
                  keyItem: "Name",
                  endInet:318 ,
                   value: character.location!.name!,
                  ),
                  CharacterInfoAndDivider(character: character,
                    keyItem: "Gender",
                    endInet:318 ,
                    value: character.gender!,
                  ),
                  CharacterInfoAndDivider(character: character,
                    keyItem: "Status",
                    endInet:318 ,
                    value: character.status!,
                  ),
                  CharacterInfoAndDivider(character: character,
                    keyItem: "Number of episode",
                    endInet:220 ,
                    value: character.episode!.length.toString(),
                  ),
                  CharacterInfoAndDivider(character: character,
                    keyItem: "Species",
                    endInet:318 ,
                    value: character.species!,
                  ),
                  SizedBox(
                    height: 500,
                  )
  //عملت كده علشان يخلى list تقدر تتحرك لحد اول الاسكرين فوق لانها بتسمح بال scroll على قد العناصر اللى فيها
                ],
              ),
            )
          ]
        ) );
  }
}
