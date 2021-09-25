import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:green_panther/models/user_model.dart';


class UserSession {
  CollectionReference userCollection =
  FirebaseFirestore.instance.collection("userCollection");


  Future<String> pushNewUser(User userData) async {
    Map<String, dynamic> userItemData = userData.toJson();
    DocumentReference doc = await userCollection.add(userItemData);
    return doc.id.toString();
  }


  Future getUser(String userId) async {

    List userData = [];

    try {
      await userCollection.where("userId",isEqualTo: userId).get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          userData.add(element.data());
          print("Element Added" + element.data().toString());
        });
      });
      return userData;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  Future getAllUsers() async {

    List userData = [];

    try {
      await userCollection.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          userData.add(element.data());
          print("Element Added" + element.data().toString());
        });
      });
      return userData;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}
