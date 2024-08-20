import 'package:cloud_firestore/cloud_firestore.dart';

class Database{

  Future  uploadBlog( Map<String,dynamic> blogInfoMap,String id) async{
    await FirebaseFirestore.instance.collection("Blog").doc(id).set(blogInfoMap);
  }
}


