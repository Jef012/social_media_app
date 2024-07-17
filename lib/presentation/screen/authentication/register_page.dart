import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/utils.dart';
import '../../../controller/provider/appProvider.dart';
import '../../../controller/repository/authenticationRepo.dart';
import '../../../models/arguments.dart';
import '../../../models/authModel.dart';

class RegisterPage extends StatefulWidget {
  final Function updateWidget;
  final UserArguments userDetails;
  final String title;
  RegisterPage(
      {super.key,
      required this.updateWidget,
      required this.userDetails,
      required this.title});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  double containerWidth = 0.3;
  String? mobile;
  String? emailId;
  String? password;
  final formKey = GlobalKey<FormState>();
  final AuthenticationRepo _auth = AuthenticationRepo();

  void animateContainer() {
    setState(() {
      containerWidth = 0.85;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      animateContainer();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: EdgeInsets.only(top: height * 0.09),
                  child: Text(widget.title,
                      style: GoogleFonts.robotoCondensed(
                          color: Colors.black87.withOpacity(0.7),
                          fontSize: height * 0.05,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: height * 0.15),
                Form(
                    key: formKey,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.06, right: width * 0.06),
                      child: Stack(
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: height * 0.01),
                                inputField(
                                    title: 'Mobile number',
                                    icon: Icons.phone_iphone,
                                    keyboardType: TextInputType.phone,
                                    maxLength: 10),
                                SizedBox(height: height * 0.02),
                                inputField(
                                  title: 'Email ID',
                                  icon: Icons.email,
                                  keyboardType: TextInputType.emailAddress,
                                  maxLength: 30,
                                ),
                                SizedBox(height: height * 0.02),
                                inputField(
                                  title: 'Password',
                                  icon: Icons.lock,
                                  keyboardType: TextInputType.text,
                                  maxLength: 20,
                                ),
                                SizedBox(height: height * 0.045),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        formKey.currentState!.save();
                                        print("EmailId ::: $emailId");
                                        print("password ::: $password");
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        signUp();
                                      }
                                    },
                                    child: Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.056,
                                        padding: EdgeInsets.only(
                                            top: height * 0.013,
                                            bottom: height * 0.013,
                                            right: width * 0.05,
                                            left: width * 0.05),
                                        decoration: BoxDecoration(
                                            color: HexColor("#0397fe"),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(3))),
                                        child: Center(
                                          child: Text("Sign up",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: height * 0.0215)),
                                        )),
                                  ),
                                ),
                                SizedBox(height: height * 0.015),
                              ]),
                        ],
                      ),
                    )),
                SizedBox(height: height * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an account?  ",
                      style: GoogleFonts.robotoCondensed(
                        color: Colors.white,
                        fontSize: height * 0.017,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        widget.updateWidget(1, UserArguments(newUser: true));
                      },
                      child: Text(
                        "Login",
                        style: GoogleFonts.robotoCondensed(
                          color: HexColor("#f93467"),
                          fontSize: height * 0.019,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputField(
      {String? title,
      IconData? icon,
      TextInputType? keyboardType,
      int? maxLength}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.056,
      decoration: BoxDecoration(
          color: HexColor("#363636"), borderRadius: BorderRadius.circular(3)),
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
      child: TextFormField(
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          hintTextDirection: TextDirection.ltr,
          hintText: title,
          hintStyle: TextStyle(
              color: Colors.white54,
              fontSize: MediaQuery.of(context).size.height * 0.021),
          counterText: '',
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.w500,
          fontSize: MediaQuery.of(context).size.height * 0.0225,
        ),
        cursorColor: Colors.black,
        keyboardType: keyboardType,
        maxLength: maxLength,
        // inputFormatters: inputFormatters,
        validator: (dynamic value) {
          if (value!.isEmpty) {
            Utils.flushBarErrorMessage("Field is required", context);
          } else if (title == 'email address') {
            String pattern = r'[0-9@a-zA-Z.]';
            RegExp regExp = RegExp(pattern);
            if (!regExp.hasMatch(value)) {
              Utils.flushBarErrorMessage("Field must be in numbers", context);
            }
          } else if (title == 'password') {
            if (value.length < 6) {
              Utils.flushBarErrorMessage(
                  "Password must be at least 6 characters", context);
            } else if (!value.contains(RegExp(r'[A-Z]'))) {
              Utils.flushBarErrorMessage(
                  "Password must contain at least one uppercase letter",
                  context);
            } else if (!value.contains(RegExp(r'[a-z]'))) {
              Utils.flushBarErrorMessage(
                  "Password must contain at least one lowercase letter",
                  context);
            } else if (!value.contains(RegExp(r'[0-9]'))) {
              Utils.flushBarErrorMessage(
                  "Password must contain at least one digit", context);
            }
          }
          return null;
        },
        onSaved: (String? value) {
          if (title == "Email ID") {
            emailId = value!;
          } else if (title == "Password") {
            password = value!;
          }
        },
      ),
    );
  }

  OutlineInputBorder commonInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(35)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ));

  void showValidationSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  signUp() {
    print("mobile: $mobile, email: $emailId, password: $password");
    _auth
        .signUp(
      emailId!.trim(),
      password!.trim(),
    )
        .then((value) {
      print("value ::: $value");
      Utils.toastMessage("Signed up successfully");
      Navigator.pushReplacementNamed(context, "/customBottonNaviBar");
    }).onError((error, stackTrace) {
      print(" value[error] :: $error");
    });
  }
}
