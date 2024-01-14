import 'package:ca_tdd/data/character_model.dart';

abstract class CharacterRepo {
  Future<List<CharacterModel>> getAllCharacter();
  Future<CharacterModel> getCharacterDetails(int id);
}
