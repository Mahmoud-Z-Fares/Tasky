sealed class DataBaseResult<T> {}

class DataBaseSuccess<T> extends DataBaseResult<T> {
  DataBaseSuccess({this.data});

  T? data;
}

class DataBaseError<T> extends DataBaseResult<T> {
  DataBaseError(this.error);

  String error;
}
