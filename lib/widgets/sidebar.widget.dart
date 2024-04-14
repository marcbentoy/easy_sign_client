import 'package:easy_sign_client/constants.dart';
import 'package:easy_sign_client/widgets/sidebar_item.widget.dart';
import 'package:flutter/material.dart';

class CustomSidebar extends StatefulWidget {
  const CustomSidebar({
    super.key,
    required this.currentIndex,
    required this.onClickCallback,
  });

  final int currentIndex;
  final void Function(int) onClickCallback;

  @override
  State<CustomSidebar> createState() => _CustomSidebarState();
}

class _CustomSidebarState extends State<CustomSidebar> {
  final List<(String, IconData)> _sidebarItems = [
    ("Upload Document", Icons.upload_file_rounded),
    ("Sign Document", Icons.border_color_rounded),
    ("View Documents", Icons.document_scanner_rounded),
    ("View Recent Records", Icons.receipt_long_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: kBlack,
      ),
      child: Column(
        children: [
          // logo
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          //
          const SizedBox(
            height: 64,
          ),

          // sidebar items
          Expanded(
            child: ListView.builder(
              itemCount: _sidebarItems.length,
              itemBuilder: (context, index) {
                return SidebarItemWidget(
                    index: index,
                    icon: _sidebarItems[index].$2,
                    currentIndex: widget.currentIndex,
                    onClickCallback: widget.onClickCallback);
              },
            ),
          ),

          // spacer
          // const Spacer(),

          // profile
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: kDarkWhite,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ],
      ),
    );
  }
}
