class ChatsModel {
  bool? status;

 static var dataList = <Data>[];
  ChatsModel();
  ChatsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    json['data'].forEach((element) {
      Data item = Data.fromJson(json: element);
      dataList.add(item);
    });


  }

}

class Data {
  int? id;
  String? massage;
  String? sender_user;
  int? user_id;
  int? comp_id;
  Data.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    massage = json['massage'];
    comp_id = json['comp_id'];
    sender_user = json['sender_user'];
  }
}