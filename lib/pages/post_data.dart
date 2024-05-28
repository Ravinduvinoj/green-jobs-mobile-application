import 'package:flutter/material.dart';
import 'package:mobileapp/config.dart';
import 'package:mobileapp/model/post_model.dart';
// ignore: unused_import
import 'package:snippet_coder_utils/FormHelper.dart';

class AddPost extends StatelessWidget {
  final PostModel? model;
  final Function? onDelete;

  AddPost({
    super.key,
    this.model,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: post(context),
      ),
    );
  }

  Widget post(context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromARGB(255, 136, 218, 140), width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 90,
            alignment: Alignment.center,
            margin: EdgeInsets.all(8),
            child: Image.network(
              "http://${Config.apiURL}/${model!.image}",
              height: 100,
              fit: BoxFit.scaleDown,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model!.jobTitle!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Closed by ,${model!.closingDate!}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 199, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Location - ${model!.city}, ${model!.country}",
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 1,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 170,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: FormHelper.submitButton("View", () {
                          Navigator.of(context).pushNamed('/Adview',
                          arguments:{
                            'postmodel':model

                          });
                        },
                            btnColor: Color.fromARGB(255, 5, 131, 32),
                            borderColor: Colors.white,
                            txtColor: Colors.white,
                            borderRadius: 15,
                            width: 60,
                            height: 40,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
