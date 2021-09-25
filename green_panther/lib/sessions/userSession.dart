import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:green_panther/models/user_model.dart';
import 'package:green_panther/singleton.dart' as singleton;

class UserSession {
  CollectionReference userCollection =
  FirebaseFirestore.instance.collection("userCollection");
  CollectionReference postCollection =
  FirebaseFirestore.instance.collection("itemCollection");

  Future<String> pushNewUser(User userData) async {
    Map<String, dynamic> userItemData = userData.toJson();
   await userCollection.doc(singleton.currentUser!.uid.toString()).set(userItemData);
    return singleton.currentUser.toString();
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


  Future pushUpdateUser(String userId) async {

    List tagsList = [];

    try {
      await postCollection.where('whoAdded',isEqualTo: userId).get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          tagsList.add(element.data());

        });
      });
    } catch (e) {
      print(e.toString());

    }

  userCollection.doc(userId).update({'totalPoints' : tagsList.length+1});
  }


}
