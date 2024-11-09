enum HttpMethodEnum {
  get('get'),
  post('post'),
  put('put'),
  delete('delete');

  final String method;

  const HttpMethodEnum(this.method);
}