import 'package:app_recargas/features/regargas/data/repository/recarga_repositori_imple.dart';
import 'package:app_recargas/features/regargas/domain/repository/recarga_repository.dart';
import 'package:app_recargas/features/regargas/presentation/riverpod/provider.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'features/regargas/data/datasource/datasource_dio.dart';

final recargaRepository = Provider<RecargaRepository>(
  (ref) =>  RecargaRepositoryImple(RecargasDatasourceImplDio()),
);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: ArticleList(),
        ),
      ),
    );
  }
}

class ArticleList extends HookConsumerWidget {
  const ArticleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final article = ref.watch(recargas);
    return article.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Text('Error: $err'),
        data: (articles) {
          return Flexible(
            child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: Text(articles[index].nombre),
                      subtitle: Row(
                        children: [
                          const Icon(Icons.thumb_up),
                          Text(" ${articles[index].total}")
                        ],
                      ));
                }),
          );
        });
  }
}