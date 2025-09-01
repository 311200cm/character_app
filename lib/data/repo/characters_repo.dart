

import '../api_services/api_serivices.dart';
import '../models/characters_model.dart';


class CharactersRepo{
  late ApiServices apiServices;
  CharactersRepo(this.apiServices);

  Future<CharacterModel>getAllModel()async{
     Map<String,dynamic>characters= await apiServices.getAllCharacters();
     CharacterModel charactersModel=CharacterModel.fromJson(characters);
     return charactersModel;
  }
}