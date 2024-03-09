import 'package:flutter/widgets.dart';

class SizeBoxHeight {
  SizeBoxHeight(BuildContext context, double d);

  static Widget customSizedBox(BuildContext context, double heightPercentage) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * heightPercentage,
    );
  }
}
