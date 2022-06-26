part of '../view/welcome_view.dart';

class _SelectLanguage extends GetView<SplashViewModel> {
  const _SelectLanguage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sessionService = Get.find<SessionService>();
    return Container(
      height: SizeConfig.height * .06,
      padding: const EdgeInsets.all(paddingXXXS),
      decoration: BoxDecoration(
        color: AppColor.dark,
        borderRadius: BorderRadius.circular(radiusS),
      ),
      child: Row(
        children: [
          Expanded(
            child: AnimatedContainer(
              duration: AppConstants.animationDurationMS,
              height: SizeConfig.height,
              decoration: BoxDecoration(
                color: sessionService.getLanguageCode() == 0 ? AppColor.dark : Colors.transparent,
                borderRadius: BorderRadius.circular(radiusS),
              ),
              child: InkWell(
                onTap: () async {
                  sessionService.setLanguageCode(0);
                  //controller.dayIndex.value = 0;
                  //await controller.getStarterParameters();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    'Türkçe',
                    style: s15W400Dark().copyWith(
                      color: sessionService.getLanguageCode() == 0
                          ? AppColor.white
                          : AppColor.white.withOpacity(0.5),
                    ),
                  )),
                ),
              ),
            ),
          ),
          Expanded(
            child: AnimatedContainer(
              duration: AppConstants.animationDurationMS,
              height: SizeConfig.height,
              decoration: BoxDecoration(
                color: sessionService.getLanguageCode() == 1 ? AppColor.dark : Colors.transparent,
                borderRadius: BorderRadius.circular(radiusS),
              ),
              child: InkWell(
                onTap: () async {
                  sessionService.setLanguageCode(1);
                  // await controller.getStarterParameters();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text('English',
                          style: s15W400Dark().copyWith(
                            color: sessionService.getLanguageCode() == 1
                                ? AppColor.white
                                : AppColor.white.withOpacity(0.5),
                          ))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
