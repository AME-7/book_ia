import 'package:book_ia/core/services/dio/apis.dart';
import 'package:book_ia/core/services/dio/base_respons.dart';
import 'package:book_ia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class DioProvider {
  static late final Dio dio;

  static void init() {
    dio = Dio(BaseOptions(baseUrl: Apis.baseUrl));
  }

  static Future<Either<Failure, dynamic>> postApi({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return _handleResponse(response);
      } else {
        return Left(Failure(message: response.data['message']));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } on Exception catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  static Future<Either<Failure, dynamic>> getApi({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.get(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return _handleResponse(response);
      } else {
        return Left(ApiFailure(message: response.data['message']));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } on Exception catch (_) {
      return Left(UnknownFailure(message: "Something went wrong"));
    }
  }

  static Either<Failure, dynamic> _handleResponse(Response<dynamic> response) {
    var json = response.data as Map<String, dynamic>;
    if (json.containsKey('dats')) {
      try {
        var baseResponse = BaseRespons.fromJson(response.data);
        return Right(baseResponse.data);
      } on Exception catch (e) {
        return Left(ParseFailure(message: e.toString()));
      }
    } else {
      return Right(response.data);
    }
  }

  static Future<Either<Failure, dynamic>> putApi({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return _handleResponse(response);
      } else {
        return Left(ApiFailure(message: response.data['message']));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } on Exception catch (_) {
      return Left(UnknownFailure(message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, dynamic>> deleteApi({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return _handleResponse(response);
      } else {
        return Left(ApiFailure(message: response.data['message']));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } on Exception catch (_) {
      return Left(UnknownFailure(message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, dynamic>> patchApi({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.patch(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return _handleResponse(response);
      } else {
        return Left(ApiFailure(message: response.data['message']));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } on Exception catch (_) {
      return Left(UnknownFailure(message: "Something went wrong"));
    }
  }

  static Failure _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return NetworkFailure(
          message: 'No internet connection',
          statusCode: e.response?.statusCode,
        );

      case DioExceptionType.badResponse:
        return ApiFailure(message: e.response?.data['message']);

      case DioExceptionType.cancel:
        return ApiFailure(
          message: 'Request was cancelled',
          statusCode: e.response?.statusCode,
        );

      case DioExceptionType.unknown:
        return UnknownFailure(
          message: 'Something went wrong',
          statusCode: e.response?.statusCode,
        );

      default:
        return UnknownFailure(
          message: 'Something went wrong',
          statusCode: e.response?.statusCode,
        );
    }
  }

  static Future<Response> post({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.post(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  static Future<Response> get({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.get(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  static Future<Response> put({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.put(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  static Future<Response> delete({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.delete(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  static Future<Response> patch({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.patch(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }
}
