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
    "lastSeen": _currentTime(),
  },
  {
    "userId": 2,
    "userLastMsg": "See you later",
    "userName": "Ram",
    "lastSeen": "2025-12-27 14:26:00",
  },
  {
    "userId": 3,
    "userLastMsg": "How are you?",
    "userName": "John",
    "lastSeen": "2025-12-27 14:24:00",
  },
  {
    "userId": 4,
    "userLastMsg": "Meeting done",
    "userName": "Sophia",
    "lastSeen": _currentTime(),
  },
  {
    "userId": 5,
    "userLastMsg": "Call me back",
    "userName": "David",
    "lastSeen": "2025-12-27 14:28:30",
  },
  {
    "userId": 6,
    "userLastMsg": "Thanks!",
    "userName": "Emma",
    "lastSeen": "2025-12-27 14:13:00",
  },
  {
    "userId": 7,
    "userLastMsg": "Let’s start",
    "userName": "Michael",
    "lastSeen": "2025-12-27 14:08:00",
  },
  {
    "userId": 8,
    "userLastMsg": "On my way",
    "userName": "Olivia",
    "lastSeen": _currentTime(),
  },
  {
    "userId": 9,
    "userLastMsg": "Done 👍",
    "userName": "Daniel",
    "lastSeen": "2025-12-27 14:03:00",
  },
  {
    "userId": 10,
    "userLastMsg": "Check mail",
    "userName": "Ava",
    "lastSeen": "2025-12-27 13:58:00",
  },
  {
    "userId": 11,
    "userLastMsg": "Good morning",
    "userName": "Noah",
    "lastSeen": "2025-12-27 14:29:10",
  },
  {
    "userId": 12,
    "userLastMsg": "Approved",
    "userName": "Isabella",
    "lastSeen": _currentTime(),
  },
  {
    "userId": 13,
    "userLastMsg": "Where are you?",
    "userName": "Ethan",
    "lastSeen": "2025-12-27 13:44:00",
  },
  {
    "userId": 14,
    "userLastMsg": "Almost there",
    "userName": "Mia",
    "lastSeen": "2025-12-27 14:28:45",
  },
  {
    "userId": 15,
    "userLastMsg": "Let’s talk",
    "userName": "Lucas",
    "lastSeen": "2025-12-27 13:29:00",
  },
  {
    "userId": 16,
    "userLastMsg": "Busy now",
    "userName": "Charlotte",
    "lastSeen": "2025-12-27 12:29:00",
  },
  {
    "userId": 17,
    "userLastMsg": "Send files",
    "userName": "Henry",
    "lastSeen": "2025-12-27 11:29:00",
  },
  {
    "userId": 18,
    "userLastMsg": "Ok 👍",
    "userName": "Amelia",
    "lastSeen": "2025-12-27 14:29:20",
  },
  {
    "userId": 19,
    "userLastMsg": "See you tomorrow",
    "userName": "James",
    "lastSeen": _currentTime(),
  },
  {
    "userId": 20,
    "userLastMsg": "Good night",
    "userName": "Harper",
    "lastSeen": "2025-12-25 14:29:00",
  },
];

String _currentTime() {
  return DateTime.now().toString();
}
