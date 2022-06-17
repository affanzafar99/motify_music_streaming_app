import 'package:flutter/material.dart';
import 'package:flutter_uicreation/screens/Login/sigin_screen.dart';

class ResetPwScreen extends StatefulWidget {
  @override
  _ResetPwScreenState createState() => _ResetPwScreenState();
}

class _ResetPwScreenState extends State<ResetPwScreen> {
  //Form Key

  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool _isObscureconfirm = true;

  //Editing Controller

  final TextEditingController createNewController = new TextEditingController();
  final TextEditingController reEnterController = new TextEditingController();

  bool changeButton = false;

  moveToNext(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
      ;
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final createPassword = TextFormField(
      autofocus: false,
      controller: createNewController,
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
        createNewController.text = value!;
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
        hintText: "Create New Password",
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
    final reEnterPassword = TextFormField(
      autofocus: false,
      controller: reEnterController,
      //keyboardType: TextInputType.emailAddress,
      obscureText: _isObscureconfirm,
      validator: (value) {
        // ignore: unrelated_type_equality_checks
        if (createNewController.text != reEnterController.text) {
          return "Password Don't Match";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        reEnterController.text = value!;
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
        hintText: "Re-enter new password",
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

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10),
      color: Color(0xff0E0B2C),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () => moveToNext(context),
        child: Text(
          'Submit',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18,
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.w500),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      'asset/images/AppIcon.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Reset Password',
                              style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff0F0B2D)),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Please enter your new password',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff0F0B2D)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        createPassword,
                        SizedBox(
                          height: 25,
                        ),
                        reEnterPassword,
                        SizedBox(
                          height: 35,
                        ),
                        loginButton,
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
