import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uicreation/screens/Login/signin_socialmedia.dart';
import 'package:flutter_uicreation/screens/home_screen.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import '../SignUp/register_screen.dart';

class SignPassword extends StatefulWidget {
  @override
  _SignPasswordState createState() => _SignPasswordState();
}

class _SignPasswordState extends State<SignPassword> {
  //Form Key

  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  //Editing Controller

  final TextEditingController passwordController = new TextEditingController();

  bool changeButton = false;

  //Error Msg Display

  final errorMsgsnackBar = SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Color(0xFFFF0000),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x19000000),
                    spreadRadius: 2.0,
                    blurRadius: 8.0,
                    offset: Offset(2, 4),
                  )
                ],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  const Icon(Icons.error, color: Colors.white),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text("Could Not Sign in",
                        style: TextStyle(color: Colors.white)),
                  ),
                  const Spacer(),
                  const Icon(CupertinoIcons.xmark, color: Colors.white),
                ],
              )),
        ],
      ),
    ),
  );

  //Success Message Dsiplay

  final sucessMsgsnackBar = SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Color(0xFF00C608),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x19000000),
                    spreadRadius: 2.0,
                    blurRadius: 8.0,
                    offset: Offset(2, 4),
                  )
                ],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  const Icon(CupertinoIcons.check_mark, color: Colors.white),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text('Sign In Successful',
                        style: TextStyle(color: Colors.white)),
                  ),
                  const Spacer(),
                  const Icon(CupertinoIcons.xmark, color: Colors.white),
                ],
              )),
        ],
      ),
    ),
  );

  moveToNext(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
      ;
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //This is Password Field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: _isObscure,

      // validator:(value){},

      onSaved: (value) {
        passwordController.text = value!;
      },

      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
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
        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFF1F1F1), width: 3),
        ),
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10),
        ),
      ),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10),
      color: Color(0xff0E0B2C),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          print(passwordController.text);
          passwordController.text.length > 3 &&
                  passwordController.text.isNotEmpty
              ? ScaffoldMessenger.of(context).showSnackBar(sucessMsgsnackBar)
              // ? showTopSnackBar(
              //     context,
              //     Container(
              //       child: CustomSnackBar.success(
              //         icon: Icon(
              //           CupertinoIcons.checkmark_alt_circle_fill,
              //           size: 25,
              //           color: Colors.white,
              //         ),
              //         iconPositionLeft: 280,
              //         iconRotationAngle: 0,
              //         message: "Success",
              //       ),
              //     ),
              //   )
              : ScaffoldMessenger.of(context).showSnackBar(errorMsgsnackBar);
          // : showTopSnackBar(
          //     context,
          //     CustomSnackBar.error(
          //       icon: Icon(
          //         Icons.cancel,
          //         size: 25,
          //         color: Colors.white,
          //       ),
          //       iconPositionLeft: 280,
          //       iconRotationAngle: 0,
          //       message: "Could not sign in. ",
          //     ),
          //   );
        },
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
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset(
                        'asset/images/AppIcon.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                      height: 60.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome John',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    passwordField,
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    loginButton,
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignSocialMedia(),
                              ),
                            );
                          },
                          child: Text(
                            'Recover Your Account?',
                            style: TextStyle(
                              color: Color(0xff03AFC5),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
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
