


import 'package:firebase/Models/Producto_Model.dart';
import 'package:firebase/Views/Producto_card.dart';
import 'package:firebase/Views/Registro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Lista extends StatefulWidget {
  const Lista({super.key});

  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {

   final Stream<QuerySnapshot> _productosRef =
      FirebaseFirestore.instance.collection("Producto").snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _productosRef,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Ha ocurrido un error"));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Text("Descargando productos..."));
        }

        if (!snapshot.hasData) {
          return const Center(child: Text("No hay productos..."));
        }

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
              final content = document.data()! as Map<String, dynamic>;
              Producto newProducto = Producto.fromJson(content);
              return CardProducto(producto: newProducto);
            }).toList()),
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const Registro())));
              },
              child: const Icon(Icons.bakery_dining_sharp)),
        );
      },
    );
  }
}