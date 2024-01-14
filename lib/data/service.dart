import 'package:ca_tdd/data/character_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();
  Future<List<CharacterModel>> fetchCharacters() async {
    try {
      final Response<Map<String, dynamic>> response =
          await dio.get('https://rickandmortyapi.com/api/character');
      if (response.statusCode == 200) {
        final List<dynamic> results = response.data!['results'];
        final List<CharacterModel> characters =
            results.map((map) => CharacterModel.fromJson(map)).toList();
        return characters;
      } else {
        throw DioException(requestOptions: response.requestOptions);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<CharacterModel> fetchSingleCharacter(int id) async {
    try {
      final Response<Map<String, dynamic>> response = await dio.get(
          'https://rickandmortyapi.com/api/character/$id',
          queryParameters: {'id': id});
      if (response.statusCode == 200) {
        final Map<String, dynamic> characterData = response.data!;
        final CharacterModel character = CharacterModel.fromJson(characterData);
        return character;
      } else {
        throw DioException(requestOptions: response.requestOptions);
      }
    } catch (e) {
      throw e;
    }
  }
}
