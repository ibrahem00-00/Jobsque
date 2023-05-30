class PortfolioModel {
  bool? status;

  var dataList = <Data>[];
  PortfolioModel();
  PortfolioModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    json['data'].forEach((element) {
      Data item = Data.fromJson(json: element);
      dataList.add(item);
    });


  }

}

class Data {
  int? id;
  String? cv_file;
  String? name;
  int? user_id;
  int? profile_id;
  Data.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    cv_file = json['cv_file'];
    name = json['name'];
    user_id = json['user_id'];
    profile_id = json['profile_id'];
  }
}