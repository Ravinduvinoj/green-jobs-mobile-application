
import 'package:flutter/material.dart';
import 'package:mobileapp/config.dart';

import 'package:mobileapp/model/post_model.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class Addshow extends StatefulWidget {
  const Addshow({super.key});

  @override
  State<Addshow> createState() => _AddshowState();
}

class _AddshowState extends State<Addshow> {
  PostModel? postmodel;
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isApiCallProcess = false;


  @override
  void initState() {
    super.initState();
    postmodel = PostModel();

    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
        postmodel = arguments['postmodel'];
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${postmodel?.jobTitle}',
        style: const TextStyle(
          color: Colors.white,
        ),),
        elevation: 0,
        backgroundColor: Colors.green,
      ),
      backgroundColor: Color.fromARGB(255, 229, 255, 199),
      body: ProgressHUD(
        child: Form(
          key: globalFormKey,
          child: adForm(),
        ),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
        key: UniqueKey(),
      ),
    );
  }

  Widget adForm() {
    return SingleChildScrollView(

        //added const in ide i dont knw that
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 15, right: 10),
            child: Text(
              'Description : ${postmodel?.job_description}',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 199, 0),
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Image.network(
              "http://${Config.apiURL}/${postmodel?.image}",
              height: 490,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 20, right: 10),
            child: Text(
              '-> Dead line : ${postmodel?.closingDate}',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 20, right: 10),
            child: Text(
              '-> Possition Summary : ${postmodel?.position_summary}',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            margin: EdgeInsets.only(left: 20, right: 10),
            child: Text(
              '-> Requirements, ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 2),
          Container(
            margin: EdgeInsets.only(left: 35, right: 15),
            child: Text(
              '* ${postmodel?.requirement1}',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 2),
          Container(
            margin: EdgeInsets.only(left: 35, right: 15),
            child: Text(
              '* ${postmodel?.requirement2}',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
            SizedBox(height: 5),
          Container(
            margin: EdgeInsets.only(left: 20, right: 10),
            child: Text(
              '-> Location : ${postmodel!.city} , ${postmodel!.country} ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 22),
          ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, 
                  backgroundColor: Color.fromARGB(255, 8, 128, 12),
                  
                  minimumSize: const Size(400, 50),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    
                  ),
                ),
                onPressed: () {
                    Navigator.of(context).pushNamed('/apply',
                          arguments:{
                            'post':postmodel!.id

                          });

                },
                child: const Text('Apply Now',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800
                ),
                ),
                
              ),
        ]));
  }



}
