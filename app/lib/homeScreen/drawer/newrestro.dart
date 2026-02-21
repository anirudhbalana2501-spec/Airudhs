import 'package:flutter/material.dart';

class Allitem extends StatefulWidget {
  final dynamic iimage;
  final dynamic name;
  final dynamic Function()? res;
  
  //final dynamic Function()? all;
  

  const Allitem({super.key,required this.iimage, required this.name, this.res,  });

  @override
  State<Allitem> createState() => _AllitemState();
}

class _AllitemState extends State<Allitem> {
  @override
  Widget build(BuildContext context) {
     return Column(
       children: [
         InkWell(
          onTap: widget.res,
          child: Container(
            width: 100,
           // height: 390,
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(widget.iimage,
                    
                    height: 80,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  widget.name,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
         )
         ),
         //SizedBox(height: 20,),
         
       ],
     );
      
  }
}
