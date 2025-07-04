enum ApiMethod {
  get('get', 'GET'),
  post('post', 'POST'),
  put('put', 'PUT'),
  patch('patch', 'PATCH'),
  delete('delete', 'DELETE');

  const ApiMethod(this.name, this.key);
  final String name, key;
}

enum SnackbarType { success, error, warning }
