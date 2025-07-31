import 'package:omar_ahmed_flutter/Data/Api_Services/api_serivices.dart';
import '../Models/Characters_Model.dart';

class CharactersRepo{
  late ApiServices apiServices;
  CharactersRepo(this.apiServices);

  Future<characterModel>GetAllModel()async{
     Map<String,dynamic>characters= await apiServices.GetAllCharacters();
     characterModel Characcters=characterModel.fromJson(characters);
     return Characcters;
  }
}