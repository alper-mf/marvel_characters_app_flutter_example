part of '../view/welcome_view.dart';

class _TopImageWidget extends StatelessWidget {
  final String imageURL;
  const _TopImageWidget({Key? key, required this.imageURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageURL,
      height: SizeConfig.height * .3 * 2,
      width: SizeConfig.width * .8 * 2,
    );
  }
}
