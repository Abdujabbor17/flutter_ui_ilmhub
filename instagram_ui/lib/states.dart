import 'models/post_model.dart';
import 'models/story_model.dart';

List<StoryModel> stories = [
  StoryModel("assets/images/user_1.jpeg", "Jasmin",isSeen: true),
  StoryModel("assets/images/user_2.jpeg", "Sylvester"),
  StoryModel("assets/images/user_3.jpeg", "Lavina"),
  StoryModel("assets/images/user_1.jpeg", "Jasmin"),
  StoryModel("assets/images/user_2.jpeg", "Sylvester",isSeen: true),
  StoryModel("assets/images/user_3.jpeg", "Lavina"),
];

final List<PostModel> posts = [
  PostModel(
      username: "Brianne",
      userImage: "assets/images/user_1.jpeg",
      postImage: "assets/images/feed_1.jpeg",
      caption: "Consequatur nihil aliquid omnis consequatur."),
  PostModel(
      username: "Henri",
      userImage: "assets/images/user_2.jpeg",
      postImage: "assets/images/feed_2.jpeg",
      caption: "Consequatur nihil aliquid omnis consequatur."),
  PostModel(
      username: "Mariano",
      userImage: "assets/images/user_3.jpeg",
      postImage: "assets/images/feed_3.jpeg",
      caption: "Consequatur nihil aliquid omnis consequatur."),

];