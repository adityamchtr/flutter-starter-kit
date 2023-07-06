import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_starter_kit/app/data/preference/session_manager.dart';
import 'package:flutter_starter_kit/app/network/api_exception.dart';
import 'package:flutter_starter_kit/flavors/build_config.dart';

class Api {

  static const Duration _connectTimeout = Duration(seconds: 10);
  static const Duration _receiveTimeout = Duration(seconds: 15);

  static Future getResponse(String path, {Map<String, dynamic>? parameters}) async {

    String? token = await SessionManager.getAccessToken();

    BaseOptions options = BaseOptions(
        baseUrl: BuildConfig.instance.config.baseUrl,
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
        headers: {
          if(token != null) "Authorization": "Bearer $token",
          "X-API-KEY": BuildConfig.instance.config.apiKey,
          "accept": "application/json",
        }
    );

    try {
      Response response = await Dio(options).get(
          path,
          queryParameters: parameters
      );
      return returnResponse(response);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout) {
        throw FetchDataException("Request Timeout");
      } else if (e.type == DioExceptionType.unknown) {
        if (e.error is SocketException) {
          throw FetchDataException("No Internet Connection");
        } else {
          returnResponse(e.response!);
        }
      } else {
        returnResponse(e.response!);
      }
    }
  }

  static Future postResponse(String path, {dynamic data, Map<String, dynamic>? parameters}) async {

    String? token = await SessionManager.getAccessToken();

    BaseOptions options = BaseOptions(
        baseUrl: BuildConfig.instance.config.baseUrl,
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
        headers: {
          if(token != null) "Authorization": "Bearer $token",
          "X-API-KEY": BuildConfig.instance.config.apiKey,
          "accept": "application/json",
        }
    );

    try {
      Response response = await Dio(options).post(
          path,
          data: data,
          queryParameters: parameters
      );
      return returnResponse(response);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout) {
        throw FetchDataException("Request Timeout");
      } else if (e.type == DioExceptionType.unknown) {
        if (e.error is SocketException) {
          throw FetchDataException("No Internet Connection");
        } else {
          returnResponse(e.response!);
        }
      } else {
        returnResponse(e.response!);
      }
    }
  }

  static Future putResponse(String path, {dynamic data, Map<String, dynamic>? parameters}) async {

    String? token = await SessionManager.getAccessToken();

    BaseOptions options = BaseOptions(
        baseUrl: BuildConfig.instance.config.baseUrl,
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
        headers: {
          if(token != null) "Authorization": "Bearer $token",
          "X-API-KEY": BuildConfig.instance.config.apiKey,
          "accept": "application/json",
        }
    );

    try {
      Response response = await Dio(options).put(
          path,
          data: data,
          queryParameters: parameters
      );
      return returnResponse(response);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout) {
        throw FetchDataException("Request Timeout");
      } else if (e.type == DioExceptionType.unknown) {
        if (e.error is SocketException) {
          throw FetchDataException("No Internet Connection");
        } else {
          returnResponse(e.response!);
        }
      } else {
        returnResponse(e.response!);
      }
    }
  }

  static Future deleteResponse(String path, {dynamic data, Map<String, dynamic>? parameters}) async {

    String? token = await SessionManager.getAccessToken();

    BaseOptions options = BaseOptions(
        baseUrl: BuildConfig.instance.config.baseUrl,
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
        headers: {
          if(token != null) "Authorization": "Bearer $token",
          "X-API-KEY": BuildConfig.instance.config.apiKey,
          "accept": "application/json",
        }
    );

    try {
      Response response = await Dio(options).delete(
          path,
          data: data,
          queryParameters: parameters
      );
      return returnResponse(response);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout) {
        throw FetchDataException("Request Timeout");
      } else if (e.type == DioExceptionType.unknown) {
        if (e.error is SocketException) {
          throw FetchDataException("No Internet Connection");
        } else {
          returnResponse(e.response!);
        }
      } else {
        returnResponse(e.response!);
      }
    }
  }

  static Future postUploadResponse(String path, {dynamic data, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) async {

    String? token = await SessionManager.getAccessToken();

    BaseOptions options = BaseOptions(
        baseUrl: BuildConfig.instance.config.baseUrl,
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
        headers: {
          if(token != null) "Authorization": "Bearer $token",
          "X-API-KEY": BuildConfig.instance.config.apiKey,
          "accept": "*/*",
          "Content-Type": "multipart/form-data",
        }
    );

    try {
      Response response = await Dio(options).post(
          path,
          data: data,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress
      );
      return returnResponse(response);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout) {
        throw FetchDataException("Request Timeout");
      } else if (e.type == DioExceptionType.unknown) {
        if (e.error is SocketException) {
          throw FetchDataException("No Internet Connection");
        } else {
          returnResponse(e.response!);
        }
      } else {
        returnResponse(e.response!);
      }
    }
  }

  static dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(response.data["message"]);
      case 401:
        throw UnauthorisedException(response.data["message"]);
      case 403:
        throw ForbiddenException(response.data["message"]);
      case 404:
        throw NotFoundException(response.data["message"]);
      case 500:
        throw InternalServerError(response.data["message"]);
      default:
        throw FetchDataException("Error code ${response.statusCode} - ${response.statusMessage}");
    }
  }
}