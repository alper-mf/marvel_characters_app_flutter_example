part of '../view/welcome_view.dart';

class _BottomWidget extends GetView<WelcomeViewModel> {
  final VoidCallback? onTapButton;
  const _BottomWidget({Key? key, this.onTapButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height * .45,
      width: SizeConfig.width,
      padding: EdgeInsets.all(paddingXL),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.white.withOpacity(0),
            AppColor.white.withOpacity(0.9),
            AppColor.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox.square(
            dimension: SizeConfig.blockSizeHorizontal * 34,
            child: _marvelLogo,
          ),
          KPadding(),
          Text(
            'With great power comes great responsibility.',
            textAlign: TextAlign.center,
            style: s16W700Dark().copyWith(color: AppColor.black),
          ),
          KPadding(size: .035),
          RoundedCustomButton(
            onTap: onTapButton ?? () => {},
            kHeight: SizeConfig.height * .085,
            title: 'Enter The Earth 616',
            color: AppColor.marvelRed,
            borderRadius: radiusXXS,
          ),
        ],
      ),
    );
  }

  Widget get _marvelLogo => Image.asset(
        AssetsImage.marvelLogo,
        fit: BoxFit.contain,
      );
}
