import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  static final CollectionReference users =
      FirebaseFirestore.instance.collection("users");
  static final CollectionReference posts =
      FirebaseFirestore.instance.collection("posts");
  static final CollectionReference comments =
      FirebaseFirestore.instance.collection("comments");

  // static Future pushUser() async {
  //   SingletonModel m = SingletonModel.shared;
  //   UserModel u = UserModel(
  //     name: m.user.detail.name,
  //     photo: m.user.detail.image,
  //     token: m.fcmToken,
  //   );
  //   QuerySnapshot s = await users.get();
  //   List<QueryDocumentSnapshot> r =
  //       s.docs.where((d) => d.id == m.user.detail.uuid).toList();
  //   if (r.isEmpty) {
  //     await users.doc(m.user.detail.uuid).set(u.toJson());
  //   } else {
  //     await users
  //         .doc(r.first.reference.path.split("/").last)
  //         .update({"token": u.token});
  //   }
  // }
  //
  // static Future logout() async {
  //   SingletonModel m = SingletonModel.shared;
  //   FirestoreUserModel u = FirestoreUserModel(
  //     name: m.user.detail.name,
  //     photo: m.user.detail.image,
  //     token: null,
  //   );
  //   return await users.doc(m.user.detail.uuid).update(u.toJson());
  // }
}
