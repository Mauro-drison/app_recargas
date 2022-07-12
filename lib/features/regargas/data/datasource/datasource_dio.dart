// ignore: depend_on_referenced_packages
import 'package:app_recargas/features/core/edpoint/endpoints.dart';
import 'package:app_recargas/features/regargas/data/datasource/datasource.dart';
import 'package:app_recargas/features/regargas/data/models/models_recargas.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

class RecargasDatasourceImplDio implements RecargasDatasource {
  @override
  Future<List<ModelsRecargas>> requestRecargas() async {
    Response response = await Dio().get(Endpoints.firebase_recargas);
    // ignore: avoid_print
    //print(response);
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print(" este es el resultado");

      Map data = response.data;
      // ignore: unnecessary_null_comparison
      if (data == null) return [];
      final List<ModelsRecargas> listaProductos = [];
      //manipula el mapa dando anccion a la clave valor-- en este caso asignamos el id
      data.forEach((id, trbjo) {
        //print("$id <= numero del id $data");
        final productoTemp = ModelsRecargas.fromJson(trbjo);
        productoTemp.id = id;
        listaProductos.add(productoTemp);
        //print(productoTemp.nombre);
      });
      //print(listaProductos);
      return listaProductos;
    } else {
      // ignore: avoid_print
      print("fallo la cacion");
      throw Exception(response);
    }
  }
  
  @override
  Future<Map<String, dynamic>> crearRecargas(ModelsRecargas recargas) async {
    try {
      final resp = await Dio().post(Endpoints.firebase_recargas, data: recargas.toJson());
      return {'ok': true};
    } on DioError catch (e) {
      return {'ok': false, 'mensaje': e.response};
    }
  }
  
  @override
  Future<Map<String, dynamic>> modificarRecargas(ModelsRecargas recargas) async {

    try {
      final resp = await Dio().put(Endpoints.firebase_recargas, data: recargas.toJson());

      return {'ok': true};
    } on DioError catch (e) {
      return {'ok':false, 'mesaje': e.response};
    }
  }
}