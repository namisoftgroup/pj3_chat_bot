import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gp_app_dev/profile/profilepage.dart';
import 'package:gp_app_dev/startpages/share_progress.dart';
import 'package:gp_app_dev/startpages/welcome.dart';
import 'package:gp_app_dev/subscription/payment-.dart';

class Baricon extends StatelessWidget {
  const Baricon({Key? key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // StreamBuilder for user data
            StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, AsyncSnapshot<User?> authSnapshot) {
                if (authSnapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (authSnapshot.hasError) {
                  return Text('Error: ${authSnapshot.error}');
                } else if (authSnapshot.hasData && authSnapshot.data != null) {
                  User? user = authSnapshot.data!;
                  return StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(user.uid)
                        .snapshots(),
                    builder:
                        (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData && snapshot.data!.exists) {
                        var userData =
                            snapshot.data!.data() as Map<String, dynamic>;
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profilepage()));
                          },
                          child: UserAccountsDrawerHeader(
                            margin: EdgeInsets.zero,
                            accountName: Text(
                              //'Hi ${userData['name']}',
                              '',
                              style: TextStyle(
                                color: Color.fromARGB(255, 63, 60, 62),
                              ),
                            ),
                            accountEmail: Text(
                              userData['email'],
                              style: TextStyle(
                                color: Color.fromARGB(255, 63, 60, 62),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 229, 211, 227),
                            ),
                            currentAccountPicture: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 237, 234, 234),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: const Icon(Icons.person_3_rounded),
                            ),
                          ),
                        );
                      } else {
                        return Text('No data available');
                      }
                    },
                  );
                } else {
                  return Text('User not authenticated');
                }
              },
            ),

            // My Subscription
            ListTile(
              leading: const Icon(Icons.check_circle_outline_rounded),
              title: const Text('My subscription'),
              onTap: () {
                //Navigator.of(context).pushReplacementNamed("content");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => newPaymentScene()));
              },
            ),

            // Share Progress
            ListTile(
              leading: CircleAvatar(
                radius: 13,
                child: ClipOval(
                  child: Image.network(
                    'https://imagedelivery.net/5MYSbk45M80qAwecrlKzdQ/10d1a6ab-def9-48a3-4692-46a55f5c0f00/public',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: const Text('Share progress'),
              onTap: () {
                // Navigator.of(context).pushReplacementNamed("share_progress");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ShareProgress()));
              },
            ),

            const Divider(),

            // Log Out
            Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Log Out'),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Welcome()),
                      (Route<dynamic> route) => false,
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
