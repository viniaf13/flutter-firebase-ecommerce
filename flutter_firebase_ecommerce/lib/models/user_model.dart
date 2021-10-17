import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;

  UserModel({this.id, this.name, this.email});

  // UserModel.fromFirestore(DocumentSnapshot snapshot) {
  //   id = snapshot.data()!['id'];
  //   name = snapshot.data()!['name'] ;
  //   email = snapshot.data()!['email'];
  // }
}
