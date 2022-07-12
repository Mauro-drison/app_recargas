import 'package:app_recargas/features/regargas/domain/entities/entities_recargas.dart';

import 'dart:convert';

ModelsRecargas recargasFromJson(String str) => ModelsRecargas.fromJson(json.decode(str));

String recargasToJson(ModelsRecargas data) => json.encode(data.toJson());
class ModelsRecargas implements Recargas{
      ModelsRecargas({
        this.id="",
        this.cargoSemanl=1,
        this.fecha="",
        this.nombre="",
        this.total=0,
    });
  @override
  late int cargoSemanl;

  @override
  late String fecha;

  @override
  late String id;

  @override
  late String nombre;

  @override
  late int total;

  factory ModelsRecargas.fromJson(Map<String, dynamic> json) => ModelsRecargas(
        //id: json["id"],
        cargoSemanl: json["cargo_semanl"],
        fecha: json["fecha"],
        nombre: json["nombre"],
        total: json["total"],
    );

  Map<String, dynamic> toJson() => {
        //"id": id,
        "cargo_semanl": cargoSemanl,
        "fecha": fecha,
        "nombre": nombre,
        "total": total,
    };
}