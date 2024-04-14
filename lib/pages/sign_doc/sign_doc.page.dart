import 'package:easy_sign_client/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../widgets/custom_icon_button_widget.dart';

class SignDocumentPage extends StatefulWidget {
  const SignDocumentPage({super.key});

  @override
  State<SignDocumentPage> createState() => _SignDocumentPageState();
}

class _SignDocumentPageState extends State<SignDocumentPage> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  final PdfViewerController _pdfViewerController = PdfViewerController();
  double pdfViewZoomLevel = 1;

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
          color: kWhite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Signature Requests",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kHeadline,
                  ),
                ),
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
                                          ? kHeadline
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
                                          ? kHeadline.withAlpha(172)
                                          : kWhite.withAlpha(220),
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
                                          ? kHeadline.withAlpha(172)
                                          : kWhite.withAlpha(220),
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
            decoration: const BoxDecoration(
              color: kWhite,
            ),
            // document container
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: kBorder),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // document main
                  Expanded(
                    child: Column(
                      children: [
                        // document header
                        Container(
                          height: 64,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: kWhite,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8)),
                              border:
                                  Border(bottom: BorderSide(color: kBorder))),
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
                                    color: kHeadline,
                                  ),
                                ),

                                //
                                const Spacer(),

                                //
                                const SizedBox(
                                  width: 8,
                                ),

                                // document info icon button
                                CustomIconButtonWidget(
                                  icon: const Icon(
                                    Icons.info_rounded,
                                    color: kStroke,
                                  ),
                                  tooltip: "toggle details",
                                  onClickCallback: () {
                                    setState(() {
                                      _showDocDetails = !_showDocDetails;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),

                        // pdf controls
                        Container(
                          height: 64,
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              CustomIconButtonWidget(
                                onClickCallback: () {
                                  setState(() {
                                    pdfViewZoomLevel -= 0.2;
                                    _pdfViewerController.zoomLevel =
                                        pdfViewZoomLevel;
                                  });
                                },
                                icon: Icon(Icons.zoom_out_rounded),
                                tooltip: "zoom out",
                              ),
                              CustomIconButtonWidget(
                                onClickCallback: () {
                                  setState(() {
                                    pdfViewZoomLevel += 0.2;
                                    _pdfViewerController.zoomLevel =
                                        pdfViewZoomLevel;
                                  });
                                },
                                icon: Icon(Icons.zoom_in_rounded),
                                tooltip: "zoom in",
                              ),
                            ],
                          ),
                        ),

                        // document content
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            color: kDarkestWhite,
                            child: SfPdfViewer.asset(
                              "assets/documents/test.pdf",
                              key: _pdfViewerKey,
                              controller: _pdfViewerController,
                            ),
                          ),
                        ),

                        // sign document control
                        Container(
                          height: 64,
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                              color: kWhite,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8)),
                              border: Border(top: BorderSide(color: kBorder))),
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
                      ? DocumentDetailsWidget()
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DocumentDetailsWidget extends StatelessWidget {
  const DocumentDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        border: Border(
          left: BorderSide(color: kBorder, width: 1),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // details header
              Text(
                "Document details",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: kHeadline,
                  fontWeight: FontWeight.bold,
                ),
              ),

              //
              const SizedBox(
                height: 8,
              ),

              const DocumentStatusChipWidget(status: DocumentStatus.signed),

              const SizedBox(
                height: 8,
              ),

              // title
              DetailCard(
                label: "title",
                content: Text(
                  "A sample document with a very long title but very short content",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kHeadline,
                  ),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              //
              const SizedBox(
                height: 8,
              ),

              // digest
              DetailCard(
                label: "digest",
                content: Column(
                  children: [
                    Text(
                      "0xlkasdf987asdfy9as7dyf98asd7f",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: kHeadline,
                      ),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                controls: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text("Copy"),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Verify"),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 8,
              ),

              // date uploaded
              DetailCard(
                label: "date uploaded",
                content: Text(
                  "04.24.2024 10:24 AM",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: kHeadline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(
                height: 8,
              ),

              // date uploaded
              DetailCard(
                label: "date signed",
                content: Text(
                  "04.24.2024 10:24 PM",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: kHeadline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(
                height: 8,
              ),

              // uploader
              DetailCard(
                label: "uploader",
                content: Row(
                  children: [
                    CircleAvatar(
                      minRadius: 18,
                      maxRadius: 18,
                    ),

                    //
                    SizedBox(
                      width: 4,
                    ),

                    SizedBox(
                      width: 256 - 32 - 24 - 4 - 36 - 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "User Name I. Lastname",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: kHeadline,
                            ),
                            softWrap: false,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "Officer",
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: kHeadline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                controls: TextButton(
                  onPressed: () {},
                  child: Text("View Profile"),
                ),
              ),

              //
              SizedBox(
                height: 8,
              ),

              // uploader
              DetailCard(
                label: "signer",
                content: Row(
                  children: [
                    CircleAvatar(),

                    //
                    SizedBox(
                      width: 4,
                    ),

                    SizedBox(
                      width: 256 - 32 - 24 - 4 - 36 - 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "User Name I. Lastname",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: kHeadline,
                            ),
                            softWrap: false,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "Officer",
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: kHeadline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                controls: TextButton(
                  onPressed: () {},
                  child: Text("View Profile"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DocumentStatusChipWidget extends StatelessWidget {
  final DocumentStatus status;

  const DocumentStatusChipWidget({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: kLightGreen,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check,
            size: 12,
            color: kDarkGreen,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            status == DocumentStatus.signed
                ? "SIGNED"
                : status == DocumentStatus.waiting
                    ? "WAITING"
                    : "CANCELLED",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: kDarkGreen,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailCard extends StatelessWidget {
  final String label;
  final Widget content;
  final Widget? controls;

  const DetailCard(
      {super.key, required this.label, required this.content, this.controls});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kDarkWhite,
        border: Border.all(color: kBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // card label
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: kSubHeadline,
            ),
          ),

          //
          SizedBox(
            height: 8,
          ),

          // content
          content,

          controls != null
              ? Column(
                  children: [
                    //
                    const SizedBox(
                      height: 8,
                    ),

                    Divider(
                      color: kBorder,
                      thickness: 0.8,
                    ),
                    controls!,
                  ],
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

enum DocumentStatus {
  waiting,
  cancelled,
  signed,
}
