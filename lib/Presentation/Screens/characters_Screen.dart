import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:omar_ahmed_flutter/Data/Models/Characters_Model.dart';
import 'package:omar_ahmed_flutter/Logic/character_cubit.dart';
import 'package:omar_ahmed_flutter/constants/colors.dart';

import '../Widgets/List_Of_Characters.dart';
import '../Widgets/no_internet.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  TextEditingController SearchTextController=TextEditingController();
  bool IsSearch=false;
  List<Results>SearchCharacters=[];
  characterModel ?AllCharacters;
  void initState(){
    super.initState();
    BlocProvider.of<CharacterCubit>(context).GetAllCharacters();
    //السطر اللى فوق ده علشان اعرفه انوا cubit اللى عملته ده هو اللى هستخدمه طول الابلكيشن مش هعمل واحد تانى
  /*
  * هنا هو نادي الداله بس لسه مرجعش المودل لانها داله future فهتاخد وقت
  * فانا كانى بقولوا ناديها وخلصها ولما اتاكد انو خلصها ساعتها هحط الداتا فى المتغير
  * اللى عرفته
  * طب هعرف امتى انه خلص ؟ لما تبقي state هى success
  * ساعتها يبقى راجع الداتا
  * واجيب الداتا من المتغير اللى متعرف فى state*/
  }
  //خلينا الداله ترجع list of widget علشان هناديها تحت فى action وهو بياخد list
  List<Widget>ActionIconsOfAppBar(){
    if(IsSearch==false){
      return [
        IconButton(onPressed: (){
          IsSearch=true;
          ModalRoute.of(context)!
              .addLocalHistoryEntry(LocalHistoryEntry(
            onRemove: StopSearch
          ));
          /*
          * الجمله دى معناها انى هتعامل مع text field اللى مفروض يظهر
          * لما اضغط على search وكانه اسكرين ليها route وانا
         * هروح ليها يعنى كانى عملت
         * navigator .push
         * والداله اللى هناديها فى on remove كانى بقول ايه اللى عايزه يحصل
         * لما يمسح route ده ويرجع لل app bar العادى*/
          setState(() {
          });
        },
            icon: Icon(Icons.search,color: AppColors.MyGrey,)
        )
      ];
    }
    else{
      return [
        IconButton(onPressed: (){
          setState(() {
            IsSearch=false;
            Navigator.pop(context);
            SearchTextController.clear();
          });
        },
            icon: Icon(Icons.clear,color: AppColors.MyGrey,)
        )
      ];
    }
  }

  void StopSearch(){
    SearchTextController.clear();
    setState(() {
     IsSearch=false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:IsSearch?SearchTextField():
        AppBarWithOutSearch(),
        backgroundColor: AppColors.MyYello,
        actions:ActionIconsOfAppBar(),
        leading: Icon(Icons.arrow_back,
        color: AppColors.MyGrey,
        ),
      ),
      body: BlocBuilder<CharacterCubit,CharacterState>(
          builder:(context,state){
            if(state is CharactersSuccessfully){
              AllCharacters=(state).characters;
              //print(SearchTextController.text.isNotEmpty);
              return OfflineBuilder(
                  connectivityBuilder: (
                      BuildContext context,
                      List<ConnectivityResult> connectivity,
                      Widget child,
                      ) {
                    final bool connected = !connectivity.contains(ConnectivityResult.none);
                    if(connected){
                      return   ListOfCharacters(
                        character: SearchTextController.text.isNotEmpty?
                        SearchCharacters:
                        AllCharacters!.results!
                        ,);
                    }
                    else{
                     return NoInternet();
                    }
                  },
                  child: Center(
              child: CircularProgressIndicator(
              color: AppColors.MyYello,
              ),
            ) ,
              );
            }
            else{
              return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.MyYello,
                  ),
              );
            }
          }
      ),
    );
  }

  Widget AppBarWithOutSearch(){
    return  Text("Characters",
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.MyGrey
      ),
    );
  }

  Widget SearchTextField(){
    return TextFormField(
      controller:SearchTextController,
      cursorColor: AppColors.MyGrey,
      decoration: InputDecoration(
        hintText: "Find a Character....",
        hintStyle: TextStyle(
            fontSize: 16,
            color: AppColors.MyGrey
        ),
      ),
      style: TextStyle(
          fontSize: 16,
          color: AppColors.MyGrey
      ),
      onChanged: (searchelement){
        FilterCharactersBySearchElement(searchelement);
      },
    );
  }
  void FilterCharactersBySearchElement(String searchelement){
    SearchCharacters= AllCharacters!.results!.where(
            (character)=>character.name!.toLowerCase()
            .startsWith(searchelement)).toList();
    setState(() {

    });
  }
}
