
import 'package:app_recargas/features/regargas/data/models/models_recargas.dart';
import 'package:app_recargas/features/regargas/domain/entities/entities_recargas.dart';
import 'package:app_recargas/features/regargas/domain/repository/recarga_repository.dart';

class GetRecargas {
  final RecargaRepository  recargasRepository;

  GetRecargas(this.recargasRepository);

  Future<List<Recargas>> getRecarga() {
    return recargasRepository.getRecarga();
  }
  
}

class CrearRecargas {
  final RecargaRepository recargaRepository;

  CrearRecargas(this.recargaRepository);

  Future<Map<String, dynamic>> crearRecargas(ModelsRecargas recargas) {
    return recargaRepository.crearRecarga(recargas);
  }
}

class ModificarRecargas {
  final RecargaRepository recargaRepository;

  ModificarRecargas(this.recargaRepository);

  Future<Map<String, dynamic>> modificarRecargas(ModelsRecargas recargas) {
    return recargaRepository.modificarRecarga(recargas);
  }
}


