import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Center(
        child: Text('Acesse com uma conta',
            style: Theme.of(context).textTheme.headline2),
      ),
    );
  }
}
