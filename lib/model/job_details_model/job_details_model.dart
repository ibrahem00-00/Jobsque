// class JobDetailsModel {
//   bool? status;
//
//   static var dataList = <Data>[];
//
//   JobDetailsModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     json['data'].forEach((element) {
//       Data item = Data.fromJson(json: element);
//       dataList.add(item);
//     });
//
//
//   }
//
// }

class JobDetailsModel {
  int? id;
  String? name;
  String? image;
  String? job_time_type;
  String? job_type;
  String? job_level;
  String? job_description;
  String? job_skill;
  String? comp_name;
  String? comp_email;
  String? comp_website;
  String? about_comp;
  String? location;
  String? salary;
  int? favorites;
  int? expired;

  JobDetailsModel();

  JobDetailsModel.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    job_time_type = json['job_time_type'];
    job_type = json['job_type'];
    job_level = json['job_level'];
    job_description = json['job_description'];
    job_skill = json['job_skill'];
    comp_name = json['comp_name'];
    comp_email = json['comp_email'];
    comp_website = json['comp_website'];
    about_comp = json['about_comp'];
    location = json['location'];
    salary = json['salary'];
    favorites = json['favorites'];
    expired = json['expired'];
  }
}