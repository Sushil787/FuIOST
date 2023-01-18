import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfViewerScreen extends StatefulWidget {
  final String url;
  final String title;
  const PdfViewerScreen({super.key, required this.url, required this.title});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  @override
  Widget build(BuildContext context) {
    return PDFViewerCachedFromUrl(
      url: widget.url,
      title: widget.title,
    );
  }
}

class PDFViewerCachedFromUrl extends StatelessWidget {
  const PDFViewerCachedFromUrl(
      {Key? key, required this.url, required this.title})
      : super(key: key);

  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        child: const PDF().cachedFromUrl(
          url,
          maxAgeCacheObject: const Duration(hours: 20),
          placeholder: (double progress) => Center(
            child: Column(children: [
              const LinearProgressIndicator(
                minHeight: 5,
                color: Colors.green,
              ),
              Center(
                  child: Text(
                '$progress %  loading...',
                style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ))
            ]),
          ),
          errorWidget: (dynamic error) => Center(child: Text(error.toString())),
        ),
      ),
    );
  }
}
