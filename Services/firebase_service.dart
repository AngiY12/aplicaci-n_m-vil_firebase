
import 'dart:developer' as developer;

import 'package:firebase/Models/Producto_Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class FirestoreServices {
  FirebaseFirestore db = FirebaseFirestore.instance;

    Future<bool> addProducto(Producto _producto) async {
    try {


      
      await db.collection("Producto").add(_producto.toJson());
      return true;
    } catch (ex) {
      developer.log(ex.toString());
      return false;
    }
  }
   
}

