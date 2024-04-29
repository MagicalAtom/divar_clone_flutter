class Gallery {
  String path;
  Gallery(this.path);
  factory Gallery.from(String path) {
    return Gallery(path);
  }
}
