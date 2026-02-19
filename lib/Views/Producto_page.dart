
import 'package:firebase/Models/Producto_Model.dart';
import 'package:flutter/material.dart';



class ProductoPage extends StatelessWidget {
  const ProductoPage({super.key, required this.producto});
  final Producto producto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(producto.nombre.toString())),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(producto.nombre.toString(),
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
              Text(producto.descripcion.toString()),
            ],
          ),
        ),
      ),
    );
  }
}