// import "package:flutter/material.dart";

// class TaxDisplayCard extends StatelessWidget {
//   final String title;
//   final String taxValue;
//   final String netSalary;

//   const TaxDisplayCard({super.key, 
//     required this.title,
//     required this.taxValue,
//     required this.netSalary,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       margin: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 "Tax : ",
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 taxValue,
//                 style: const TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 "Net Salary : ",
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 netSalary,
//                 style: const TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

// }



/////////////

import "package:flutter/material.dart";
import "package:moneymentor/utils/helpers/helper_functions.dart";

class TaxDisplayCard extends StatelessWidget {
  final String title;
  final String taxValue;
  final String netSalary;
  final double taxableSalary;

  const TaxDisplayCard({
    super.key,
    required this.title,
    required this.taxValue,
    required this.netSalary,
    required this.taxableSalary,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: dark ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Taxable Salary : ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                taxableSalary.toString(),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Tax : ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                taxValue,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Net Salary : ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                netSalary,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
