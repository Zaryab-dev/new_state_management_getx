
import 'package:new_state_management_getx/data/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.complete(this.data) : status = Status.COMPLETE;
  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return 'status: $status \n data: $data \n message: $message';
  }

}