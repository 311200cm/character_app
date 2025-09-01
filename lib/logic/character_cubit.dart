import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:omar_ahmed_flutter/data/models/characters_model.dart';
import 'package:omar_ahmed_flutter/data/repo/characters_repo.dart';
part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  late CharactersRepo charactersRepo;
  late CharacterModel characters;
  CharacterCubit(this.charactersRepo) : super(CharacterInitial());
  void getAllCharacters(){
    emit(CharactersLoading());
    charactersRepo.getAllModel().then((characters){
      this.characters=characters;
      emit(CharactersSuccessfully(characters: this.characters));
      /*
      * اللى عملته انى خليت المودل يتبعت لل state لما اتاكد انى الداتا فعلا
      * رجعت وساعتها هبقى متاكده انى المتغير اللى عرفته فى classبتاع
      * state شايله الداتا
      * وهو ده المتغير اللى هستخدمه علشان احط الداتا فى المتغير اللى معرفها
      * فى الاسكرين */
    });
    //return this.characters;
  }
}
