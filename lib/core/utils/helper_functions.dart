import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:online_exam_elevate/core/Result/custom_exceptions.dart';

import 'dialoges.dart';

String extractErrorMessage(Exception? exception) {
  if (exception == null) {
    return 'something went wrong! Try later';
  }
  if (exception is NoInternetError) {
    return 'No internet! check your network';
  }
  if (exception is DioHttpError) {
    log(exception.dioException?.message.toString() ??
        "=======================error");
    return exception.dioException?.message ?? 'Something went wrong! Try later';
  }
  if (exception is ServerError) {
    return 'Server error! Please try later';
  }
  return 'Something went wrong! Try later';
}

void popIfCan(BuildContext context) {
  if (Navigator.canPop(context)) {
    Navigator.pop(context);
  }
}

void handleFailureState(BuildContext context, Exception? exception) {
  popIfCan(context);
  final message = extractErrorMessage(exception);
  showErrorDialog(context: context, message: message);
}
