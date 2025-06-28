import 'package:dio/dio.dart';

abstract class Failuers {
  final String errorMessage;

  const Failuers(this.errorMessage);
}

class ServerFailuer extends Failuers {
  ServerFailuer(super.errorMessage);
  factory ServerFailuer.fromDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailuer('⏱️ connection Timeout Apiserver');
      case DioExceptionType.sendTimeout:
        return ServerFailuer('📤 Send Timeout Apiserver');

      case DioExceptionType.receiveTimeout:
        return ServerFailuer('❌ Reseive Timeout Apiserver');

      case DioExceptionType.badCertificate:
        return ServerFailuer('Sertivication  Apiserver');

      case DioExceptionType.badResponse:
        return ServerFailuer.formException(
          exception.response!.statusCode!,
          exception.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailuer('Result to Apserver to cancel');
      case DioExceptionType.connectionError:
        return ServerFailuer('📶 Please check your network connection.');

      case DioExceptionType.unknown:
        return ServerFailuer('Ops There was an Error, Please try agin!');
    }
  }
  factory ServerFailuer.formException(int statusCode, dynamic reponses) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailuer(reponses['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailuer('Your Request Not Fond');
    } else if (statusCode == 500) {
      return ServerFailuer('Interel Server Error , Please try Late!');
    } else {
      return ServerFailuer('Ops There was an Error, Please try agin!');
    }
  }
}
