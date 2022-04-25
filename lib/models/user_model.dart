class UserModel {

  String? userID;
  String? userName;
  String? name;
  String? empID;
  String? jobTitle;
  String? department;
  String? avatar;

  UserModel({
    this.userID,
    this.userName,
    this.name,
    this.empID,
    this.jobTitle,
    this.department,
    this.avatar
  });

  UserModel.fromJSON(Map<String, dynamic> json){
      userID = json['userID'];
      userName = json['userName'];
      name = json['name'];
      empID = json['empID'];
      jobTitle = json['jobTitle'];
      department = json['department'];
      avatar = json['avatar'];
  }

}