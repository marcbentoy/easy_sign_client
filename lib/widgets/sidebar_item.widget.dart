import 'package:easy_sign_client/constants.dart';
import 'package:flutter/material.dart';

class SidebarItemWidget extends StatefulWidget {
  const SidebarItemWidget({
    super.key,
    required this.index,
    required this.icon,
    required this.currentIndex,
    required this.onClickCallback,
  });

  final int index;
  final IconData icon;
  final int currentIndex;
  final void Function(int) onClickCallback;

  @override
  State<SidebarItemWidget> createState() => _SidebarItemWidgetState();
}

class _SidebarItemWidgetState extends State<SidebarItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledButton(
          style: ButtonStyle(
            padding: const MaterialStatePropertyAll(EdgeInsets.all(0)),
            shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            backgroundColor: MaterialStatePropertyAll(
                widget.currentIndex == widget.index
                    ? kGreen
                    : Colors.transparent),
          ),
          onPressed: () {
            widget.onClickCallback(widget.index);
          },
          child: SizedBox(
            height: 48,
            child: Icon(
              widget.icon,
              color: widget.currentIndex == widget.index
                  ? kWhite
                  : kWhite.withAlpha(124),
            ),
          ),
        ),

        //
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
