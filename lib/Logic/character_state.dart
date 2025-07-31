part of 'character_cubit.dart';

@immutable
sealed class CharacterState {}

final class CharacterInitial extends CharacterState {}

class CharactersLoading extends CharacterState{}
class CharactersSuccessfully extends CharacterState{
  late characterModel characters;
  CharactersSuccessfully({
    required this.characters
}){}
}
