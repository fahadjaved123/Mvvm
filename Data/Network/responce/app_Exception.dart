class AppException implements Exception {
  final message;
  final prefix;
  AppException({this.message,this.prefix});
  String tostring(){
    return '$message$prefix';
  }
}
class FetchDataException extends AppException{
  FetchDataException({String? message}):super(message: 'Error during Communications');
}
class BadRequestException extends AppException{
  BadRequestException({String? message}):super(message: 'Inviald request');
}
class UnotherrizedExpection extends AppException{
  UnotherrizedExpection({String? message}):super(message:"Unotherrized request" );
}