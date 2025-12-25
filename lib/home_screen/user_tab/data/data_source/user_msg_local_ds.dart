import 'package:my_sivi_chat/home_screen/user_tab/data/model/user_msg_model.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/utility.dart';

class UserMsgLocalDataSource {
  Future<List<UserMsgModel>> fetchUserMsg() async {
    try {
      await Future.delayed(const Duration(milliseconds: 900));

      final List<UserMsgModel> parsedList = _dummyUserMsgData.map((json) {
        return UserMsgModel.fromJson(json);
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
          "fetchUserMsg",
        ),
      );
      rethrow;
    }
  }
}

final List<Map<String, dynamic>> _dummyUserMsgData = [
  {
    "userId": 1,
    "userLastMsg": "Hello there!",
    "userName": "Alice",
    "lastSeen": "online",
  },
  {
    "userId": 2,
    "userLastMsg": "See you later",
    "userName": "Ram",
    "lastSeen": "2 min ago",
  },
  {
    "userId": 3,
    "userLastMsg": "How are you?",
    "userName": "John",
    "lastSeen": "5 min ago",
  },
  {
    "userId": 4,
    "userLastMsg": "Meeting done",
    "userName": "Sophia",
    "lastSeen": "10 min ago",
  },
  {
    "userId": 5,
    "userLastMsg": "Call me back",
    "userName": "David",
    "lastSeen": "online",
  },
  {
    "userId": 6,
    "userLastMsg": "Thanks!",
    "userName": "Emma",
    "lastSeen": "15 min ago",
  },
  {
    "userId": 7,
    "userLastMsg": "Let’s start",
    "userName": "Michael",
    "lastSeen": "20 min ago",
  },
  {
    "userId": 8,
    "userLastMsg": "On my way",
    "userName": "Olivia",
    "lastSeen": "online",
  },
  {
    "userId": 9,
    "userLastMsg": "Done 👍",
    "userName": "Daniel",
    "lastSeen": "25 min ago",
  },
  {
    "userId": 10,
    "userLastMsg": "Check mail",
    "userName": "Ava",
    "lastSeen": "30 min ago",
  },
  {
    "userId": 11,
    "userLastMsg": "Good morning",
    "userName": "Noah",
    "lastSeen": "online",
  },
  {
    "userId": 12,
    "userLastMsg": "Approved",
    "userName": "Isabella",
    "lastSeen": "40 min ago",
  },
  {
    "userId": 13,
    "userLastMsg": "Where are you?",
    "userName": "Ethan",
    "lastSeen": "45 min ago",
  },
  {
    "userId": 14,
    "userLastMsg": "Almost there",
    "userName": "Mia",
    "lastSeen": "online",
  },
  {
    "userId": 15,
    "userLastMsg": "Let’s talk",
    "userName": "Lucas",
    "lastSeen": "1 hour ago",
  },
  {
    "userId": 16,
    "userLastMsg": "Busy now",
    "userName": "Charlotte",
    "lastSeen": "1 hour ago",
  },
  {
    "userId": 17,
    "userLastMsg": "Send files",
    "userName": "Henry",
    "lastSeen": "2 hours ago",
  },
  {
    "userId": 18,
    "userLastMsg": "Ok 👍",
    "userName": "Amelia",
    "lastSeen": "online",
  },
  {
    "userId": 19,
    "userLastMsg": "See you tomorrow",
    "userName": "James",
    "lastSeen": "3 hours ago",
  },
  {
    "userId": 20,
    "userLastMsg": "Good night",
    "userName": "Harper",
    "lastSeen": "Yesterday",
  },
];
