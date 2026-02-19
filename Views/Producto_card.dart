
import 'package:firebase/Models/Producto_Model.dart';
import 'package:firebase/Views/Producto_page.dart';
import 'package:flutter/material.dart';

class CardProducto extends StatelessWidget {
  const CardProducto({super.key,required this.producto});
  final Producto producto;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProductoPage(producto: producto)));
        },
        title: Text(producto.nombre.toString()),
        subtitle: Text(producto.descripcion.toString(),
            style: Theme.of(context).textTheme.headlineMedium),
        trailing: Text("\$${producto.nombre}",
            style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}

