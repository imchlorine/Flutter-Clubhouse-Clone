import 'package:ClubHouseClone/model/user_model.dart';

class TopicModel {
  final String topicId;
  final String clubName;
  final String topicTitle;
  final List<UserModel> users;
  final int audienceNumber;
  final int speechNumber;

  TopicModel({
    this.topicId,
    this.clubName,
    this.topicTitle,
    this.users,
    this.audienceNumber,
    this.speechNumber,
  });
}

class TopicModelData {
  List<TopicModel> topicData = [
    TopicModel(
        topicId: "1",
        clubName: "My club",
        topicTitle: "How are you? Welcome to My room, let's have a talk!! ",
        users: UserModelData().userData1,
        audienceNumber: 1000,
        speechNumber: 5),
    TopicModel(
        topicId: "2",
        clubName: "TECH TALKS",
        topicTitle: "Flutter vs React Native",
        users: UserModelData().userData2,
        audienceNumber: 510,
        speechNumber: 10),
    TopicModel(
        topicId: "3",
        topicTitle: "Coffee",
        users: UserModelData().userData1,
        audienceNumber: 10,
        speechNumber: 2),
  ];
}
