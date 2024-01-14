import 'package:ca_tdd/data/service.dart';
import 'package:ca_tdd/domain/repository.dart';
import 'character_model.dart';

class CharacterRepoImpl implements CharacterRepo {
  final ApiService apiService;

  CharacterRepoImpl(this.apiService);

  @override
  Future<List<CharacterModel>> getAllCharacter() async {
    final List<CharacterModel> characterModels =
        await apiService.fetchCharacters();
    return characterModels;
  }

  @override
  Future<CharacterModel> getCharacterDetails(int id) async {
    final CharacterModel character = await apiService.fetchSingleCharacter(id);
    return character;
  }
}
