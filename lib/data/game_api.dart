import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:wordddle/data/constants.dart';
import 'package:wordddle/domain/models/failure.dart';

abstract class GameApi {
  Future<Either<Failure, bool>> checkWordExistence(String word);
}

class GameApiImpl implements GameApi {
  @override
  Future<Either<Failure, bool>> checkWordExistence(String word) async {
    Uri url = Uri.parse(ApiConstants.fetchUrl + word);
    Map<String, String> headers = {
      "app_id": ApiConstants.apiAppId,
      "app_key": ApiConstants.apiKey,
    };

    try {
      http.Response response = await http.get(url, headers: headers);
      return Right(response.statusCode == 200);
    } catch (e) {
      return Left(Failure('Something went wrong. Try again later.'));
    }
  }
}
