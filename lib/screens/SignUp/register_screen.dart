// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_uicreation/screens/Login/sigin_screen.dart';
import 'package:flutter_uicreation/screens/SignUp/countrypick.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool value = false;

  //Form Key

  final _formKey = GlobalKey<FormState>();

  //Editing Controller
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _isObscure = true;
  bool _isObscureconfirm = true;

  bool changeButton = false;

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => UserFilterDemo()));
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //Firstname fiel

    //This is Email Field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),

        // border: OutlineInputBorder(
        //   borderSide: const BorderSide(width: 3, color: Colors.blue),
        //   borderRadius: BorderRadius.circular(10),
        //
        // ),
        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFF1F1F1), width: 3),
        ),
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10),
        ),
      ),
    );

    //This is Password Field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: _isObscure,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      decoration: InputDecoration(
        //prefixIcon: Icon(Icons.vpn_key),
        suffixIcon: IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFF1F1F1), width: 3),
        ),
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10),
        ),
      ),
    );

    //This is ConfirmPassword Field
    final confirmpasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordController,
      //keyboardType: TextInputType.emailAddress,
      obscureText: _isObscureconfirm,
      validator: (value) {
        // ignore: unrelated_type_equality_checks
        if (confirmPasswordController.text != passwordController.text) {
          return "Password Don't Match";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        confirmPasswordController.text = value!;
      },

      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        //prefixIcon: Icon(Icons.vpn_key),
        suffixIcon: IconButton(
          icon: Icon(
            _isObscureconfirm ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _isObscureconfirm = !_isObscureconfirm;
            });
          },
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        //hintStyle: GoogleFonts.gorditas(),
        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFF1F1F1), width: 3),
        ),
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10),
        ),
      ),
    );

    //This is SignUp Button
    final signUpButton = Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(10),
      color: Color(0xFF0E0B2C),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => UserFilterDemo())),
        child: Text(
          'Proceed',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xFFFFFFFF),
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        height: 130,
                        width: 130,
                        child: Image.asset(
                          "asset/images/AppIcon.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //First name And Last Namr
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Container(
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  //margin: EdgeInsets.only(right: 20.0),
                                  height: 70,
                                  width:
                                      MediaQuery.of(context).size.width / 2.25,
                                  child: TextFormField(
                                    autofocus: false,
                                    controller: firstNameController,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      RegExp regex = RegExp(r'^.{3,}$');
                                      if (value!.isEmpty) {
                                        return ("First name Required!");
                                      }
                                      if (!regex.hasMatch(value)) {
                                        return ("Enter Valid Name(Min. 3 Character)");
                                      }
                                    },
                                    onSaved: (value) {
                                      firstNameController.text = value!;
                                    },
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      //prefixIcon: Icon(Icons.account_circle),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 15, 20, 15),
                                      hintText: "First name",
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      enabledBorder: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(0xFFF1F1F1), width: 3),
                                      ),
                                      border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  //margin: EdgeInsets.only(right: 20.0),
                                  height: 70,
                                  width:
                                      MediaQuery.of(context).size.width / 2.25,
                                  child: TextFormField(
                                    autofocus: false,
                                    controller: lastNameController,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      RegExp regex = RegExp(r'^.{3,}$');
                                      if (value!.isEmpty) {
                                        return ("Last Name Required");
                                      }
                                      if (!regex.hasMatch(value)) {
                                        return ("Enter Valid Name(Min. 3 Character)");
                                      }
                                    },
                                    onSaved: (value) {
                                      lastNameController.text = value!;
                                    },
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      //prefixIcon: Icon(Icons.account_circle),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 15, 20, 15),
                                      hintText: "Last name",
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      enabledBorder: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(0xFFF1F1F1), width: 3),
                                      ),
                                      border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: emailField,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: passwordField,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: confirmpasswordField,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 15.0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            /** Checkbox Widget **/
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: Color(0xff0E0B2C),
                              value: value,
                              onChanged: (bool? value) {
                                setState(() {
                                  this.value = value!;
                                });
                              },
                            ),
                            Text(
                              'I agree to the',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'terms & conditions',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ), //Text
                          ], //<Widget>[]
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 41,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: signUpButton,
                    ),
                    SizedBox(
                      height: 49,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.36,
                              child: Divider(
                                color: Colors.black.withAlpha(15),
                                thickness: 10,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Text(
                            "OR",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.36,
                            child: Divider(
                              color: Colors.black.withAlpha(15),
                              thickness: 10,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 26.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Sign Up Using',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff0F0B2D),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 54,
                            width: 100,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Color(0xFFF1F1F1), width: 3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              //margin: EdgeInsets.all(10),
                              child: InkWell(
                                onTap: () {
                                  print('Tap');
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.facebook,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 54,
                            width: 100,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Color(0xFFF1F1F1), width: 3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              //margin: EdgeInsets.all(10),
                              child: InkWell(
                                onTap: () {
                                  print('Tap');
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.twitter,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 54,
                            width: 100,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Color(0xFFF1F1F1), width: 3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              //margin: EdgeInsets.all(10),
                              child: InkWell(
                                onTap: () {
                                  print('Tap');
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.google,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?",
                            style:
                                TextStyle(color: Colors.black, fontSize: 15)),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
