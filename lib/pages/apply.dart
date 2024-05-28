import 'package:flutter/material.dart';
import 'package:mobileapp/model/application_Model.dart';
import 'package:mobileapp/services/api_service.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import '../config.dart';

class application extends StatefulWidget {
  const application({Key? key}) : super(key: key);

  @override
  _applicationState createState() => _applicationState();
}

class _applicationState extends State<application> {
  ApplicationModel? appmodel;
 var postid;
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isApiCallProcess = false;
   bool isFileSelected = false;
  DateTime? _selectedDate;
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'application',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.green,
      ),
      backgroundColor: Color.fromARGB(255, 229, 255, 199),
      body: ProgressHUD(
        child: Form(
          key: globalFormKey,
          child: appForm(),
        ),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
        key: UniqueKey(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    appmodel = ApplicationModel();

    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
        postid = arguments['post'];
        // isEditMode = true;
        setState(() {});
        print("sdfertfewge${postid}");
      }
    });
  }

  Widget appForm() {
     DateTime eligibeDate = DateTime.now().subtract(Duration(days: 365 * 17));
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
               bottom: 5,
              top: 20,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              prefixIcon:  const Icon(Icons.person),
              "name",
              "User Name",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'UserName Can\'t be empty.';
                }
                return null;
              },
              (onSavedVal) => {
                appmodel!.name = onSavedVal,
              },
               obscureText: false,
              borderFocusColor: Color.fromARGB(255, 35, 121, 1),
              borderColor: Color.fromARGB(255, 28, 119, 0),
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: true,
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(
               bottom: 5,
              top: 10,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              prefixIcon:  const Icon(Icons.contact_phone),
              "contact",
              "Contact Number",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Contact number Can\'t be empty.';
                }
                return null;
              },
              (onSavedVal) => {
                appmodel!.contact =int.parse(onSavedVal),
              },
               obscureText: false,
              borderFocusColor: Color.fromARGB(255, 35, 121, 1),
              borderColor: Color.fromARGB(255, 28, 119, 0),
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: true,
            ),
          ), Padding(
            padding: const EdgeInsets.only(
              bottom: 5,
              top: 10,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              prefixIcon: const Icon(Icons.add_location_alt_outlined),
              "address",
              "Address",
              (onValidate) {
                if (onValidate.isEmpty) {
                  return 'address Can\'t be empty.';
                }
                return null;
              },
              (onSaved) => {
                appmodel!.address = onSaved,
              },
              obscureText: false,
              borderFocusColor: Color.fromARGB(255, 35, 121, 1),
              borderColor: Color.fromARGB(255, 28, 119, 0),
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 5,
              top: 10,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              prefixIcon: const Icon(Icons.add_location_alt_outlined),
              "city",
              "City",
              (onValidate) {
                if (onValidate.isEmpty) {
                  return 'city Can\'t be empty.';
                }
                return null;
              },
              (onSaved) => {
                appmodel!.city = onSaved,
              },
              obscureText: false,
              borderFocusColor: Color.fromARGB(255, 35, 121, 1),
              borderColor: Color.fromARGB(255, 28, 119, 0),
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: true,
            ),
          ),
 const SizedBox(height: 10), 
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: 
          Row(
            // Row for Date Picker start
            children: [
              Expanded(
                // Expanded start
                child: InkWell(
                  // InkWell start
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: eligibeDate,
                      firstDate: DateTime(1965),
                      lastDate: eligibeDate,
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _selectedDate = pickedDate;
                        appmodel!.dob = pickedDate;
                      });
                    }
                  },
                  
                  child: InputDecorator(
                    // InputDecorator start
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintText: _selectedDate == null
                          ? 'Select your birthday'
                          : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                     prefixIcon: const Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 28, 119, 0),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 35, 121, 1),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      _selectedDate == null
                          ? 'Select your birthday'
                          : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                      style: TextStyle(
                        color: _selectedDate == null
                            ? Colors.black.withOpacity(0.7)
                            : Colors.black,
                      ),
                    ),
                  ), // InputDecorator end
                ), // InkWell end
              ), // Expanded end
            ],
          ),
          ), 
 const SizedBox(height: 10), // SizedBox start and end
          Container(
            margin: EdgeInsets.only(left: 35, right: 10),
            child: Row(
              // Row start
              children: [
                const Text("Gender: "), // Text start and end
                Expanded(
                  // Expanded start
                  child: Row(
                    // Row start
                    children: [
                      Radio<String>(
                        // Radio for Male start
                        value: "Male",
                        groupValue: _selectedGender,
                        onChanged: (value) {

                          
                          setState(() {
                            _selectedGender = value;
                            appmodel!.gender = value;
                          });
                        },
                      ), // Radio for Male end
                      const Text("Male"), // Text for Male start and end
                    ],
                  ), // Row end
                ), // Expanded end
                Expanded(
                  // Expanded start
                  child: Row(
                    // Row start
                    children: [
                      Radio<String>(
                        // Radio for Female start
                        value: "Female",
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                            appmodel!.gender = value;
                          });
                        },
                      ), // Radio for Female end
                      const Text("Female"), // Text for Female start and end
                    ],
                  ), // Row end
                ), // Expanded end
              ],
            ),
          ),
            filePicker(
            isFileSelected,
            (file) => {
              setState(
                () {
                  appmodel!.cv = file.path;
                  isFileSelected = true;
                },
              )
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(height: 30),
          Center(
            child: FormHelper.submitButton(
              "submit",
              () {
                if (validateAndSave()) {
                   print(appmodel!.toJson());

                  setState(() {
                    isApiCallProcess = true;
                  });

                  APIService.submitform(
                    appmodel!,
                    postid,
                    isFileSelected,
                    // isEditMode,
                    // isImageSelected,
                  ).then(
                    (response) {
                      setState(() {
                        isApiCallProcess = false;
                      });

                      if (response) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/',
                          (route) => false,
                        );
                      } else {
                        FormHelper.showSimpleAlertDialog(
                          context,
                          Config.appName,
                          "Error occur",
                          "OK",
                          () {
                            Navigator.of(context).pop();
                          },
                        );
                      }
                    },
                  );
                }
              },
              btnColor: Colors.green,
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 15,
            ),
          ),
          const SizedBox(
            height: 20,
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
    }
    return false;
  }
  

  static Widget filePicker(
    bool isFileSelected,
    Function onFilePicked,
  ) {
   return Padding(
      padding: const EdgeInsets.only(left: 30), // Custom padding for the entire widget
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left)
        children: [
          const Text(
            "Upload Your CV or Resume:",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10.0),
          Center(
            child: Column(
              children: [
                
                SizedBox(
                  height: 45.0,
                  width: 75.0,
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: const Icon(Icons.file_present, size: 35.0),
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf'],
                      );

                      if (result != null) {
                        onFilePicked(File(result.files.single.path!));
                      }
                    },
                  ),
                ),
                const SizedBox(height: 2.0), // Add some spacing between the text and the button
                Text(
                  isFileSelected ? "File Selected" : "No File Selected",
                  style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), // Custom text style
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
  isValidURL(url) {
    return Uri.tryParse(url)?.hasAbsolutePath ?? false;
  }
}
