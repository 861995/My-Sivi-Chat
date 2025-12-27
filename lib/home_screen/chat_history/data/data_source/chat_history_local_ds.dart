import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/utility.dart';
import '../model/chat_history_model.dart';

class ChatHistoryLocalDataSource {
  Future<List<ChatHistoryModel>> fetchChatHistory() async {
    try {
      await Future.delayed(const Duration(milliseconds: 900));

      final List<ChatHistoryModel> parsedList = _dummyChatHistoryData.map((
        json,
      ) {
        return ChatHistoryModel.fromJson(json);
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
          "fetchChatHistory",
        ),
      );
      rethrow;
    }
  }
}

final List<Map<String, dynamic>> _dummyChatHistoryData = [
  {
    "userId": 1,
    "userLastMsg": "Hello!",
    "userName": "Azar",
    "lastSeen": _currentTime(),
    "unOpenedCount": 3,
  },
  {
    "userId": 2,
    "userLastMsg": "Bye",
    "userName": "Hero",
    "lastSeen": "2025-12-27 14:27:00",
    "unOpenedCount": 1,
  },
  {
    "userId": 3,
    "userLastMsg": "How are you?",
    "userName": "Vikram",
    "lastSeen": "2025-12-27 14:24:00",
    "unOpenedCount": 0,
  },
  {
    "userId": 4,
    "userLastMsg": "Meeting done",
    "userName": "Dhanush",
    "lastSeen": "2025-12-27 14:24:00",
    "unOpenedCount": 2,
  },
  {
    "userId": 5,
    "userLastMsg": "Call me back",
    "userName": "David",
    "lastSeen": _currentTime(),
    "unOpenedCount": 4,
  },
  {
    "userId": 6,
    "userLastMsg": "Thanks!",
    "userName": "Elizabeth",
    "lastSeen": _currentTime(),
    "unOpenedCount": 0,
  },
  {
    "userId": 7,
    "userLastMsg": "Let’s start",
    "userName": "Michael Jackson",
    "lastSeen": "2025-12-27 14:19:00",
    "unOpenedCount": 5,
  },
  {
    "userId": 8,
    "userLastMsg": "On my way",
    "userName": "Olly",
    "lastSeen": "2025-12-27 14:14:00",
    "unOpenedCount": 1,
  },
  {
    "userId": 9,
    "userLastMsg": "Done 👍",
    "userName": "Danny",
    "lastSeen": "2025-12-27 14:19:00",
    "unOpenedCount": 0,
  },
  {
    "userId": 10,
    "userLastMsg": "Check mail",
    "userName": "Ava",
    "lastSeen": "2025-12-27 14:09:00",
    "unOpenedCount": 2,
  },
  {
    "userId": 11,
    "userLastMsg": "Good morning",
    "userName": "Noah",
    "lastSeen": "2025-12-27 14:19:00",
    "unOpenedCount": 3,
  },
  {
    "userId": 12,
    "userLastMsg": "Approved",
    "userName": "Hero Man",
    "lastSeen": "2025-12-27 14:04:00",
    "unOpenedCount": 0,
  },
  {
    "userId": 13,
    "userLastMsg": "Where are you?",
    "userName": "Ayan",
    "lastSeen": _currentTime(),
    "unOpenedCount": 2,
  },
  {
    "userId": 14,
    "userLastMsg": "Almost there",
    "userName": "Mia Ka",
    "lastSeen": "2025-12-27 13:59:00",
    "unOpenedCount": 1,
  },
  {
    "userId": 15,
    "userLastMsg": "Let’s talk",
    "userName": "Lucas",
    "lastSeen": "2025-12-27 13:29:00",
    "unOpenedCount": 0,
  },
  {
    "userId": 16,
    "userLastMsg": "Busy now",
    "userName": "Charlotte",
    "lastSeen": "2025-12-27 14:19:00",
    "unOpenedCount": 4,
  },
  {
    "userId": 17,
    "userLastMsg": "Send files",
    "userName": "Henry Cavil",
    "lastSeen": _currentTime(),
    "unOpenedCount": 1,
  },
  {
    "userId": 18,
    "userLastMsg": "Ok 👍",
    "userName": "Amelia",
    "lastSeen": "2025-12-27 14:19:00",
    "unOpenedCount": 2,
  },
  {
    "userId": 19,
    "userLastMsg": "See you tomorrow",
    "userName": "James Vasanthan",
    "lastSeen": "2025-12-27 11:29:00",
    "unOpenedCount": 0,
  },
  {
    "userId": 20,
    "userLastMsg": "Good night",
    "userName": "Harper carpenter",
    "lastSeen": "2025-12-26 14:29:00",
    "unOpenedCount": 1,
  },
];
String _currentTime() {
  return DateTime.now().toString();
}
