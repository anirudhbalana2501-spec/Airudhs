import 'package:flutter/material.dart';

class Allitem extends StatefulWidget {
  final String iimage;
  final String name;
 // final String? foods;
 // final String? namms;
  final Function()? res;
  //final Function()? asd;

  const Allitem({
    super.key,
    required this.iimage,
    required this.name,
    this.res,
   // required this.foods,
    //required this.namms,
    //this.asd,
  });

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
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    widget.iimage,
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
          ),
        ),

        

        // InkWell(
        //   onTap: widget.asd,
        //   child: Container(
        //     width: 100,
        //     margin: EdgeInsets.symmetric(horizontal: 8),
        //     child: Column(
        //       children: [
        //         ClipRRect(
        //           borderRadius: BorderRadius.circular(12),
        //           child: Image.asset(
        //             widget.foods ?? "assets/images/default.png",
        //             height: 80,
        //             width: 110,
        //             fit: BoxFit.cover,
        //           ),
        //         ),
        //         SizedBox(height: 5),
        //         Text(
        //           widget.namms ?? "",
        //           overflow: TextOverflow.ellipsis,
        //         )
        //       ],
        //     ),
        //   ),
        // ),
       ],
     );
   }
}

// class Allitem extends StatefulWidget {
//   final dynamic iimage;
//   final dynamic name;
//   final dynamic foods;
//   final dynamic namms;
//   final dynamic Function()? res;
//   final dynamic Function()? asd;
  
//   //final dynamic Function()? all;
  

//   const Allitem({super.key,required this.iimage, required this.name, this.res, this.foods, this.namms, this.asd  });

//   @override
//   State<Allitem> createState() => _AllitemState();
// }

// class _AllitemState extends State<Allitem> {
//   @override
//   Widget build(BuildContext context) {
//      return Column(
//        children: [
//          InkWell(
//           onTap: widget.res,
//           child: Container(
//             width: 100,
//            // height: 390,
//             margin: EdgeInsets.symmetric(horizontal: 8),
//             child: Column(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.asset(widget.iimage,
                    
//                     height: 80,
//                     width: 110,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   widget.name,
//                   overflow: TextOverflow.ellipsis,
//                 )
//               ],
//             ),
//          )
//          ),
//           SizedBox(height: 5,),
//           InkWell(
//           onTap: widget.asd,
//           child: Container(
//             width: 100,
//            // height: 390,
//             margin: EdgeInsets.symmetric(horizontal: 8),
//             child: Column(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.asset(widget.foods,
                    
//                     height: 80,
//                     width: 110,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   widget.namms,
//                   overflow: TextOverflow.ellipsis,
//                 )
//               ],
//             ),
//          )
//          ),
         
//        ],
//      );
      
//   }

