import 'package:customer/app/app.locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:customer/services/function/firestore_services.dart';

class UserViewModel extends BaseViewModel {
  final FirestoreService firestoreService = locator<FirestoreService>();
  final firebaseAuth = FirebaseAuth.instance;

  // Users currentUser;

  String _userID() => firebaseAuth.currentUser?.uid;

  String get userID => _userID();

  // void printt() => print(userID);

  Future<String> currentUserEmail() async {
    print("this is the current user ID: $userID");
    String currentUserEmail = await firestoreService.getUser(userID);
    // String currentUserEmail = currentUser.toString();
    print(currentUserEmail);

    return currentUserEmail;
  }

  Future currentUserFullName() async {
    String currentUserFullName = await firestoreService.getUser(userID);
    // String currentUserEmail = currentUser.toString();
    print(currentUserFullName);

    return currentUserFullName;
  }

  // Users get currentUser => _currentUser;
}
