import 'package:flutter/material.dart';

import 'package:omar_ahmed_flutter/constants/colors.dart';

import '../widgets/sliver_list_item.dart';
import '../widgets/slivers_app_bar.dart';



class CharacterDetailsScreen extends StatelessWidget {
  final character;
   CharacterDetailsScreen({super.key,required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myGrey,
      body: CustomScrollView(
        slivers: [
          SliversAppBar(character: character,),
          //الداله دى هتكون مسؤوله عن الصوره والاسم اللى عليها
          SliverListItem(character: character,)
 //دى السؤوله عن المنيو اللى هيبقى مكتوب فيها البيانات وهتتحرك لفوق لحد ما تملى الشاشه
        ],
      ),
    );
  }
}
