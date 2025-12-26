import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/utility.dart';
import '../model/chat_message_model.dart';

class SenderLocalDataSource {
  Future<List<ChatMessageModel>> fetchSenderMsg() async {
    try {
      await Future.delayed(const Duration(milliseconds: 900));

      final List<ChatMessageModel> parsedList = _dummyChatMessage.map((json) {
        return ChatMessageModel.fromJson(json);
      }).toList();

      Utility.showPrints(
        message: AppConstantString.dataParsedSuccessfully(
          parsedList.length.toString(),
        ),
      );

      return parsedList;
    } catch (e) {
      Utility.showPrints(
        message: AppConstantString.dataParsingError(
          e.toString(),
          "fetchSenderMsg",
        ),
      );
      rethrow;
    }
  }
}

final List<Map<String, dynamic>> _dummyChatMessage = [
  {
    "postId": 1,
    "id": 1,
    "name": "id labore ex et quam laborum",
    "email": "Eliseo@gardner.biz",
    "time": "4:30 PM",
    "body":
        "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium",
  },
  {
    "postId": 1,
    "id": 2,
    "name": "quo vero reiciendis velit similique earum",
    "email": "Jayne_Kuhic@sydney.com",
    "time": "4:28 PM",
    "body":
        "est natus enim nihil est dolore omnis voluptatem numquam\net omnis occaecati quod ullam at\nvoluptatem error expedita pariatur\nnihil sint nostrum voluptatem reiciendis et",
  },
  {
    "postId": 1,
    "id": 3,
    "name": "odio adipisci rerum aut animi",
    "email": "Nikita@garfield.biz",
    "time": "4:37 PM",
    "body":
        "quia molestiae reprehenderit quasi aspernatur\naut expedita occaecati aliquam eveniet laudantium\nomnis quibusdam delectus saepe quia accusamus maiores nam est\ncum et ducimus et vero voluptates excepturi deleniti ratione",
  },
  {
    "postId": 1,
    "id": 4,
    "name": "alias odio sit",
    "email": "Lew@alysha.tv",
    "time": "4:42 PM",
    "body":
        "non et atque\noccaecati deserunt quas accusantium unde odit nobis qui voluptatem\nquia voluptas consequuntur itaque dolor\net qui rerum deleniti ut occaecati",
  },
  {
    "postId": 1,
    "id": 5,
    "name": "vero eaque aliquid doloribus et culpa",
    "email": "Hayden@althea.biz",
    "time": "4:50 AM",
    "body":
        "harum non quasi et ratione\ntempore iure ex voluptates in ratione\nharum architecto fugit inventore cupiditate\nvoluptates magni quo et",
  },
];
