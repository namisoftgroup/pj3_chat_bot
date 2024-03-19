import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:gp_app_dev/baricon.dart';
import 'package:gp_app_dev/consist/NavigationBar.dart';
import 'package:gp_app_dev/utils.dart';
//import 'package:gp_app_dev/consist/NavigationBar.dart';

class Profilepage extends StatelessWidget {
  Profilepage({Key? key}) : super(key: key);

  final userCollection = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser!.uid; // Get current user UID
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97; // Get current user UID
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),

      endDrawer: const Baricon(),
      appBar: AppBar(
        title: Text(
          'Coach Bot',
          style: SafeGoogleFont(
            'Zen Dots',
            fontSize: 16 * ffem,
            fontWeight: FontWeight.w400,
            height: 1.2999999523 * ffem / fem,
            letterSpacing: -0.16 * fem,
            color: const Color(0xff000000),
          ),
        ),
        leading: InkWell(
          onTap: () {
            //Navigator.pop(context);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => NavigationBarApp()));
          },
          child: Padding(
            padding: EdgeInsets.all(12 * fem),
            child: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream:
            FirebaseFirestore.instance.collection("users").doc(uid).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('ERROR ${snapshot.error}'));
          } else if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('No data available'));
          } else {
            var userData = snapshot.data!.data() as Map<String, dynamic>;
            return ListView(
              children: [
                const SizedBox(height: 50),
                const Icon(Icons.person, size: 72),
                const SizedBox(height: 50),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    'My Details',
                    style: TextStyle(
                      color: Color.fromARGB(255, 111, 110, 110),
                    ),
                  ),
                ),
                /* MyTextBox(
                  text: userData['name'] ?? '',
                  sectionName: 'Name',
                  onPressed: () => editField(context, 'name', uid),
                ),*/
                MyTextBox(
                  text: userData['email'] ?? '',
                  sectionName: 'Email',
                  onPressed: () => editField(context, 'email', uid),
                ),
                const SizedBox(height: 50),
                ResetButton(
                  title: 'Reset your password',
                  onPressed: () => resetPassword(context),
                ),
              ],
            );
          }
        },
      ),
      //bottomNavigationBar: NavigationBarApp(), // Bottom navigation bar
    );
  }

  Future<void> editField(BuildContext context, String field, String uid) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Edit $field",
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        content: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: const TextStyle(color: Colors.grey),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop(newValue);
              if (newValue.trim().isNotEmpty) {
                final DocumentReference documentReference =
                    userCollection.doc(uid);

                try {
                  await documentReference.update({
                    // if (field == 'name') 'name': newValue,
                    if (field == 'email') 'email': newValue,
                  });
                  // Send verification email if updating email field
                  if (field == 'email') {
                    await FirebaseAuth.instance.currentUser!
                        .sendEmailVerification();

                    // Show awesome dialog to notify user that email verification has been sent
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.info,
                      title: 'Email Verification',
                      desc:
                          'An email verification link has been sent to your email address.',
                    ).show();
                  }
                } catch (e) {
                  print('Error updating document: $e');
                  // Handle the error here, such as showing an error dialog
                }
              }
            },
            child: const Text('Save', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Future<void> resetPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: FirebaseAuth.instance.currentUser!.email!);
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        title: 'Password Reset',
        desc: 'A password reset link has been sent to your email address.',
      )..show();
    } catch (e) {
      print('Error sending password reset email: $e');
      // Handle the error here, such as showing an error dialog
    }
  }
}

class MyTextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  final void Function()? onPressed;

  const MyTextBox({
    Key? key,
    required this.text,
    required this.sectionName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 4, // Spread radius
            blurRadius: 6, // Blur radius
            offset: Offset(0, 3), // Offset
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 15, bottom: 15),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionName,
                style: TextStyle(color: Colors.grey[500]),
              ),
              IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.settings),
                color: Colors.grey[500],
              ),
            ],
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class ResetButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const ResetButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0, // Set elevation to 0 to prevent double shadow effect
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 20,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 4, // Spread radius
              blurRadius: 6, // Blur radius
              offset: Offset(0, 3), // Offset
            ),
          ],
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(
              color: Color.fromARGB(255, 37, 35, 37),
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.white,
            ),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            ),
          ),
        ),
      ),
    );
  }
}
