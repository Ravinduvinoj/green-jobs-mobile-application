List<PostModel> postFromJson(dynamic str) =>
    List<PostModel>.from((str).map((x) => PostModel.fromJson(x)));

class PostModel {
  late String? id;
  late String? position_summary;
  late String? jobTitle;
  late String? country;
  late String? city;
  late String? job_description;
  late String? closingDate;
  late String? jobCategory;
  late String? requirement1;
  late String? requirement2;
  late String? image;

  PostModel({
    this.id,
    this.position_summary,
    this.jobTitle,
    this.jobCategory,
    this.closingDate,
    this.country,
    this.city,
    this.job_description,
    this.requirement1,
    this.requirement2,
    this.image,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    position_summary = json['position_summary'];
    jobTitle = json['job_title'];
    jobCategory = json['jobsubcategory'];
    closingDate = json['ad_closing_date'];
    country = json['country'];
    city = json['city'];
    job_description = json['job_description'];
    requirement1 = json['requirement1'];
    requirement2 = json['requirement2'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['position_summary'] = position_summary;
    _data['job_title'] = jobTitle;
    _data['jobsubcategory'] = jobCategory;
    _data['ad_closing_date'] = closingDate;
    _data['country'] = country;
    _data['city'] = city;
    _data['job_description'] = job_description;
    _data['requirement1'] = requirement1;
    _data['requirement2'] = requirement2;
    _data['image'] = image;
    return _data;
  }
}
