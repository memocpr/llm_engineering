abstract class DataState<T> {}
class DataSuccess<T> extends DataState<T> {
  final T data;
  DataSuccess(this.data);
}
class DataFailed<T> extends DataState<T> {
  final Exception error;
  DataFailed(this.error);
}
