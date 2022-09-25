import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//variaveis
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
User? currentUser = FirebaseAuth.instance.currentUser;

//coleções
const collectionUser = "users";