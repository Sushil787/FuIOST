import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio/pdf_viewer.dart';
import 'package:flutter_dio/servies/dio_services.dart';

class ListScreen extends StatefulWidget {
  final String url;
  final String pageTitle;
  const ListScreen({super.key, required this.url, required this.pageTitle});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late Future<Map> data;
  final dioService = DioServices();
  @override
  void initState() {
    data = dioService.startScrapping(widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.pageTitle)),
      body: FutureBuilder(
        future: data,
        builder: (context, AsyncSnapshot<Map<dynamic, dynamic>> snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 10,
                    thickness: 3,
                  );
                },
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: ((context) => PdfViewerScreen(
                                    url: snapshot.data!.entries
                                        .elementAt(index)
                                        .value,
                                    title: snapshot.data!.entries
                                        .elementAt(index)
                                        .key,
                                  ))));
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Text(
                          index.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(snapshot.data!.entries.elementAt(index).key),
                    ),
                  );
                }));
          }
          return const LinearProgressIndicator(
            minHeight: 5,
            color: Colors.green,
          );
        },
      ),
    );
  }
}
