import 'package:flutter/widgets.dart';

class SizeBoxWidht {
  static Widget customSizedBox(BuildContext context, double widhtPercentage) {
    return SizedBox(
      width: MediaQuery.of(context).size.height * widhtPercentage,
    );
  }
}
