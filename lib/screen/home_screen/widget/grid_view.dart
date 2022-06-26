part of '../view/home_view.dart';

class _GridView extends GetView<HomeViewModel> {
  const _GridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: SizeConfig.height * .03,
        crossAxisSpacing: SizeConfig.width * .04,
        mainAxisExtent: SizeConfig.height * .3,
      ),
      controller: controller.scrollController,
      padding: EdgeInsets.only(top: paddingXL),
      itemCount: controller.characterResponse.data!.results!.length,
      itemBuilder: (context, index) {
        final item = controller.characterResponse.data!.results![index];
        return _Card(
          item: item,
          onTap: () => controller.onTapCharacterDetail(item.id!),
        );
      },
    ));
  }
}

class _Card extends StatelessWidget {
  final VoidCallback onTap;
  const _Card({Key? key, required this.item, required this.onTap}) : super(key: key);

  final Result item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: () {},
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radiusXXS),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  '${item.thumbnail!.path}.${item.thumbnail!.extension}',
                ))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            KPadding(isHeight: false),
            Flexible(
              child: Container(
                height: SizeConfig.height * .1,
                width: SizeConfig.width,
                padding: EdgeInsets.all(paddingM),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radiusXXS),
                  color: AppColor.dark,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      item.name ?? '',
                      style: s16W700Dark().copyWith(
                        color: AppColor.white,
                        fontSize: SizeConfig.height * .02,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    KPadding(size: (.01)),
                    Expanded(
                      child: Text(
                        item.comics!.items == null
                            ? AppLocalization.getLabels.noComics
                            : item.comics!.items!.length > 0
                                ? item.comics!.items![0].name!
                                : AppLocalization.getLabels.noComics,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: s12W400Dark().copyWith(
                          color: AppColor.white,
                          fontSize: SizeConfig.height * .015,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            KPadding(isHeight: false, size: .05)
          ],
        ),
      ),
    );
  }
}
