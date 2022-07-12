import 'package:app_recargas/features/regargas/data/models/models_recargas.dart';

abstract class RecargasDatasource {
  Future<List<ModelsRecargas>> requestRecargas();
  Future<Map<String, dynamic>> crearRecargas(ModelsRecargas recargas);
  Future<Map<String, dynamic>> modificarRecargas(ModelsRecargas recargas);
}