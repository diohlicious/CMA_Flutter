import 'package:cloud_firestore/cloud_firestore.dart';

class FavFirestoreService {

  dynamic data;

  Future<dynamic> fetchFav() async {

    final DocumentReference document = Firestore.instance.collection("favMenu").document('favMenu-zFdL2S8c5fir0');

    await document.get().then<dynamic>(( DocumentSnapshot snapshot) async{
      data = snapshot.data;
    });

    return data;
  }
}
