import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gp_app_dev/baricon.dart';
import 'package:gp_app_dev/consist/NavigationBar.dart';
import 'package:gp_app_dev/measurement-page.dart';
import 'package:gp_app_dev/utils.dart';

class newPaymentScene extends StatefulWidget {
// Define a Global Key for the form

  const newPaymentScene({super.key});

  @override
  State<newPaymentScene> createState() => _newPaymentScene();
}

class _newPaymentScene extends State<newPaymentScene> {
  TextEditingController card_number = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController cvv = TextEditingController();
  TextEditingController name = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
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
        body: SingleChildScrollView(
            child: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(12 * fem, 0 * fem, 0 * fem, 42 * fem),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Payment Options ',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 28 * ffem,
                fontWeight: FontWeight.w600,
                height: 2 * ffem / fem,
                color: Color(0xff000000),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.fromLTRB(21 * fem, 0 * fem, 63 * fem, 50.5 * fem),
              width: double.infinity,
              height: 23 * fem,
              child: Stack(
                children: [
                  Positioned(
                    left: 2.5 * fem,
                    top: 0 * fem,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 125 * fem,
                          height: 23 * fem,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w300,
                                height: 1.25 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Total',
                                  style: TextStyle(
                                    fontSize: 18 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.25 * ffem / fem,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                TextSpan(
                                  text: '  ',
                                  style: TextStyle(
                                    fontSize: 18 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3 * ffem / fem,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                TextSpan(
                                  text: '49 SAR\n',
                                  style: TextStyle(
                                    fontSize: 18 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.25 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0 * fem,
                    top: 22 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 263 * fem,
                        height: 1 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(217, 219, 218, 218),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
                child: Container(
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
                    width: double.infinity,
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            111 * fem, 10 * fem, 111 * fem, 10 * fem),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff000000)),
                          color: Color(0xff090a0a),
                          borderRadius: BorderRadius.circular(8 * fem),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentSuccessPage(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.apple,
                                color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Pay ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18 * ffem,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 30 * fem, 0 * fem, 30 * fem),
                          width: double.infinity,
                          child: Text(
                            'OR',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.25 * ffem / fem,
                              color: Color(0xff090a0a),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            15 * fem, 0 * fem, 226 * fem, 16 * fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 20 * fem, 1 * fem),
                              width: 46 * fem,
                              height: 30 * fem,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(71 * fem),
                                child: Image.asset(
                                  'assets/images/MasterCard.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              width: 40 * fem,
                              height: 37 * fem,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(84 * fem),
                                child: Image.asset(
                                  'assets/images/Visa.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0 * fem),
                      Form(
                          key: _formKey,
                          child: Column(children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  17 * fem, 0 * fem, 0 * fem, 3 * fem),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 14 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.25 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Card Number  ',
                                      ),
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                          fontSize: 14 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.25 * ffem / fem,
                                          color: Color(0xfffe0c0c),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0 * fem),
                            TextFormField(
                              controller: card_number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(
                                    9 * fem, 0 * fem, 0 * fem, 18 * fem),
                                filled: true,
                                fillColor: Color(0xfff1f3f4),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10 * fem),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: '0000 0000 0000 0000',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 198, 197, 197),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                _CardNumberFormatter(),
                              ],
                              validator: (value) {
                                // Validation logic
                                if (value!.isEmpty) {
                                  return 'Please enter a card number.';
                                }

                                // Remove spaces from the value
                                final cleanedValue = value.replaceAll(' ', '');

                                // Regular expression to validate the card number
                                RegExp cardNumberRegExp =
                                    RegExp(r'^[0-9]{16}$');
                                if (!cardNumberRegExp.hasMatch(cleanedValue)) {
                                  return 'Invalid card number. Please enter a 16-digit number.';
                                }
                                return null;
                              },
                            ),
                            // Other form fields and buttons go here
                            Container(
                              // autogroup4r1hXeb (Qk1QAm66aHSQYZVvxm4r1H)
                              margin: EdgeInsets.fromLTRB(
                                  17 * fem, 0 * fem, 97 * fem, 0 * fem),
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // expireddateDGX (7:48)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 86 * fem, 3 * fem),
                                    child: RichText(
                                      text: TextSpan(
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 14 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.25 * ffem / fem,
                                          color: Color(0xff000000),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: 'Expired date',
                                          ),
                                          TextSpan(
                                            text: ' * ',
                                            style: SafeGoogleFont(
                                              'Inter',
                                              fontSize: 14 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.25 * ffem / fem,
                                              color: Color(0xffff0000),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 50.0 * fem),
                                  Container(
                                    // cvvW99 (7:49)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 3 * fem, 0 * fem, 0 * fem),
                                    child: RichText(
                                      text: TextSpan(
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 14 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.25 * ffem / fem,
                                          color: Color(0xff000000),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: 'CVV',
                                          ),
                                          TextSpan(
                                            text: ' *  ',
                                            style: SafeGoogleFont(
                                              'Inter',
                                              fontSize: 14 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.25 * ffem / fem,
                                              color: Color(0xffff0000),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 0 * fem),
                            Container(
                              // autogroupkb3zL1h (Qk1QHWPrZTGhc14rjqKB3G)
                              margin: EdgeInsets.fromLTRB(
                                  10 * fem, 0 * fem, 0 * fem, 22 * fem),
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // rectangle Expaierd date
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 33 * fem, 0 * fem),
                                    width: 152 * fem,
                                    height: 37 * fem,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10 * fem),
                                      color: Color(0xfff1f3f4),
                                    ),
                                    child: TextFormField(
                                      controller: date,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10 * fem),
                                        border: InputBorder.none,
                                        hintText: 'MM/YY', // Placeholder text
                                        hintStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 198, 197, 197)),
                                      ),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        _CardExpirationDateFormatter(),
                                      ],
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter an expiration date.';
                                        }

                                        if (isCardExpired(value)) {
                                          return 'Your card is expired.';
                                        }

                                        final parts = value.split('/');
                                        if (parts.length != 2) {
                                          return 'Invalid expiration date. Please enter in MM/YY format.';
                                        }

                                        final month = int.tryParse(parts[0]);
                                        final year = int.tryParse(parts[1]);

                                        if (month == null || year == null) {
                                          return 'Please enter the expiration date.';
                                        }

                                        if (year < 24) {
                                          return 'The year must be 24 or later.';
                                        }

                                        if (month < 1 || month > 12) {
                                          return ' Please enter a valid month (1-12).';
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    // rectangle3 CVV
                                    width: 152 * fem,
                                    height: 37 * fem,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10 * fem),
                                      color: Color(0xfff1f3f4),
                                    ),
                                    child: TextFormField(
                                      controller: cvv,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10 * fem),
                                        border: InputBorder.none,
                                        hintText: '***', // Placeholder text
                                        hintStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 198, 197, 197)),
                                      ),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter a value.';
                                        }
                                        if (value.length != 3) {
                                          return 'Please enter exactly 3 digits.';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  10 * fem, 0 * fem, 0 * fem, 9 * fem),
                              child: Align(
                                alignment: Alignment
                                    .centerLeft, // Align the text to the left
                                child: RichText(
                                  text: TextSpan(
                                    style: SafeGoogleFont(
                                      'Inter',
                                      fontSize: 14 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.25 * ffem / fem,
                                      color: Color(0xffff0000),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Cardholder Name ',
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 14 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.25 * ffem / fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' *  ',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 0.0 * fem),
                            TextFormField(
                              controller: name,
                              // rectangle cardholder name
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(
                                    9 * fem, 0 * fem, 0 * fem, 22 * fem),
                                filled: true,
                                fillColor: Color(0xfff1f3f4),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      10 * fem), // Set border radius
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'Name on Card', // Placeholder text
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 198, 197, 197)),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a value';
                                }

                                // Regular expression to match alphabetic characters only
                                RegExp alphabeticRegExp =
                                    RegExp(r'^[a-zA-Z ]+$');
                                if (!alphabeticRegExp.hasMatch(value)) {
                                  return 'Invalid input. Please enter alphabetic characters only.';
                                }

                                return null;
                              },
                            ),
                            SizedBox(height: 35.0 * fem),
                            Container(
                              // buttonprimary5oq (7:44)
                              margin: EdgeInsets.fromLTRB(
                                  101 * fem, 0 * fem, 136 * fem, 0 * fem),
                              width: double.infinity,
                              height: 40 * fem,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 96, 3, 110),
                                borderRadius: BorderRadius.circular(10 * fem),
                              ),
                              child: Center(
                                child: InkWell(
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      try {
                                        final user =
                                            FirebaseAuth.instance.currentUser!;
                                        await FirebaseFirestore.instance
                                            .collection("cards")
                                            .doc(user.uid)
                                            .set({
                                          "card number": card_number.text,
                                          "date": date.text,
                                          "cvv": cvv.text,
                                          "Name": name.text,
                                          "uid": user.uid
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PaymentSuccessPage(),
                                          ),
                                        );
                                      } catch (error) {
                                        print("Error: $error");
                                      }
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      'Pay',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Inter',
                                        fontSize: 16 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.25 * ffem / fem,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]))
                    ])))
          ]),
        )));
  }
}

class _CardExpirationDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = _getFormattedExpirationDate(newValue.text);
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  String _getFormattedExpirationDate(String text) {
    text = text.replaceAll('/', '');

    if (text.length > 2) {
      text = text.substring(0, 2) + '/' + text.substring(2);
    }

    return text;
  }
}

bool isCardExpired(String expirationDate) {
  final currentDate = DateTime.now();
  final currentYear =
      currentDate.year % 100; // Get the last two digits of the current year
  final currentMonth = currentDate.month;

  final parts = expirationDate.split('/');
  if (parts.length != 2) {
    return false;
  }

  final month = int.tryParse(parts[0]);
  final year = int.tryParse(parts[1]);

  if (month == null || year == null) {
    return false;
  }

  if (year < currentYear) {
    return true; // Card is expired
  } else if (year == currentYear && month < currentMonth) {
    return true; // Card is expired
  }

  return false; // Card is not expired
}

class _CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final cleanedText = newValue.text.replaceAll(RegExp(r'\s'), '');

    // Limit the input to 16 characters
    if (cleanedText.length > 16) {
      // If the input exceeds 16 characters, truncate it
      final truncatedText = cleanedText.substring(0, 16);
      return TextEditingValue(
        text: truncatedText,
        selection: TextSelection.collapsed(offset: truncatedText.length),
      );
    }

    final List<String> chunks = <String>[];
    int index = 0;

    while (index < cleanedText.length) {
      chunks.add(
          cleanedText.substring(index, min(index + 4, cleanedText.length)));
      index += 4;
    }

    final formattedText = chunks.join(' ');

    // Calculate the new selection offset, excluding spaces
    final newSelectionOffset = newValue.selection.baseOffset +
        (formattedText.length - newValue.text.length);

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: newSelectionOffset),
    );
  }
}

//local page for Payment Success

class PaymentSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      endDrawer: const Baricon(),
      appBar: AppBar(
        title: Text(
          'Coach Bot',
          style: TextStyle(
            fontFamily: 'Zen Dots',
            fontSize: 16 * ffem,
            fontWeight: FontWeight.w400,
            height: 1.2999999523 * ffem / fem,
            letterSpacing: -0.16 * fem,
            color: const Color(0xff000000),
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(12 * fem, 0 * fem, 0 * fem, 38 * fem),
            width: 39 * fem,
            height: 39 * fem,
            child: Image.asset(
              'assets/images/back.png',
              width: 39 * fem,
              height: 39 * fem,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/payment successfully done.jpg',
              height: 200,
              width: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Success!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Your subscription was processed successfully, ',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 112, 108, 108),
                fontFamily: 'Arial',
              ),
            ),
            Text(
              'click here to see your subscription',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 112, 108, 108),
                fontFamily: 'Arial',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Measurement3D()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 96, 3, 110),
              ),
              child: Text(
                'My subscription',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
