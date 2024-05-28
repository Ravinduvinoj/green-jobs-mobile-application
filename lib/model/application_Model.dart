class ApplicationModel {
  late String? name;
  late int? contact;
  late String? address;
  late String? city;
  late String? gender;
  late DateTime? dob;
  late String? cv;
//  late String? jobseeker;

  ApplicationModel({
    this.name,
    this.contact,
    this.address,
    this.city,
    this.gender,
    this.dob,
    this.cv
    //  this.jobseeker,
  });

  ApplicationModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    contact = json["contact"];
    address = json["address"];
    city = json["city"];
    gender = json["gender"];
    dob = DateTime.tryParse(json["dob"] ?? "");
    cv = json["cv"];
    // jobseeker= json["jobseeker"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['contact'] = contact;
    _data['address'] = address;
    _data['city'] = city;
    _data['gender'] = gender;
    _data['dob'] = dob;
    _data['cv'] = cv;
    //  _data['jobseeker']=jobseeker;
    return _data;
  }
}
