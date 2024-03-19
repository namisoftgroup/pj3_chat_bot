import 'package:flutter/material.dart';
import 'package:gp_app_dev/baricon.dart';
import 'package:gp_app_dev/utils.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      endDrawer: Baricon(), // Specify the Baricon widget as the endDrawer
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            padding:
                EdgeInsets.fromLTRB(19 * fem, 58 * fem, 27 * fem, 29 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(30 * fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 2 * fem, 8 * fem),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 4 * fem, 201 * fem, 0 * fem),
                        child: Text(
                          'Coach Bot ',
                          style: SafeGoogleFont(
                            'Zen Dots',
                            fontSize: 17 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2999999523 * ffem / fem,
                            letterSpacing: -0.16 * fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      // No need for the endDrawer here
                    ],
                  ),
                ),
                /* SizedBox(height: 20.0 * fem),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(12 * fem),
                      child: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/* Note 1 :
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
            // StreamBuilder for user data
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
                            Navigator.of(context)
                                .pushReplacementNamed("profilepage");
                          },
                          child: UserAccountsDrawerHeader(
                            accountName: Text('Hi ${userData['name']}'),
                            accountEmail: Text(userData['email']),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 196, 153, 202),
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
                Navigator.of(context).pushReplacementNamed("content");
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
              onTap: () => null, // You need to implement functionality here
            ),

            const Divider(),

            // Log Out
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("welcome", (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
*/

//Note 2 : Before u call the header(); make sure this code is set in the beginning of your page cosde , copy and past it there. the calling in line 260 & make sure to import header page in YOUR page
/**
 
 Builder(
              builder: (BuildContext context) {
                double baseWidth = 393;
                double fem = MediaQuery.of(context).size.width / baseWidth;
                double ffem = fem * 0.97;

                return Container(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 6 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         
                          Header(), // header calling

                           Container(
                  padding: EdgeInsets.fromLTRB(10 * fem, 0 * fem, 19 * fem, 52 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 0* fem, 0 * fem, 0 * fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                         
                        ),
                      ),
 
 */

// Note 3 :
// use this code to write the title of the page , to keep the size and font consistent, for Ex:  Visualize body page

/*

       first : call header(),

      second :    Container(
                          margin: EdgeInsets.fromLTRB(30 * fem, 0 * fem, 0 * fem, 20 * fem),
                          child: Text(
                            'Visualize your body',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 27 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),

              

            
              */
