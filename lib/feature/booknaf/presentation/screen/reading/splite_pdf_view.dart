import 'dart:io';
import 'dart:ui';

import 'package:booknaf_app/feature/booknaf/data/model/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:split_view/split_view.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:flutter/foundation.dart';

class SplitScreen extends StatefulWidget {
  final BookModel book;

  const SplitScreen({Key? key, required this.book}) : super(key: key);

  @override
  _SplitScreenState createState() => _SplitScreenState();
}

class _SplitScreenState extends State<SplitScreen> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey1 = GlobalKey();
  final GlobalKey<SfPdfViewerState> _pdfViewerKey2 = GlobalKey();
  late PdfViewerController _pdfViewerController;
  late PdfTextSearchResult _searchResult;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWindows => !kIsWeb && Platform.isWindows;
  bool get isWeb => kIsWeb;
  @override
  void initState() {
    _pdfViewerController = PdfViewerController();

    _searchResult = PdfTextSearchResult();

    super.initState();
  }

  String keyword = ''; // Initialize the keyword

  Future<void> _showSearchDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Search Content'),
          content: TextField(
            decoration: const InputDecoration(hintText: 'Enter keyword'),
            onChanged: (value) {
              setState(() {
                keyword = value;
              });
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Search'),
              onPressed: () {
                // Update _pdfViewerController.searchText with the entered keyword
                _pdfViewerController.searchText(keyword,
                    searchOption: TextSearchOption.caseSensitive);

                // Close the dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool _isWidgetVisible = true;

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 300);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.book.title!,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Color.fromARGB(255, 15, 15, 15),
            ),
            onPressed: () {
              _showSearchDialog();
              if (kIsWeb) {
                if (mounted) {
                  setState(() {});
                }
              } else {
                _searchResult.addListener(() {
                  if (_searchResult.hasResult) {
                    setState(() {});
                  }
                });
              }
            },
          ),
          IconButton(
              icon: const Icon(
                Icons.zoom_in,
                color: Color.fromARGB(255, 15, 15, 15),
              ),
              onPressed: () {
                _pdfViewerController.zoomLevel = 2;
              }),
          Visibility(
            visible: _searchResult.hasResult,
            child: IconButton(
              icon: const Icon(
                Icons.clear,
                color: Color.fromARGB(255, 15, 15, 15),
              ),
              onPressed: () {
                if (mounted) {
                  setState(() {
                    _searchResult.clear();
                  });
                }
              },
            ),
          ),
          Visibility(
            visible: _searchResult.hasResult,
            child: IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_up,
                color: Color.fromARGB(255, 15, 15, 15),
              ),
              onPressed: () {
                _searchResult.previousInstance();
              },
            ),
          ),
          Visibility(
            visible: _searchResult.hasResult,
            child: IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Color.fromARGB(255, 15, 15, 15),
              ),
              onPressed: () {
                _searchResult.nextInstance();
              },
            ),
          ),
        ],
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          setState(() {
            if (direction == ScrollDirection.reverse) {
              _isWidgetVisible = false;
            } else if (direction == ScrollDirection.forward) {
              _isWidgetVisible = true;
            }
          });
          return true;
        },
        child: SplitView(
          viewMode: SplitViewMode
              .Horizontal, // Set the initial view mode to Horizontal
          indicator: const SplitIndicator(viewMode: SplitViewMode.Horizontal),
          activeIndicator: const SplitIndicator(
            viewMode: SplitViewMode.Horizontal,
            isActive: true,
          ),
          controller:
              SplitViewController(limits: [null, WeightLimit(max: 0.5)]),
          onWeightChanged: (w) =>
              print("Horizontal $w"), // Handle horizontal split changes
          children: [
            SfPdfViewer.network('https://icseindia.org/document/sample.pdf',
                key: _pdfViewerKey1, onTap: (PdfGestureTapCallback) {
              setState(() {
                if (_isWidgetVisible) {
                  _isWidgetVisible = false;
                } else {
                  _isWidgetVisible = true;
                }
              });
            },
                maxZoomLevel: 3,
                pageSpacing: 0.5,
                controller: _pdfViewerController,
                currentSearchTextHighlightColor: Colors.yellow.withOpacity(0.6),
                otherSearchTextHighlightColor: Colors.yellow.withOpacity(0.3),
                canShowScrollHead: true,
                canShowScrollStatus: true,
                canShowPaginationDialog: true),
            SfPdfViewer.network(
              'https://icseindia.org/document/sample.pdf',
              key: _pdfViewerKey2,
              pageSpacing: 0.5,
            ),
          ],
        ),
      ),
      floatingActionButton: AnimatedSlide(
        duration: duration,
        offset: _isWidgetVisible ? Offset.zero : const Offset(0, 2),
        child: AnimatedOpacity(
          duration: duration,
          opacity: _isWidgetVisible ? 1 : 0,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black
                      .withOpacity(0.5), // Adjust the opacity as needed
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon:
                                const Icon(Icons.settings, color: Colors.white),
                            onPressed: () {
                              // Handle collection seating action
                            },
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.bookmark, color: Colors.white),
                        onPressed: () {
                          // Handle note action
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.assignment, color: Colors.white),
                        onPressed: () {
                          // Handle test action
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.nightlight_round,
                            color: Colors.white),
                        onPressed: () {
                          // Handle night mode action
                        },
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
