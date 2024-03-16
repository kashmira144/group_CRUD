import 'package:flutter/material.dart';
import 'package:group_crud/utils/number_constants.dart';
import 'package:group_crud/utils/string_constants.dart';
import 'package:shimmer/shimmer.dart';

class VerticalTitleSubtitleListViewShimmerWidget extends StatelessWidget {
  final bool isTextFieldShimmer;
  final double? height;
  final double? opacity;
  final bool isSingleLineShow;
  final double? borderRadius;

  const VerticalTitleSubtitleListViewShimmerWidget(
      {super.key,
      this.isTextFieldShimmer = StringConstants.IS_SELECTED_FALSE,
      this.opacity,
      this.height,
      this.isSingleLineShow = StringConstants.IS_SELECTED_FALSE,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Align(alignment: FractionalOffset.topLeft, child: getShimmerUI());
  }

  Widget getShimmerUI() {
    return Shimmer.fromColors(
      baseColor: Colors.black38,
      highlightColor: Colors.grey.withOpacity(NumberConstant.DOUBLE_POINT_TWO),
      child: ListView.builder(
        shrinkWrap: StringConstants.IS_SELECTED_TRUE,
        itemCount: NumberConstant.INT_ONE,
        itemBuilder: (context, i) {
          return ListTile(
            title: Padding(
                padding: const EdgeInsets.only(
                    top: NumberConstant.DOUBLE_EIGHT,
                    bottom: NumberConstant.DOUBLE_TEN),
                child: Container(
                    width: MediaQuery.of(context).size.width /
                        NumberConstant.DOUBLE_ONE_POINT_TWO,
                    height: NumberConstant.DOUBLE_TEN,
                    color: Colors.grey)),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                        right: NumberConstant.DOUBLE_EIGHT,
                        bottom: NumberConstant.DOUBLE_EIGHT),
                    child: Container(
                        width: MediaQuery.of(context).size.width *
                            NumberConstant.DOUBLE_ONE /
                            NumberConstant.DOUBLE_TWO_POINT_FIVE,
                        height: NumberConstant.DOUBLE_TEN,
                        color: Colors.grey)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: NumberConstant.DOUBLE_EIGHT),
                  child: Container(color: Colors.transparent),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
