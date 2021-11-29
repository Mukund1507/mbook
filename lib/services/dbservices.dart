import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mbook/models/theatre.dart';

class DbServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<List<Theatre>> getTheatres() async {
    List<Theatre> listOfTheatres = [];
    final theatres = await _firebaseFirestore.collection('theatre').get();
    final th = theatres.docs.asMap();
    for (int i = 0; i < theatres.docs.length; i++) {
      Theatre temp = Theatre(
          id: th[i]!['id'], name: th[i]!['name'], address: th[i]!['address']);
      listOfTheatres.add(temp);
    }
    return listOfTheatres;
  }
}
