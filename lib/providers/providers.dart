import 'package:ca_tdd/data/character_model.dart';
import 'package:ca_tdd/data/repository_impl.dart';
import 'package:ca_tdd/data/service.dart';

import 'package:ca_tdd/domain/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

final characterRepoProvider = Provider<CharacterRepo>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return CharacterRepoImpl(apiService);
});

final characterListProvider = FutureProvider<List<CharacterModel>>((ref) {
  final repository = ref.read(characterRepoProvider);
  return repository.getAllCharacter();
});

final singleCharacterProvider =
    FutureProvider.family<CharacterModel, int>((ref, id) {
  final repository = ref.read(characterRepoProvider);
  return repository.getCharacterDetails(id);
});
