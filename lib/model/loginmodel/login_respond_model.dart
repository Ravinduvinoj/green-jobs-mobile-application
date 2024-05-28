
import 'dart:convert';

LoginResponseModel loginResponseJson(String str)=>
LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
    LoginResponseModel({
        required this.message,
        required this.id,
        required this.jobSeekerName,
        required this.email,
        required this.password,
        required this.userRole,
        required this.token,
    });

    final String? message;
    final String? id;
    final String? jobSeekerName;
    final String? email;
    final String? password;
    final String? userRole;
    final String? token;

    factory LoginResponseModel.fromJson(Map<String, dynamic> json){ 
        return LoginResponseModel(
            message: json["message"],
            id: json["_id"],
            jobSeekerName: json["job_Seeker_Name"],
            email: json["email"],
            password: json["password"],
            userRole: json["userRole"],
            token: json["token"],
        );
    }

    Map<String, dynamic> toJson() => {
        "message": message,
        "_id": id,
        "job_Seeker_Name": jobSeekerName,
        "email": email,
        "password": password,
        "userRole": userRole,
        "token": token,
    };

}