class AssetsPath {
  AssetsPath._();
  static const String _assets = 'assets/';
  static const String _animation = 'animation/';
  static const String _icons = 'icons/';
  static const String _logo = 'logo/';
  static const String _flags = 'flags/';
  static const String _images = 'images/';

  static String get assets => _assets;
  static String get animation => _assets + _animation;
  static String get icons => assets + _icons;
  static String get images => assets + _images;
  static String get logo => _assets + _logo;
  static String get flags => _assets + _flags;
}
