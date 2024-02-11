// ignore_for_file: use_build_context_synchronously

import 'package:google_fonts/google_fonts.dart';

import '../utils/snackbar_notification.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// provide us object, that is managed behind the scenes by FirebaseSDK
final firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  // for getting values out of form and other stuff
  final formKey = GlobalKey<FormState>();
  // switching between login and signup content
  var isLogin = true;
  // if it is busy in uploading the credentials
  var isBusy = false;
  // user credentials and meta data
  var userEmail = "";
  var userPassword = "";
  var userContact = "";
  var userName = "";

  void submit() async {
    /* 
      1. Validating the user entered email and password by form key
      2. Based upon the mode, login on or sign up, creating new account or authenticating the previous one
      3. if the communication with backend goes successful, all fine, else showing error on the screen
    */

    // validating if the user has entered right data, before moving on
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    // saving the data, in case user make changes while it's busy in backend
    formKey.currentState!.save();

    try {
      // now busy in backend
      setState(() {
        isBusy = true;
      });

      final UserCredential userCredential;

      // login mode, authentication
      if (isLogin) {
        userCredential = await firebase.signInWithEmailAndPassword(
            email: userEmail, password: userPassword);
        if (!mounted) return;
      }
      // sign up mode, creating account
      else {
        userCredential = await firebase.createUserWithEmailAndPassword(
            email: userEmail, password: userPassword);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'username': userName,
          'uid': userCredential.user!.uid,
          'email': userEmail,
          'contact': userContact,
        });
      }

      // loading user data from firebase
      // be careful, upon sign-in it's necesarry

      Future.delayed(const Duration(seconds: 1));
      // navigate to home screen
    }

    // incase things go wrong
    // ignore: unused_catch_clause
    on FirebaseAuthException catch (error) {
      showSnackBarNotification(
        context: context,
        message: 'Authentication Failed!',
      );
    }
    // stop loading indicator
    finally {
      setState(() {
        isBusy = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffead9c2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLogin) Image.asset('assets/chai.png'),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
              left: 25,
              right: 25,
            ),

            // form to take inputs for sing in / sign up
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  // user email
                  if (isLogin)
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Welcome Back',
                        style: GoogleFonts.josefinSans(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  TextFormField(
                    initialValue: 'ab@gmail.com',
                    decoration: const InputDecoration(
                      label: Text("Email Address: "),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty ||
                          !value.contains("@")) {
                        return "Please Enter Valid Email Address";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userEmail = value!;
                    },
                  ),

                  // user name
                  if (!isLogin)
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Your Name: "),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            value.length < 4) {
                          return "Minimum Lenght is 4 characters!";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        userName = value!;
                      },
                    ),
                  // user name
                  if (!isLogin)
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Your Address: "),
                          hintText: 'Beruni Hostel, Room 125'),
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            value.length < 4) {
                          return "Minimum Lenght is 4 characters!";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        userName = value!;
                      },
                    ),

                  // user contact number
                  if (!isLogin)
                    TextFormField(
                      initialValue: '+92-320-0094995',
                      decoration: const InputDecoration(
                        label: Text("Contact: "),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            value.length < 11) {
                          return "Enter valid number";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        userContact = value!;
                      },
                    ),

                  // user password
                  TextFormField(
                    initialValue: '111111',
                    decoration: const InputDecoration(
                      label: Text("Password: "),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty ||
                          value.length < 6) {
                        return "Minimum Lenght is 6 characters!";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userPassword = value!;
                    },
                  ),

                  const SizedBox(height: 20),

                  if (isBusy) const CircularProgressIndicator(),

                  // signing in or signing up
                  if (!isBusy)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromRGBO(35, 12, 2, 1),
                        border: Border.all(
                          color: const Color.fromRGBO(35, 12, 2, 1),
                          width: 2,
                        ),
                      ),
                      width: double.infinity,
                      child: TextButton(
                        onPressed: submit,
                        child: Text(
                          isLogin ? "Log in" : "Sign Up",
                          style: const TextStyle(
                            color: Color.fromRGBO(255, 245, 233, 1),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 5),
                  // switching between signup and login mode
                  if (!isBusy)
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: const Color.fromRGBO(35, 12, 2, 1),
                          width: 2,
                        ),
                        color: Colors.transparent,
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                        child: Text(
                          isLogin
                              ? "Create New Account"
                              : "Already have an Account?",
                          style: const TextStyle(
                            color: Color.fromRGBO(35, 12, 2, 1),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
