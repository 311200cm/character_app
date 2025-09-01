import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar_ahmed_flutter/presentation/screens/character_details_screen.dart';
import 'package:omar_ahmed_flutter/presentation/screens/characters_screen.dart';


import 'constants/strings.dart';
import 'data/api_services/api_serivices.dart';
import 'data/repo/characters_repo.dart';
import 'logic/character_cubit.dart';

class AppRouter{
  late CharactersRepo charactersRepo;
  late CharacterCubit characterCubit;
  /*
  * عملت متغير من character cubit لانى هحتاج ابعته للاسكرين بتاعت details 
  * علشان مش هعمل bloc provider عليها فهى مش هتكون شايفه cubit وفى تفس الوقت 
  * انا محتاجه فيها فهبعتهولها كبرامتر 
  * وعرفت متغير من character repo لان charcter cubit بياخد متغير من character repo 
  * فى constructor بتاعه*/
  AppRouter(){
    charactersRepo=CharactersRepo(ApiServices());
    characterCubit=CharacterCubit(charactersRepo);
  }
  Route? generateRoute(RouteSettings setteing){
    switch(setteing.name){
      case characterScreenRoute:
        return MaterialPageRoute(builder: (_)=>BlocProvider(
    create: (BuildContext context)=>CharacterCubit(charactersRepo),
        child: CharactersScreen(),
    ));
      case charactersDetailsScreenRoute:
        /*
        * السطر اللى تحت ده علشان انا محتاجه وانا رايح على الاسكرين اللى
        * هتعرض بيانات الشخصيه ابعتلها البيانات دى من list اللى عندى
        * كبرامتر فعرفت المتغير ده وهبعتهولها كبرامتر وهديلوا قمتوا
        * وانا بعمل navigator وانا بضغط على الصوره فى home علشان ينقلنى
        * للاسكرين التانيه*/
        final character= setteing.arguments ;
        return MaterialPageRoute(builder: (_)=>CharacterDetailsScreen(character:character ,));
    }
  }
}