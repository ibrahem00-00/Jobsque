class ShowSavedJobsModel {
  bool? status;

   var dataList = <Data>[];
  ShowSavedJobsModel();
  ShowSavedJobsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    json['data'].forEach((element) {
      Data item = Data.fromJson(json: element);
      dataList.add(item);
    });


  }

}

class Data {
  int? id;
  int? user_id;
  int? like;
  int? job_id;
  String? image;
  String? name;
  String? location;
  String? comp_name;
  Data.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    user_id = json['user_id'];
    like = json['like'];
    job_id = json['job_id'];
    image = json['image'];
    name = json['name'];
    location = json['location'];
    comp_name = 'AMIT';
  }
}