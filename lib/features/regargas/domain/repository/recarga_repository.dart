
import 'package:app_recargas/features/regargas/data/models/models_recargas.dart';
import 'package:app_recargas/features/regargas/domain/entities/entities_recargas.dart';

abstract class RecargaRepository {
  Future<List<Recargas>> getRecarga();
  Future<Map<String, dynamic>> crearRecarga(ModelsRecargas recargas);
  Future<Map<String, dynamic>> modificarRecarga(ModelsRecargas recargas);
}