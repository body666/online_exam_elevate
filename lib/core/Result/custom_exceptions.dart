import 'package:dio/dio.dart';

class ServerError implements Exception {}

class NoInternetError implements Exception {}

class DioHttpError implements Exception {
  DioException? dioException;

  DioHttpError(this.dioException);
}
