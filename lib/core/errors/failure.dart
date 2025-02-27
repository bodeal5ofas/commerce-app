import 'package:dio/dio.dart';
//import 'package:flutter/foundation.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: 'the Connection is time out');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'the Send is time out');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'the Receive is time out');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: 'incorrect certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponser(
            dioException.response!.statusCode, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: 'request is cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure(
            errorMessage: 'lost the internet connection, try later ');
      case DioExceptionType.unknown:
        return ServerFailure(errorMessage: 'unExpexted error,please try again');
      default:
        return ServerFailure(
            errorMessage: 'opps there was an error,from dio esception');
    }
  }

  factory ServerFailure.fromResponser(statuscode, response) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServerFailure(errorMessage: response["message"]);
    } else if (statuscode == 402) {
      return ServerFailure(errorMessage: 'Your Request Not found');
    } else if (statuscode == 409) {
      return ServerFailure(errorMessage: 'user already exist');
    } else if (statuscode == 500) {
      return ServerFailure(
          errorMessage: 'Internl Server Error,try again later');
    } else {
      return ServerFailure(
          errorMessage: 'opps There was an error,fromResponse');
    }
  }
}

// handle error
// catch (e) {
//     log(e.toString());
//     if (e is DioException) {
//       return left(ServerFailure.fromDioException(e));
//     }
//     return left(ServerFailure(errorMessage: e.toString()));
//   }
