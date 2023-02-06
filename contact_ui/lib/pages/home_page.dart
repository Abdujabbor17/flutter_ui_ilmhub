import 'package:contact_ui/items/contactItem.dart';
import 'package:contact_ui/pages/detailPage.dart';
import 'package:contact_ui/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isOpenSearch = false;
  var searchCtr = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Color(0xffffffff),
        title: isOpenSearch
            ? TextFormField(
                controller: searchCtr,
                onChanged: (val) {
                  search(val);
                  setState(() {});
                },
                decoration: InputDecoration(
                    hintText: 'Search...',
                    suffixIcon: IconButton(
                      onPressed: () {
                        isOpenSearch = false;
                        searchCtr.clear();
                        setState(() {});
                      },
                      icon: Icon(Icons.cancel_outlined),
                    )),
              )
            : Text(
                'Contacts',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color(0xff000000)),
              ),
        actions: [
          isOpenSearch
              ? SizedBox()
              : IconButton(
                  onPressed: () {
                    isOpenSearch = true;
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.search,
                    color: Color(0xff000000),
                  )),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                  child: InkWell(
                      onTap: () {
                        contacts.sort(
                          (a, b) => a.name.compareTo(b.name),
                        );
                        Navigator.pop(context);
                        setState(() {});
                      },
                      child: Text('A-Z'))),
              PopupMenuItem(
                  child: InkWell(
                      onTap: () {
                        contacts.sort(
                          (a, b) => b.name.compareTo(a.name),
                        );
                        Navigator.pop(context);
                        setState(() {});
                      },
                      child: Text('Z-A'))),
              PopupMenuItem(
                  child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Delete everything?'),
                              content: Text('Are you sure you want to remove everything'),
                              actions: [
                                InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: Text('No',)),
                                SizedBox(width: 10,),
                                InkWell(
                                    onTap: (){
                                      contacts.clear();
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: Text('Yes',style: TextStyle(color: Colors.red),)),
                               SizedBox()
                              ],
                            );
                          },
                        );



                      },
                      child: Text('Delete all'))),
            ],
          )
        ],
      ),
      body: contacts.isNotEmpty
          ? searchCtr.text.isNotEmpty
              ? ListView.builder(
                  itemCount: searchList.length,
                  itemBuilder: (ctx, i) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailPage(i);
                          }));
                        },
                        child: contactItem(context, searchList[i]));
                  })
              : ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (ctx, i) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailPage(i);
                          }));
                        },
                        child: contactItem(context, contacts[i]));
                  })
          : Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/empty.png'),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'You have no contacts yet',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/Add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

void search(String searchedName) {
  searchList.clear();
  contacts.forEach((element) {
    if (element.name.toLowerCase().contains(searchedName.toLowerCase())) {
      searchList.add(element);
    }
  });
}
