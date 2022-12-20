import 'package:flutter/material.dart';

void sort_comments(BuildContext ctx) {
  /// Sorting bottom sheet
  showModalBottomSheet(

      isDismissible: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      context: ctx,
      builder: (_) {
        return SingleChildScrollView(
          key: const ValueKey("post_bottomSheet"),

          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "SORT COMMENTS BY",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.of(ctx).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Icon(Icons.rocket_rounded),
                      Text(
                        '  Best',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(ctx).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Icon(Icons.file_upload),
                      Text(
                        '  Top',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(ctx).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Icon(Icons.new_releases_outlined),
                      Text(
                        '  New',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(ctx).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Icon(Icons.drive_file_rename_outline_rounded),
                      Text(
                        '  Controversial',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(ctx).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Icon(Icons.access_time_sharp),
                      Text(
                        '  Old',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(ctx).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Icon(Icons.auto_fix_normal_sharp),
                      Text(
                        '  Q&A',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        );
      });
}
