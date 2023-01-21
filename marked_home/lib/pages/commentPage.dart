import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marked_home/models/productModel.dart';

class CommentPage extends StatefulWidget {
  CommentPage({required this.item,Key? key}) : super(key: key);

  ProductModel item;
  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {

  var commentCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Image.asset(widget.item.image!),
            ),
            SizedBox(height: 20,),
            Expanded(
                child:widget.item.commentList!.isEmpty?
                    Center(
                      child: Text('No comment'),
                    )
                    :ListView.builder(
                  itemCount: widget.item.commentList!.length,
                    itemBuilder: (context,index){
                    return Row(
                      mainAxisAlignment: index % 2 ==0?
                      MainAxisAlignment.end : MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 250,
                          margin: EdgeInsets.symmetric(vertical: 5),
                            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                            decoration: BoxDecoration(
                              color: index % 2 ==0 ? Colors.blue.shade400 : Colors.green.shade400,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                              bottomLeft: index % 2 ==0 ? Radius.circular(10) : Radius.zero,
                                  bottomRight: index % 2 ==0 ?  Radius.zero: Radius.circular(10)
                              )
                            ),
                            child: Text(widget.item.commentList![index],
                            maxLines: 10,
                            overflow: TextOverflow.ellipsis,))
                      ],
                    );
            })
            ),
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: commentCtr,
                      decoration: InputDecoration(
                        hintText: 'Enter comment'
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: (){
                        if(commentCtr.text != ''){
                          widget.item.commentList!.add(commentCtr.text.trim());
                          commentCtr.text = '';
                          setState(() {});
                        }

                      },
                      child: Icon(Icons.send,color: Colors.blue,))
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
