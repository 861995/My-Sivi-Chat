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
    "userName": "Alice",
    "lastSeen": "1 min ago",
    "unOpenedCount": 3,
  },
  {
    "userId": 2,
    "userLastMsg": "Bye",
    "userName": "Ram",
    "lastSeen": "2 min ago",
    "unOpenedCount": 1,
  },
  {
    "userId": 3,
    "userLastMsg": "How are you?",
    "userName": "John",
    "lastSeen": "5 min ago",
    "unOpenedCount": 0,
  },
  {
    "userId": 4,
    "userLastMsg": "Meeting done",
    "userName": "Sophia",
    "lastSeen": "5 min ago",
    "unOpenedCount": 2,
  },
  {
    "userId": 5,
    "userLastMsg": "Call me back",
    "userName": "David",
    "lastSeen": "3 min ago",
    "unOpenedCount": 4,
  },
  {
    "userId": 6,
    "userLastMsg": "Thanks!",
    "userName": "Emma",
    "lastSeen": "10 min ago",
    "unOpenedCount": 0,
  },
  {
    "userId": 7,
    "userLastMsg": "Let’s start",
    "userName": "Michael",
    "lastSeen": "10 min ago",
    "unOpenedCount": 5,
  },
  {
    "userId": 8,
    "userLastMsg": "On my way",
    "userName": "Olivia",
    "lastSeen": "15 min ago",
    "unOpenedCount": 1,
  },
  {
    "userId": 9,
    "userLastMsg": "Done 👍",
    "userName": "Daniel",
    "lastSeen": "10 min ago",
    "unOpenedCount": 0,
  },
  {
    "userId": 10,
    "userLastMsg": "Check mail",
    "userName": "Ava",
    "lastSeen": "20 min ago",
    "unOpenedCount": 2,
  },
  {
    "userId": 11,
    "userLastMsg": "Good morning",
    "userName": "Noah",
    "lastSeen": "10 min ago",
    "unOpenedCount": 3,
  },
  {
    "userId": 12,
    "userLastMsg": "Approved",
    "userName": "Isabella",
    "lastSeen": "25 min ago",
    "unOpenedCount": 0,
  },
  {
    "userId": 13,
    "userLastMsg": "Where are you?",
    "userName": "Ethan",
    "lastSeen": "10 min ago",
    "unOpenedCount": 2,
  },
  {
    "userId": 14,
    "userLastMsg": "Almost there",
    "userName": "Mia",
    "lastSeen": "30 min ago",
    "unOpenedCount": 1,
  },
  {
    "userId": 15,
    "userLastMsg": "Let’s talk",
    "userName": "Lucas",
    "lastSeen": "1 hour ago",
    "unOpenedCount": 0,
  },
  {
    "userId": 16,
    "userLastMsg": "Busy now",
    "userName": "Charlotte",
    "lastSeen": "10 min ago",
    "unOpenedCount": 4,
  },
  {
    "userId": 17,
    "userLastMsg": "Send files",
    "userName": "Henry",
    "lastSeen": "2 hours ago",
    "unOpenedCount": 1,
  },
  {
    "userId": 18,
    "userLastMsg": "Ok 👍",
    "userName": "Amelia",
    "lastSeen": "10 min ago",
    "unOpenedCount": 2,
  },
  {
    "userId": 19,
    "userLastMsg": "See you tomorrow",
    "userName": "James",
    "lastSeen": "3 hours ago",
    "unOpenedCount": 0,
  },
  {
    "userId": 20,
    "userLastMsg": "Good night",
    "userName": "Harper",
    "lastSeen": "Yesterday",
    "unOpenedCount": 1,
  },
];
