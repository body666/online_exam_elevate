sealed class Result<T> {}

class Success<T> implements Result<T> {
  T? data;

  Success(this.data);
}

class Failure<T> implements Result<T> {
  Exception? exception;

  Failure(this.exception);
}
