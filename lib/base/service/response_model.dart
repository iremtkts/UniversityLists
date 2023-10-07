class ResponseModel {
  final bool isSuccess;
  final String errorMessage;
  final dynamic data;

  ResponseModel({this.isSuccess = false,  this.errorMessage="",  this.data});
  
}
