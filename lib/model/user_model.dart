class UserModel {
  final String userId;
  final String userName;
  final String userImage;

  UserModel({
    this.userId,
    this.userName,
    this.userImage,
  });
}

class UserModelData {
  List<UserModel> userData1 = [
    UserModel(
      userId: "3",
      userName: "Elon Mask",
      userImage:
          "https://content.fortune.com/wp-content/uploads/2021/02/GettyImages-1229901940.jpg",
    ),
    UserModel(
      userId: "2",
      userName: "Tim Cook",
      userImage:
          "https://photos5.appleinsider.com/gallery/37111-69508-Tim-Cook-Onstage-xl.jpg",
    ),
    UserModel(
      userId: "1",
      userName: "Ricky",
      userImage:
          "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
    ),
  ];

  List<UserModel> userData2 = [
    UserModel(
      userId: "4",
      userName: "Chris",
      userImage:
          "https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    ),
    UserModel(
      userId: "4",
      userName: "Shorr",
      userImage:
          "https://images.pexels.com/photos/1310522/pexels-photo-1310522.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    ),
  ];
}
