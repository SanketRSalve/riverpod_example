import 'package:ca_tdd/details_page.dart';
import 'package:ca_tdd/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick and Morty"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          final charactersAsyncValue = ref.watch(characterListProvider);
          return charactersAsyncValue.when(
            data: (characterList) {
              return ListView.builder(
                itemCount: characterList.length,
                itemBuilder: (context, index) {
                  final character = characterList[index];
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${character.id}. '),
                          Text(character.name ?? 'Dummy'),
                          Text('- ${character.species}'),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsPage(character.id ?? 0),
                            ),
                          );
                        },
                        child: Image.network(character.imageUrl ?? ''),
                      ),
                    ],
                  );
                },
              );
            },
            error: (e, st) => throw e,
            loading: () => const CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
