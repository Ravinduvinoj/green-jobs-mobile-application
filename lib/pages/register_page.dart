import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:jobmobileapp/config.dart';
// import 'package:jobmobileapp/models/registermodel/register_request_model.dart';
// import 'package:jobmobileapp/services/api_services.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
// import 'package:date_field/date_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isAPicallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  //date picker
  // TextEditingController dateController = TextEditingController();

  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? con_password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 5, 131, 32),
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _registerUI(context),
          ),
          inAsyncCall: isAPicallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _registerUI(BuildContext context) {
    var children = [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 13,
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
                    bottomLeft: Radius.circular(150),
                    bottomRight: Radius.circular(150))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/logo 04.png",
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                left: 20,
                bottom: 10,
                top: 10,
              ),
              child: Text(
                "Registration",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: FormHelper.inputFieldWidget(
                context,
                prefixIcon: Icon(Icons.person),
                "firstname",
                "First Name", (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "First Name can\'t be empty.";
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
            padding: const EdgeInsets.only(top: 12),
            child: FormHelper.inputFieldWidget(
                context,
                prefixIcon: Icon(Icons.person),
                "lastname",
                "Last Name", (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "Last Name can\'t be empty.";
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
            padding: const EdgeInsets.only(top: 20),
            child: FormHelper.inputFieldWidget(
                context,
                prefixIcon: Icon(Icons.person),
                "email",
                "Email", (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "Email can't be empty.";
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
            padding: const EdgeInsets.only(top: 20),
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
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: FormHelper.inputFieldWidget(
                context,
                prefixIcon: Icon(Icons.person),
                "con_password",
                "Confirm Password", (onValidateVal) {
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
                  )
                ),
          ),

//date picker

// Padding(
//   padding: const EdgeInsets.only(top: 5, left: 20, bottom: 20,right: 20),
//   child: TextFormField(
//     controller: dateController,
//     decoration: InputDecoration(
//       labelText: 'Date of birth',
//       hintText: 'Select your date of birth',
//     ),
//     onTap: () async {
//       DateTime? selectedDate = await showDatePicker(
//         context: context,
//         initialDate: DateTime(2006),
//         firstDate: DateTime(1900),
//         lastDate: DateTime(2006),
//       );
//       if (selectedDate != null) {
//         // Update the text of the TextEditingController
//         dateController.text = selectedDate.toLocal().toString().split(' ')[0];
//       }
//     },
//   ),
// ),
          SizedBox(
            height: 40,
          ),
//           Center(
//             child: FormHelper.submitButton("Register", () {

//               if (validateAndSave()) {
//                 setState(() {
//                   isAPicallProcess = true;
//                 });
//                 RegisterRequestModel model =
//                     RegisterRequestModel(firstname: firstname!, lastname: lastname!,email: email!,password: password!,con_password: con_password!);

//                 APIServices.register(model).then((response) => {
//                   setState(() {
//                     isAPicallProcess = false;
//                   }),
//                       if (response.data!=null)
//                         {
//  FormHelper.showSimpleAlertDialog(
//                             context, 
//                             Config.appName,
//                              "Registration Successfully. Please login to the account", 
//                              "OK",
//                               (){
//                                 Navigator.pop(context);
//                               },
//                               ),

//                           Navigator.pushNamedAndRemoveUntil(
//                               context, '/login', (route) => false,)
//                         }
//                         else{
//                           FormHelper.showSimpleAlertDialog(
//                             context, 
//                             Config.appName,
//                             " ${response.message}", 
//                              "OK",
//                               (){
//                                 Navigator.pop(context);
//                               },
//                               )
//                         }
//                     });
//               }
//             },
//                 btnColor: Color.fromARGB(255, 5, 131, 32),
//                 borderColor: Colors.white,
//                 txtColor: Colors.white,
//                 borderRadius: 10),
//           ),
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
                      TextSpan(text: " Already have an account?  "),
                      TextSpan(
                        text: 'login',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, "/");
                          },
                      )
                    ]),
              ),
            ),
          ),
        ];
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
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
