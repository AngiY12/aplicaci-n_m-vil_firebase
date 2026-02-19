
import 'package:firebase/Models/Producto_Model.dart';
import 'package:firebase/Services/firebase_service.dart';
import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {


  final Producto _model = Producto.init();
  final _formKey = GlobalKey<FormState>();
  bool _onSaving = false;

 String? _validateName(String value) {
    if (value.isEmpty) {
      return "El nombre no puede ser vacío";
    }
    
    return null;
  }

  String? _validateDescripcion(String value) {
    if (value.isEmpty) {
      return "La descripción no puede ser vacío";
    }
    
    return null;
  }

   _saveForm() async {
    //Método para enviar el modelo a la collection
    //Validacion del formulario Form
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _onSaving = true;
    setState(() {});

    //Guardado del formulario Form
    _formKey.currentState!
        .save(); //Se ejecutan los métodos onSaved de los TextFormField

    

    final FirestoreServices service = FirestoreServices();
    service.addProducto(_model).then((value) {
      if (value) {
        Navigator.pop(_formKey.currentContext!);
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registro de nuevo Producto")),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 14.0, horizontal: 7.0),
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 50.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Text("Nuevo producto",
                                style: Theme.of(context).textTheme.headlineMedium),
                          ),
                          
                        ])),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) => _validateName(value!),
                          onSaved: (value) => _model.nombre = value,
                          maxLength: 75,
                          decoration: const InputDecoration(
                              hintText: "Ingrese el nombre",
                              prefixIcon: Icon(Icons.food_bank)),
                        ),
                        TextFormField(
                          validator: (value) => _validateDescripcion(value!),
                          onSaved: (value) => _model.descripcion = value,
                          maxLength: 10,
                          decoration: const InputDecoration(
                              hintText: "Ingrese a descripcion",
                              prefixIcon: Icon(Icons.money)),
                        ),
                        
                       
                        
                       
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          child: _onSaving
                              ? const CircularProgressIndicator()
                              : ElevatedButton(
                                  onPressed: _saveForm,
                                  child: const Text("Guardar")),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}