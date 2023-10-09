import 'package:flutter/material.dart';
import 'package:flutter_login_ui/notifiers/app_theme_notifier.dart';
import 'package:flutter_login_ui/auth/private_note_auth.dart';
import 'package:flutter_login_ui/pages/book_page.dart';
// import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late AppThemeNotifier appThemeNotifier;

  // void _switchTheme(){
  //   appThemeNotifier.updateTheme(!appThemeNotifier.isDarkMode);
  // }
  
  final _items = List.generate(10, (index) => "$index");
  @override
  Widget build(BuildContext context) {
    // appThemeNotifier = Provider.of<AppThemeNotifier>(context);
    return Scaffold(

      appBar: AppBar(
        leading: const Icon(Icons.menu),
        elevation: 0,
        actions: [
            IconButton(
              onPressed: (){
                // return _switchTheme();
              }, 
              icon:Icon( Icons.light_mode)
              )
        ],
      
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingText(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const BookPage())),
                    child: const Category(categoryColor: Colors.redAccent,categoryIcon: Icons.auto_stories_outlined,categoryName: "Books",)),
                  const PrivateNoteAuth()
                ],
              ),
            ),
         const    Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Category(categoryColor: Colors.orangeAccent,categoryIcon: Icons.bookmark_outline,categoryName: "Book Marks",),
                Category(categoryColor: Colors.greenAccent,categoryIcon: Icons.task_outlined,categoryName: "Learning",)
              ],
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text("Important Tasks",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context,index){
                    final String item = _items[index];
                    return Dismissible(
                      key: Key(item),
                      onDismissed: (DismissDirection dir) {
                        setState(() {
                          this._items.removeAt(index);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content:
                            Text(
                              dir == DismissDirection.startToEnd?"$item removed":"$item Done"
                            ),
                            action: SnackBarAction(label: "Undo", onPressed: (){
                              setState(() {
                                this._items.insert(index, item);
                              }
                              );
                            },
                            ),
                             )
                          );
                        },
                        
                        
                        );
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerLeft,
                        child: const Icon(Icons.delete),
                      ),
                      secondaryBackground: Container(
                        color: Colors.green,
                        alignment: Alignment.centerRight,
                        child: const Icon(Icons.thumb_up),
                      ),
                      child: Card(
                        child: ListTile(
                          title: Text("hellodaoiwjd0ajwodhjawjdpoajwpodjawpodjawp${_items[index]}",
                          style: TextStyle(
                            // color: Colors.redAccent
                          ),),
                          onTap: (){},
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Create Date"),
                              Text("Create  Time"),
                            ],
                          ),
                          ),
                      )
                        );

                }),
              ),

            )
          ]
          ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add,color: Colors.white,),
        onPressed: (){}),
    );
  }
}

class HeadingText extends StatelessWidget {
  const HeadingText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("Your ToDO list",style: TextStyle(
      // color: Colors.red,
      fontWeight: FontWeight.bold,
      fontSize: 30
    ),);
  }
}

class Category extends StatelessWidget {
  const Category({
    super.key, required this.categoryName, required this.categoryIcon, required this.categoryColor,
  });
  final String categoryName;
  final IconData categoryIcon;
  final Color  categoryColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[ Container(
        width: MediaQuery.of(context).size.width*0.43,
        height: MediaQuery.of(context).size.height*0.12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: categoryColor
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(categoryIcon,color: Colors.white,size: 50,),
                Text(categoryName,style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
               
              ],
          ),
        ),
      ),
      Positioned(
        top: 10,
        left: 100,
        child: Opacity(opacity: 0.5,
        child: Icon(categoryIcon,size: 75,color: Colors.white,),
        ),
      )
      ]
    );
  }
}