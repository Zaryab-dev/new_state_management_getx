import 'package:flutter/material.dart';

class AppException implements Exception {
  final _prefix;

  final _message;

  AppException([this._message, this._prefix]);

  String toString() {
    return '$_prefix $_message';
  }
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message!, "No Internet");
}

class RequestTimeOut extends AppException {
  RequestTimeOut([String? message]) : super(message!, "Request timeout");
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message!, "Internal Server error");
}
class InvalidUrlException extends AppException {
  InvalidUrlException([String? message]) : super(message!, "Invalid URl");
}
class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message!, "Error while communicating with server!");
}
