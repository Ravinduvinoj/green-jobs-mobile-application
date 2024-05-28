
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:jobmobileapp/config.dart';
// import 'package:jobmobileapp/models/loginmodel/login_request_model.dart';
// import 'package:jobmobileapp/services/api_services.dart';
// import 'package:flutter/widgets.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAPicallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? email;
  String? password;
 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 5, 131, 32),
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _loginUI(context),
          ),
          inAsyncCall: isAPicallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 6,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white,
                  ],
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/logo 04.png",
                    width: 250,
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                left: 20,
                bottom: 30,
                top: 50,
              ),
              child: Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(
                context,
                prefixIcon: Icon(Icons.person),
                "email",
                "Email", (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "Email can\'t be empty.";
              }
              return null;
            }, (onSavedVal) {
              email = onSavedVal;
            },
                borderFocusColor: Colors.white,
                prefixIconColor: Colors.white,
                borderColor: Colors.white,
                textColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.7),
                borderRadius: 12),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: FormHelper.inputFieldWidget(
                context,
                prefixIcon: Icon(Icons.person),
                "password",
                "Password", (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "password can\'t be empty.";
              }
              return null;
            }, (onSavedVal) {
              password = onSavedVal;
            },
                borderFocusColor: Colors.white,
                prefixIconColor: Colors.white,
                borderColor: Colors.white,
                textColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.7),
                borderRadius: 12,
                obscureText: hidePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  color: Colors.white.withOpacity(0.7),
                  icon: Icon(
                    hidePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                )),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 25, top: 10),
              child: RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Forget Password ?',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("forget Password");
                          },
                      )
                    ]),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: FormHelper.submitButton("Login", () {
              if (validateAndSave()) {
                setState(() {
                  isAPicallProcess = true;
                });
                // LoginRequestModel model =
                //     LoginRequestModel(email: email!, password: password!);

                // APIServices.login(model).then((response) => {
                //   setState(() {
                //     isAPicallProcess = false;
                //   }),
                //       if (response)
                //         {
                //           Navigator.pushNamedAndRemoveUntil(
                //               context, '/home', (route) => false,)
                //         }
                //         else{
                //           FormHelper.showSimpleAlertDialog(
                //             context, 
                //             Config.appName,
                //              "Invalid email", 
                //              "OK",
                //               (){
                //                 Navigator.pop(context);
                //               })
                //         }
                //     });
              }
            },
                btnColor: Color.fromARGB(255, 5, 131, 32),
                borderColor: Colors.white,
                txtColor: Colors.white,
                borderRadius: 10,
                
                ),
                
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "OR",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(right: 25, top: 10),
              child: RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    children: <TextSpan>[
                      TextSpan(text: "Don`t have an account?  "),
                      TextSpan(
                        text: 'Register',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, "/register");
                          },
                      )
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}

class ProgressHUD extends StatelessWidget {
  final Widget child;
  final bool inAsyncCall;
  final double opacity;

  ProgressHUD({
    required this.child,
    required this.inAsyncCall,
    this.opacity = 0.3,
    required UniqueKey key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        if (inAsyncCall)
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(opacity),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}


// import 'dart:js';

// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {

//   bool isAPicallProcess= false;
//   bool hidePassword = true;
//   GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
//   String? username;
//   String? password;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: _loginUI()
      
//       );
//   }

//   Scaffold _loginUI(JsObject context) {
//     return Scaffold(
//       backgroundColor: Colors.green,
//       body: ProgressHUD(
//         child: Form(
//           key: globalFormKey, 
//           child: _loginUI(context),
//           ),
//           inAsyncCall : isAPicallProcess,a
//           opacity :0.3,
//           key: UniqueKey(),
          
//       ),
//     );
//   }

//   Widget _loginUI(BuildContext context){
//    return SingleChildScrollView(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [


        
//       ],
      
      
//       )
//    )
//   }
// }