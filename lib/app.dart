import 'package:easy_sign_client/pages/recent/recent.page.dart';
import 'package:easy_sign_client/pages/sign_doc/sign_doc.page.dart';
import 'package:easy_sign_client/pages/upload_doc/upload_doc.page.dart';
import 'package:easy_sign_client/pages/view_docs/view_docs.page.dart';
import 'package:easy_sign_client/widgets/sidebar.widget.dart';
import 'package:flutter/material.dart';

class EasySign extends StatefulWidget {
  const EasySign({super.key});

  @override
  State<EasySign> createState() => _EasySignState();
}

class _EasySignState extends State<EasySign> {
  int _currentSelectedItem = 0;

  final List<Widget> pages = [
    const UploadDocumentPage(),
    const SignDocumentPage(),
    const ViewDocsPage(),
    const RecentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          CustomSidebar(
            currentIndex: _currentSelectedItem,
            onClickCallback: (newIndex) {
              setState(() {
                _currentSelectedItem = newIndex;
              });
            },
          ),
          Expanded(
            child: pages[_currentSelectedItem],
          ),
        ],
      ),
    );
  }
}
