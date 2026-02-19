import 'dart:convert';

Producto menuFromJson(String str) => Producto.fromJson(json.decode(str));

String menuToJson(Producto data) => json.encode(data.toJson());

class Producto {

  Producto({
    this.nombre,
    this.descripcion,
    
  });

  String? nombre;
  String? descripcion;
  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
       

       
      );

  factory Producto.init() => Producto(
      nombre: "NA",
      descripcion: "NA"
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "descripcion": descripcion,
        
      };
}
