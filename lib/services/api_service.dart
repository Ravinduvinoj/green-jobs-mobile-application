import 'dart:convert';
// ignore: unused_import
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mobileapp/model/application_Model.dart';
import 'package:mobileapp/model/post_model.dart';

import '../../config.dart';

class APIService {
  static var client = http.Client();

  static Future<List<PostModel>?> getPost() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.postAPI,
    );

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return postFromJson(data["data"]);

      //return true;
    } else {
      return null;
    }
  }

  static Future<bool> submitapplication(
    ApplicationModel model,
    var postid,
  ) async {
    var applyURL = Config.apply;
    applyURL = applyURL + postid.toString();
    print(postid);
    var url = Uri.http(Config.apiURL, applyURL);

    var request = http.MultipartRequest("POST", url);
    request.fields["name"] = model.name!;
    request.fields["address"] = model.address!;
    // request.fields["city"] = model.city!;
    // request.fields["gender"] = model.gender!;
    //  request.fields["contact"] = model.contact!.toString();
    //   request.fields["dob"] = model.dob!.timeZoneName;
    //    request.fields["jobseeker"] = model.jobseeker!;
    var response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> submitform(
    ApplicationModel model,
    var postid,
    bool isFileSelected,
  ) async {
    // var productURL = '${Config.apply}$postid/${model.name!}/${model.contact.toString()}/${model.city}/${model.address}/${model.dob}/${model.gender}';
    var productURL = Config.apply + postid;
    var url = Uri.http(Config.apiURL, productURL);

    var requestMethod = "POST";

    var request = http.MultipartRequest(requestMethod, url);

    request.fields["name"] = model.name!;
    request.fields["contact"] = model.contact!.toString();
    request.fields["address"] = model.address!;
    request.fields["city"] = model.city!;
    request.fields["gender"] = model.gender!;
    request.fields["dob"] = model.dob!.toString();

    if (model.cv != null && isFileSelected) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'cvFile',
        model.cv!,
      );
      request.files.add(multipartFile);
    }
    print(postid);
    print(url);
    print(request.fields);
    var response = await request.send();
    try {
      if (response.statusCode == 200) {
        return true;
      } else {
        print('Failed to save product. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error occurred: $e');
      return false;
    }
  }
}
