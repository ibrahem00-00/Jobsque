class EditProfileBioAddressMobileModel {
  int? id;
  int? user_id;
  String? name;
  String? email;
  String? mobile;
  String? address;
  String? language;
  String? intersted_work;
  String? offline_place;
  String? remote_place;
  String? bio;
  String? education_id;
  String? experience;
  String? personal_detailes;

  EditProfileBioAddressMobileModel();

  EditProfileBioAddressMobileModel.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    user_id = json['user_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    language = json['language'];
    intersted_work = json['intersted_work'];
    offline_place = json['offline_place'];
    remote_place = json['remote_place'];
    bio = json['bio'];
    education_id = json['education_id'];
    experience = json['experience'];
    personal_detailes = json['personal detailes'];
  }
}
