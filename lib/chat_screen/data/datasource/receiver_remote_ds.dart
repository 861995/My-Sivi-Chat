import 'package:dio/dio.dart';
import '../../../core/env/app_env.dart';
import '../../../core/network/api_service.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/utility.dart';
import '../model/chat_message_model.dart';

class ReceiverMsgRemoteDataSource {
  final ApiService apiService;

  ReceiverMsgRemoteDataSource({required this.apiService});

  Future<List<ChatMessageModel>> fetchRecieverMsg(
    CancelToken? cancelToken,
  ) async {
    try {
      final response = await apiService.get(
        AppEnv.chatApi,
        cancelToken: cancelToken,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> jsonList = response.data as List<dynamic>;

        final List<ChatMessageModel> parsedList = jsonList
            .map(
              (json) => ChatMessageModel.fromJson(json as Map<String, dynamic>),
            )
            .toList();

        Utility.showPrints(
          message: AppConstantString.dataParsedSuccessfully(
            parsedList.first.name,
          ),
        );

        return parsedList;
      } else {
        return [];
      }
    } on DioException catch (dioError) {
      Utility.showPrints(
        message: dioError.message ?? dioError.error.toString(),
      );
      rethrow;
    } catch (e) {
      Utility.showPrints(
        message: AppConstantString.dataParsingError(
          e.toString(),
          "fetchRecieverMsg",
        ),
      );
      rethrow;
    }
  }
}
