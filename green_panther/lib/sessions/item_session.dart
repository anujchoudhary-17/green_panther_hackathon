import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:green_panther/models/item_model.dart';

class ItemSession {
  CollectionReference postCollection =
  FirebaseFirestore.instance.collection("itemCollection");

  Stream<List> postsStream(String userId) {
    Stream<QuerySnapshot> snapshot = postCollection
        .where('whoAdded', isEqualTo: userId)
        .limit(20)
        .snapshots();

    return snapshot.map((qSnap) => qSnap.docs
        .map((doc) => Item.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }

  Future<String> pushNewItem(Item itemData) async {
    Map<String, dynamic> postItemData = itemData.toJson();
    DocumentReference doc = await postCollection.add(postItemData);
    await postCollection
        .doc(doc.id)
        .set({'itemId': doc.id}, SetOptions(merge: true));
    return doc.id.toString();
  }

  Future pushUpdatePost(Item itemData, String itemId) async {
    Map<String, dynamic> data = itemData.toJson();
    postCollection.doc(itemId).update(data);
  }

  Future getPost(String postId) async {


    List postList = [];

    try {
      await postCollection.where("itemId",isEqualTo: postId).get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          postList.add(element.data());
          print("Element Added" + element.data().toString());
        });
      });
      return postList;
    } catch (e) {
      print(e.toString());
      return null;
    }



  }

  Future getAllItemsAddedByUser(String whoAdded) async {
    List postsList = [];

    try {
      await postCollection
          .where("whoAdded", isEqualTo: whoAdded)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          postsList.add(element.data);
        });
      });
      return postsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }




}
