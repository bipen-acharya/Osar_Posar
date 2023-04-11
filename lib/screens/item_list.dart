// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:osar_pasar/screens/address.dart';

// import '../utils/colors.dart';

// class ItemListScreen extends StatelessWidget {
//   const ItemListScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var textTheme = Theme.of(Get.context!).textTheme;
//     var theme = Theme.of(Get.context!);
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 5,
//         shadowColor: const Color(0xFF494949).withOpacity(0.06),
//         backgroundColor: Colors.white,
//         leading: InkWell(
//           onTap: () {
//             Get.back();
//           },
//           child: const Padding(
//             padding: EdgeInsets.only(left: 20),
//             child: Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         title: Text(
//           "Item List",
//           style: textTheme.titleLarge!
//               .copyWith(fontSize: 16, color: AppColors.textColor),
//         ),
//         centerTitle: false,
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.add),
//           ),
//         ],
//       ),
//       body: Container(
//         margin: const EdgeInsets.only(bottom: 15),
//         child: ListView.builder(
//             shrinkWrap: true,
//             itemCount: 10,
//             itemBuilder: (context, index) {
//               return const ItemList();
//             }),
//       ),
//       bottomNavigationBar: Container(
//         margin: const EdgeInsets.only(bottom: 46, right: 35, left: 35),
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//             backgroundColor: const Color(0xff00183F),
//             minimumSize: const Size.fromHeight(50),
//           ),
//           onPressed: () {
//             Get.to(() => AddressPage());
//           },
//           child: const Text("Continue"),
//         ),
//       ),
//     );
//   }
// }

// class ItemList extends StatelessWidget {
//   const ItemList({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 35),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(bottom: 13, top: 25),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 // ignore: prefer_const_constructors
//                 Text(
//                   "Electronics",
//                   style: const TextStyle(
//                     fontSize: 10,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 8,
//                 ),
//                 Expanded(
//                     child: Container(
//                   height: 1.5,
//                   color: const Color.fromRGBO(239, 239, 239, 1),
//                 ))
//               ],
//             ),
//           ),
//           Container(
//             height: 48,
//             decoration: BoxDecoration(
//               borderRadius: (BorderRadius.circular(5)),
//               color: Colors.white,
//               border: Border.all(
//                 color: Colors.grey,
//                 width: 2,
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.only(left: 16),
//                   child: Text("Television"),
//                 ),
//                 Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.remove,
//                         size: 20,
//                       ),
//                     ),
//                     const Text("1"),
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.add,
//                         size: 20,
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
