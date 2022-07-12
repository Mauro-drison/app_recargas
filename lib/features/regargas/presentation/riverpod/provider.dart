import 'package:app_recargas/features/regargas/data/models/models_recargas.dart';
import 'package:app_recargas/features/regargas/domain/entities/entities_recargas.dart';
// ignore: depend_on_referenced_packages
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../main.dart';

final recargas = FutureProvider<List<Recargas>>((ref) async {
  return ref.watch(recargaRepository).getRecarga();
});

/*
final crearRecarga = FutureProvider<Map<String, dynamic>>((ref) async {
  return ref.watch(recargaRepository).crearRecarga();
});

final modificarRecarga = FutureProvider<Map<String, dynamic>>((ref) async {
  return ref.watch(recargaRepository).modificarRecarga();
});

*/