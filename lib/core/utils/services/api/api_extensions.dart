import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:online_exam_elevate/core/Result/custom_exceptions.dart';

import '../../../Result/result.dart';

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall.call();

    return Success(result);
  } on TimeoutException catch (ex) {
    return Failure(NoInternetError());
  } on IOException catch (ex) {
    return Failure(NoInternetError());
  } on DioException catch (ex) {
    return Failure(DioHttpError(ex));
  } on Exception catch (ex) {
    return Failure(ex);
  }
}
