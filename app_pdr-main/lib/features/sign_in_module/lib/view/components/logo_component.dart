import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: Padding(
        padding: const EdgeInsets.only(top: 90, bottom: 40),
        child: SvgPicture.asset(
          'assets/vectors/logo.svg',
          height: 40,
        ),
      ),
    );
  }
}
