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

enum BulkAction { selectAll, clearSelection, invertSelection }

enum BatchAction {
  selectAll,
  nominateGhaibi,
  unnominateGhaibi,
  nominateNazari,
  unnominateNazari,
  nominateHadith,
  unnominateHadith,
  gradeGhaibiPassed,
  gradeGhaibiFailed,
  gradeNazariPassed,
  gradeNazariFailed,
  gradeHadithPassed,
  gradeHadithFailed,
}
