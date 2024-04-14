import 'package:easy_sign_client/constants.dart';
import 'package:flutter/material.dart';

class CustomIconButtonWidget extends StatelessWidget {
  final Widget icon;
  final String tooltip;
  final void Function() onClickCallback;

  const CustomIconButtonWidget({
    super.key,
    required this.onClickCallback,
    required this.icon,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      padding: const EdgeInsets.all(0),
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(kDarkestWhite),
          minimumSize: MaterialStatePropertyAll(
            Size(32, 32),
          ),
          maximumSize: MaterialStatePropertyAll(
            Size(32, 32),
          ),
          fixedSize: MaterialStatePropertyAll(Size(32, 32)),
          iconSize: MaterialStatePropertyAll(24)),
      onPressed: onClickCallback,
      icon: icon,
    );
  }
}
