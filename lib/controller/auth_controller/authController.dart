import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final CollectionReference _usercollection =
      FirebaseFirestore.instance.collection('users');
  var isLoading = false.obs;

  // Observable for user state
  Rxn<User> _firebaseUser = Rxn<User>();

  // Getter to check authentication status
  User? get user => _firebaseUser.value;

  @override
  void onInit() {
    super.onInit();
    // Bind Firebase auth state to this controller
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  // Signup method
  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    try {
      // Create user with email and password using Firebase Authentication
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // After the user is created, save their other details to Firestore
      await _usercollection.doc(userCredential.user?.uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'email': email,
      });

      Get.snackbar("Success", "Account created successfully",
          snackPosition: SnackPosition.BOTTOM);

      // Navigate to OTP confirmation screen
      Get.offAllNamed('/OtpConfirmation');
    } catch (e) {
      Get.snackbar("Signup Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Signin method
  Future<void> signIn(String email, String password) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      // Sign in using Firebase Authentication
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Retrieve the user's data from Firestore (excluding password)
      DocumentSnapshot snap =
          await _usercollection.doc(userCredential.user?.uid).get();

      // Optionally store the token and user data in SharedPreferences
      String? token = await userCredential.user!.getIdToken();
      await pref.setString('token', token!);
      await pref.setString('email', snap['email']);

      Get.snackbar("Success", "Signed in successfully",
          snackPosition: SnackPosition.BOTTOM);
      Get.offAllNamed(
          '/homepage'); // Navigate to homepage after successful sign-in
    } catch (e) {
      Get.snackbar("Signin Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Signout method
  Future<void> signOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try {
      print('signout entered');
      await _auth.signOut();
      // Sign out from Google if using Google Sign-In

      await _googleSignIn.signOut();
      await sharedPreferences.clear();
      var value = sharedPreferences.getString('token');
      debugPrint("The token value: $value");

      Get.offAllNamed('/LoginPage'); // Navigate to sign-in screen after signout
      Get.snackbar("Success", "Signed out successfully",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Signout Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<User?> signInWithGoogle() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isLoading.value = true;
    try {
      // Start the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        isLoading.value = false;
        // User canceled the sign-in
        return null;
      }
      print('google user credential:$googleUser');

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      print('googleAuth:$googleAuth');

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Optionally store the token and user data in SharedPreferences
      String? token = googleAuth.accessToken;
      await pref.setString('token', token!);

      // Sign in to Firebase with the Google credential
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print("Error signing in with Google: $e");
      return null;
    } finally {
      isLoading.value = false;
    }
  }
}
