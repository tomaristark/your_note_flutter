import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';



class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override

  String folderPath  ="";
  Widget build(BuildContext context) {


    Future selectFolder() {
      return showDialog(context: context,
       builder: (context){
        return AlertDialog(
          title: const Text("Select The Folder Path"),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              color: Colors.white38,
              child: Row( 
                children: [
                  IconButton(
                    onPressed: ()async{
                      String ? result = await FilePicker.platform.getDirectoryPath();
                      if(result != null){
                        setState(() {
                          folderPath = result;
                        });
                      }
             final folder = Directory(folderPath);
          List<FileSystemEntity>pdfFile = folder.listSync();

          for( var file in pdfFile){
            if(file is File){
                print(file.path);
            }
          }
                    },
                    icon: Icon(Icons.folder)),
                  Divider(),
                  Text((folderPath.isNotEmpty)?folderPath:""
                  ,maxLines: 1,
                  overflow:TextOverflow.ellipsis,)
                ],
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, 
            child: Text("Select")
            )
          ],
        );
       });
    }


    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Books"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () async {
                    return selectFolder();
                  },
                  icon: Icon(
                    Icons.create_new_folder_outlined,
                    size: 28,
                  )),
            )
          ],
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3 / 4.3),
            itemCount: 20,
            itemBuilder: (context, index) {
              return Card(
                // color: Colors.blue,
                elevation: 5,
                child: SizedBox(
                  
                ),
              );
            }));
  }
}
