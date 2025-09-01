import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../constants/colors.dart';
import '../../data/models/characters_model.dart';
import '../../logic/character_cubit.dart';
import '../widgets/no_internet.dart';
import '../widgets/list_of_characters.dart';


class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  TextEditingController searchTextController=TextEditingController();
  bool isSearch=false;
  List<Results>searchCharacters=[];
  CharacterModel ?allCharacters;
  void initState(){
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
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
    if(isSearch==false){
      return [
        IconButton(onPressed: (){
          isSearch=true;
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
            icon: Icon(Icons.search,color: AppColors.myGrey,)
        )
      ];
    }
    else{
      return [
        IconButton(onPressed: (){
          setState(() {
            isSearch=false;
            Navigator.pop(context);
            searchTextController.clear();
          });
        },
            icon: Icon(Icons.clear,color: AppColors.myGrey,)
        )
      ];
    }
  }

  void StopSearch(){
    searchTextController.clear();
    setState(() {
     isSearch=false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:isSearch?searchTextField():
        appBarWithOutSearch(),
        backgroundColor: AppColors.myYello,
        actions:ActionIconsOfAppBar(),
        leading: Icon(Icons.arrow_back,
        color: AppColors.myGrey,
        ),
      ),
      body: BlocBuilder<CharacterCubit,CharacterState>(
          builder:(context,state){
            if(state is CharactersSuccessfully){
              allCharacters=state.characters as CharacterModel?;
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
                        character: searchTextController.text.isNotEmpty?
                        searchCharacters:
                        allCharacters!.results!
                        ,);
                    }
                    else{
                     return NoInternet();
                    }
                  },
                  child: Center(
              child: CircularProgressIndicator(
              color: AppColors.myYello,
              ),
            ) ,
              );
            }
            else{
              return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.myYello,
                  ),
              );
            }
          }
      ),
    );
  }

  Widget appBarWithOutSearch(){
    return  Text("Characters",
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.myGrey
      ),
    );
  }

  Widget searchTextField(){
    return TextFormField(
      controller:searchTextController,
      cursorColor: AppColors.myGrey,
      decoration: InputDecoration(
        hintText: "Find a Character....",
        hintStyle: TextStyle(
            fontSize: 16,
            color: AppColors.myGrey
        ),
      ),
      style: TextStyle(
          fontSize: 16,
          color: AppColors.myGrey
      ),
      onChanged: (searchelement){
        filterCharactersBySearchElement(searchelement);
      },
    );
  }
  void filterCharactersBySearchElement(String searchelement){
    searchCharacters= allCharacters!.results!.where(
            (character)=>character.name!.toLowerCase()
            .startsWith(searchelement)).toList();
    setState(() {

    });
  }
}
