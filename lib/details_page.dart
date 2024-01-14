import 'package:ca_tdd/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsPage extends ConsumerWidget {
  final int id;
  const DetailsPage(
    this.id, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final singlecharacterProvider = ref.watch(singleCharacterProvider(id));
    return Scaffold(
      body: singlecharacterProvider.when(
        data: (data) {
          return Center(
            child: Column(
              children: [
                Text(data.id.toString()),
                Text(data.name.toString()),
                Text(data.species.toString()),
                Image.network(data.imageUrl.toString()),
              ],
            ),
          );
        },
        error: (e, st) => throw e,
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
