import 'package:easy_sign_client/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignDocumentPage extends StatefulWidget {
  const SignDocumentPage({super.key});

  @override
  State<SignDocumentPage> createState() => _SignDocumentPageState();
}

class _SignDocumentPageState extends State<SignDocumentPage> {
  bool _showDocDetails = true;
  int _selectedDoc = 0;

  List<(String, String, String)> docs = [
    ("My humble proposal baby", "Marchel Bentoy", "04.13.2024 10:00AM"),
    ("My humble proposal", "Marchel Bentoy", "04.13.2024 10:00AM"),
    ("My humble proposal", "Marchel Bentoy", "04.13.2024 10:00AM"),
    ("My humble proposal", "Marchel Bentoy", "04.13.2024 10:00AM"),
    ("My humble proposal", "Marchel Bentoy", "04.13.2024 10:00AM"),
    ("My humble proposal", "Marchel Bentoy", "04.13.2024 10:00AM"),
    ("My humble proposal", "Marchel Bentoy", "04.13.2024 10:00AM"),
    ("My humble proposal", "Marchel Bentoy", "04.13.2024 10:00AM"),
    ("My humble proposal", "Marchel Bentoy", "04.13.2024 10:00AM"),
    ("My humble proposal", "Marchel Bentoy", "04.13.2024 10:00AM"),
    ("My humble proposal", "Marchel Bentoy", "04.13.2024 10:00AM"),
    ("My humble proposal", "Marchel Bentoy", "04.13.2024 10:00AM"),
    ("My humble proposal", "Marchel Bentoy", "04.13.2024 10:00AM"),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // document selector
        Container(
          width: 256,
          color: kDarkWhite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Assigned to you",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kHeaderColor,
                      ),
                    ),
                    Text(
                      "04.13.2024",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: kSubHeaderColor,
                      ),
                    ),
                  ],
                ),
              ),

              //
              const SizedBox(
                height: 12,
              ),

              // documents list
              Expanded(
                child: ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          // document item
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              style: ButtonStyle(
                                alignment: Alignment.centerLeft,
                                padding: const MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        vertical: 24, horizontal: 16)),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                backgroundColor: MaterialStatePropertyAll(
                                    _selectedDoc == index
                                        ? kGreen
                                        : kDarkerWhite),
                              ),
                              onPressed: () {
                                setState(() {
                                  _selectedDoc = index;
                                });
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // doc title
                                  Text(
                                    docs[index].$1,
                                    style: GoogleFonts.inter(
                                      color: _selectedDoc != index
                                          ? kHeaderColor
                                          : kWhite,
                                      fontSize: 16,
                                      fontWeight: _selectedDoc != index
                                          ? FontWeight.w500
                                          : FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),

                                  //
                                  const SizedBox(
                                    height: 4,
                                  ),

                                  // doc uploader
                                  Text(
                                    docs[_selectedDoc].$2,
                                    style: GoogleFonts.inter(
                                      color: _selectedDoc != index
                                          ? kHeaderColor.withAlpha(172)
                                          : kWhite.withAlpha(200),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                  // doc date uploaded
                                  Text(
                                    docs[_selectedDoc].$3,
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: _selectedDoc != index
                                          ? kHeaderColor.withAlpha(172)
                                          : kWhite.withAlpha(200),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        // document
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(24),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                // document tools
                Expanded(
                  child: Column(
                    children: [
                      // document header
                      Container(
                        height: 56,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: kDarkWhite,
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(8)),
                            border: Border(
                                bottom: BorderSide(color: kBorderColor))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // document title header
                              Text(
                                docs[_selectedDoc].$1,
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: kHeaderColor,
                                ),
                              ),

                              //
                              const Spacer(),

                              // document status
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                decoration: BoxDecoration(
                                  color: kGreen.withAlpha(56),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.check,
                                      size: 12,
                                      color: kDarkGreen,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "SIGNED",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: kDarkGreen,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              //
                              const SizedBox(
                                width: 8,
                              ),

                              // document info icon button
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _showDocDetails = !_showDocDetails;
                                  });
                                },
                                icon: const Icon(Icons.info_rounded),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // document content
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          color: kDarkestWhite,
                          child: const Text("Document content"),
                        ),
                      ),

                      // sign document control
                      Container(
                        height: 64,
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            color: kDarkWhite,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8)),
                            border:
                                Border(top: BorderSide(color: kBorderColor))),
                        child: FilledButton(
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            backgroundColor:
                                const MaterialStatePropertyAll(kGreen),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.border_color_rounded,
                                size: 16,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Sign Document",
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // document details
                _showDocDetails
                    ? Container(
                        width: 256,
                        decoration: const BoxDecoration(
                            color: kDarkWhite,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                            border: Border(
                                left:
                                    BorderSide(color: kBorderColor, width: 2))),
                        child: const Column(
                          children: [
                            Text("Document details"),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
