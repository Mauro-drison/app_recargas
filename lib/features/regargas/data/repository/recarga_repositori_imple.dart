
import 'package:app_recargas/features/regargas/data/datasource/datasource.dart';
import 'package:app_recargas/features/regargas/data/models/models_recargas.dart';
// ignore: unused_import
import 'package:app_recargas/features/regargas/domain/entities/entities_recargas.dart';
import 'package:app_recargas/features/regargas/domain/repository/recarga_repository.dart';

class RecargaRepositoryImple implements RecargaRepository {
  final RecargasDatasource remoteDatasource;
  
  RecargaRepositoryImple(this.remoteDatasource);
  @override
  Future<List<ModelsRecargas>> getRecarga() {
    final recargasList = remoteDatasource.requestRecargas();
    // ignore: avoid_print
    print(recargasList);
    return recargasList; 
  }
  
  @override
  Future<Map<String, dynamic>> crearRecarga(ModelsRecargas recargas) {
    final crearRecarga = remoteDatasource.crearRecargas(recargas);
    return crearRecarga;
  }
  
  @override
  Future<Map<String, dynamic>> modificarRecarga(ModelsRecargas recargas) {
    final modificarRecarga = remoteDatasource.modificarRecargas(recargas);
    return modificarRecarga;
  }
  
}