extension StringToUri on String {
   getUri() {
    return Uri.parse(this);
  }
}
