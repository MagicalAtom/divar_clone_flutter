
class Font {
  static name(String weight) {
    if (weight == 'm') {
      return 'SM';
    } else if (weight == 'b') {
      return 'SB';
    } 
  }

  static size(int level) {
    List levels = [10.0, 20.0, 25.0, 30.0, 35.0, 40.0, 45.0, 46.0];
    return levels[level - 1];
  }
}
