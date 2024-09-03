// import 'package:flutter/material.dart';
// import "package:get/get.dart";
// import "package:moneymentor/models/tax_calculation_data.dart";
// import "package:moneymentor/HD_pages/tax_comparison_page.dart";
// import "package:moneymentor/harshil_widgets/HD_TDS_description.dart";
// import "package:moneymentor/models/validators.dart";

// String? validatePositiveInt(String? value) {
//   if (value!.isEmpty) {
//     return 'Please enter a value';
//   }
//   final RegExp regex = RegExp(r'^[0-9]+$');
//   if (!regex.hasMatch(value)) {
//     return 'Please enter a valid non-negative integer';
//   }
//   return null;
// }

// class DeductionComponentsForm extends StatefulWidget {
//   final TaxCalculationData taxCalculationData;

//   const DeductionComponentsForm({super.key, required this.taxCalculationData});

//   @override
//   _DeductionComponentsFormState createState() =>
//       _DeductionComponentsFormState();
// }

// class _DeductionComponentsFormState extends State<DeductionComponentsForm> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Enter Deduction Components'),
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//           child: Column(
//             children: [
//               // Section 80C Total Deductions
//               Container(
//                   margin: const EdgeInsets.all(15),
//                   child: Column(
//                     children: [
//                       // Standard Deduction
//                       Container(
//                         margin: const EdgeInsets.all(15),
//                         child: TextFormField(
//                           decoration: const InputDecoration(
//                             labelText: 'Standard Deduction',
//                           ),
//                           keyboardType: TextInputType.number,
//                           initialValue:
//                               widget.taxCalculationData.stdDeduction.toString(),
//                           onChanged: (String? value) {
//                             setState(() {
//                               widget.taxCalculationData.stdDeduction =
//                                   (value!.isEmpty) ? 0 : int.parse(value);
//                               widget.taxCalculationData
//                                   .calculateTaxableSalary();
//                             });
//                           },
//                         ),
//                       ),

//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Container(
//                             child: Row(
//                               children: [
//                                 const Text(
//                                   'Section 80C',
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 IconButton(
//                                   icon: const Icon(Icons.info),
//                                   onPressed: () {
//                                     showDialog(
//                                         context: context,
//                                         builder: (BuildContext context) {
//                                           return section80C;
//                                         });
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Text(
//                               "${widget.taxCalculationData.calculate80CDeductions()}",
//                               style: const TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold))
//                         ],
//                       ),

//                       // PPF
//                       Container(
//                         margin: const EdgeInsets.all(15),
//                         child: TextFormField(
//                           decoration: const InputDecoration(labelText: 'PPF'),
//                           keyboardType: TextInputType.number,
//                           onChanged: (String? value) {
//                             setState(() {
//                               widget.taxCalculationData.ppf =
//                                   (value!.isEmpty) ? 0 : int.parse(value);
//                               widget.taxCalculationData
//                                   .calculateTaxableSalary();
//                             });
//                           },
//                         ),
//                       ),

//                       // ELSS
//                       Container(
//                         margin: const EdgeInsets.all(15),
//                         child: TextFormField(
//                           decoration: const InputDecoration(labelText: 'ELSS'),
//                           keyboardType: TextInputType.number,
//                           onChanged: (String? value) {
//                             setState(() {
//                               widget.taxCalculationData.elss =
//                                   (value!.isEmpty) ? 0 : int.parse(value);
//                               widget.taxCalculationData
//                                   .calculateTaxableSalary();
//                             });
//                           },
//                         ),
//                       ),

//                       // EPF
//                       Container(
//                         margin: const EdgeInsets.all(15),
//                         child: TextFormField(
//                           decoration: const InputDecoration(labelText: 'EPF'),
//                           keyboardType: TextInputType.number,
//                           onChanged: (String? value) {
//                             setState(() {
//                               widget.taxCalculationData.epf =
//                                   (value!.isEmpty) ? 0 : int.parse(value);
//                               widget.taxCalculationData
//                                   .calculateTaxableSalary();
//                             });
//                           },
//                         ),
//                       ),

//                       // NSC
//                       Container(
//                         margin: const EdgeInsets.all(15),
//                         child: TextFormField(
//                           decoration: const InputDecoration(labelText: 'NSC'),
//                           keyboardType: TextInputType.number,
//                           onChanged: (String? value) {
//                             setState(() {
//                               widget.taxCalculationData.nsc =
//                                   (value!.isEmpty) ? 0 : int.parse(value);
//                               widget.taxCalculationData
//                                   .calculateTaxableSalary();
//                             });
//                           },
//                         ),
//                       ),

//                       // Home Loan Principle
//                       Container(
//                         margin: const EdgeInsets.all(15),
//                         child: TextFormField(
//                           decoration:
//                               const InputDecoration(labelText: 'Home Loan Principle'),
//                           keyboardType: TextInputType.number,
//                           onChanged: (String? value) {
//                             setState(() {
//                               widget.taxCalculationData.homeLoanPrinciple80C =
//                                   (value!.isEmpty) ? 0 : int.parse(value);
//                               widget.taxCalculationData
//                                   .calculateTaxableSalary();
//                             });
//                           },
//                         ),
//                       ),
//                     ],
//                   )),

//               // Section 80CCD(1B)
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 margin: const EdgeInsets.all(10),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'NPS [80CCD(1B)]',
//                     suffixIcon: IconButton(
//                       icon: const Icon(Icons.info),
//                       onPressed: () {
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return section80CCD;
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                   keyboardType: TextInputType.number,
//                   validator: validate80CCDdeduction,
//                   onChanged: (String? value) {
//                     setState(() {
//                       widget.taxCalculationData.nps =
//                           (value!.isEmpty) ? 0 : int.parse(value);
//                       widget.taxCalculationData.calculateTaxableSalary();
//                     });
//                   },
//                 ),
//               ),

//               // Section 80D
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 margin: const EdgeInsets.all(10),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                       labelText: 'Medical Premiums [80D]',
//                       suffixIcon: IconButton(
//                         icon: const Icon(Icons.info),
//                         onPressed: () {
//                           showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return section80D;
//                               });
//                         },
//                       )),
//                   keyboardType: TextInputType.number,
//                   validator: validate80Ddeduction,
//                   onChanged: (String? value) {
//                     setState(() {
//                       widget.taxCalculationData.medicalPremiums =
//                           (value!.isEmpty) ? 0 : int.parse(value);
//                       widget.taxCalculationData.calculateTaxableSalary();
//                     });
//                   },
//                 ),
//               ),

//               // Section 80E
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 margin: const EdgeInsets.all(10),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'Education Loan Interest [80E]',
//                     suffixIcon: IconButton(
//                       icon: const Icon(Icons.info),
//                       onPressed: () {
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return section80E;
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                   keyboardType: TextInputType.number,
//                   onChanged: (String? value) {
//                     setState(() {
//                       widget.taxCalculationData.educationLoanInterest =
//                           (value!.isEmpty) ? 0 : int.parse(value);
//                       widget.taxCalculationData.calculateTaxableSalary();
//                     });
//                   },
//                 ),
//               ),

//               // Section 80TTA
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 margin: const EdgeInsets.all(10),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'Savings Account Interest [80TTA]',
//                     suffixIcon: IconButton(
//                       icon: const Icon(Icons.info),
//                       onPressed: () {
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return section80TTA;
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                   keyboardType: TextInputType.number,
//                   validator: validate80TTAdeduction,
//                   onChanged: (String? value) {
//                     setState(() {
//                       widget.taxCalculationData.savingsAccountInterest =
//                           (value!.isEmpty) ? 0 : int.parse(value);
//                       widget.taxCalculationData.calculateTaxableSalary();
//                     });
//                   },
//                 ),
//               ),

//               // Section 24B
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 margin: const EdgeInsets.all(10),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'Home Loan Interest [24B]',
//                     suffixIcon: IconButton(
//                       icon: const Icon(Icons.info),
//                       onPressed: () {
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return section24;
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                   keyboardType: TextInputType.number,
//                   validator: validate24Bdeduction,
//                   onChanged: (String? value) {
//                     setState(() {
//                       widget.taxCalculationData.homeLoanInterest24B =
//                           (value!.isEmpty) ? 0 : int.parse(value);
//                       widget.taxCalculationData.calculateTaxableSalary();
//                     });
//                   },
//                 ),
//               ),

//               // Section 10(13A)
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 margin: const EdgeInsets.all(10),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'Rent Paid [10(13A)]',
//                     suffixIcon: IconButton(
//                       icon: const Icon(Icons.info),
//                       onPressed: () {
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return section10_13a;
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                   keyboardType: TextInputType.number,
//                   validator: (value) => validateHRAdeduction(
//                       (value!.isEmpty) ? 0 : int.parse(value),
//                       widget.taxCalculationData),
//                   onChanged: (String? value) {
//                     setState(() {
//                       widget.taxCalculationData.rentPaid =
//                           (value!.isEmpty) ? 0 : double.parse(value);
//                       widget.taxCalculationData.calculateTaxableSalary();
//                       widget.taxCalculationData.calculateHRAexemption();
//                     });
//                   },
//                 ),
//               ),

//               Container(
//                 child: Text(
//                   "Final HRA Exemption : ${widget.taxCalculationData.hraExemption.toStringAsFixed(2)}"
//                 )
//               ),

//               // Total Deductions
//               Container(
//                   margin: const EdgeInsets.all(15),
//                   child: Column(
//                     children: [
//                       const Text(
//                         'Total Deductions',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                           "${widget.taxCalculationData.calculateTotalDeductions()}",
//                           style: const TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold))
//                     ],
//                   )),

//               // Taxable Salary
//               Container(
//                   margin: const EdgeInsets.all(15),
//                   child: Column(
//                     children: [
//                       const Text(
//                         'Taxable Salary',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                           widget.taxCalculationData.taxableSalary.toStringAsFixed(2),
//                           style: const TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold))
//                     ],
//                   )),

//               // Next Button
//               ElevatedButton(
//                 onPressed: () {
//                   widget.taxCalculationData.calculateTaxOldRegime();
//                   widget.taxCalculationData.calculateTaxNewRegime();
//                   Get.to(TaxComparisonPage(
//                       taxCalculationData: widget.taxCalculationData));
//                 },
//                 child: const Text('Next'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



///////////////////

import 'package:flutter/material.dart';
import "package:get/get.dart";
import "package:moneymentor/models/tax_calculation_data.dart";
import "package:moneymentor/HD_pages/tax_comparison_page.dart";
import "package:moneymentor/harshil_widgets/HD_TDS_description.dart";
import "package:moneymentor/models/validators.dart";
import "package:moneymentor/utils/helpers/helper_functions.dart";

String? validatePositiveInt(String? value) {
  if (value!.isEmpty) {
    return 'Please enter a value';
  }
  final RegExp regex = RegExp(r'^[0-9]+$');
  if (!regex.hasMatch(value)) {
    return 'Please enter a valid non-negative integer';
  }
  return null;
}

class DeductionComponentsForm extends StatefulWidget {
  final TaxCalculationData taxCalculationData;

  const DeductionComponentsForm({super.key, required this.taxCalculationData});

  @override
  _DeductionComponentsFormState createState() =>
      _DeductionComponentsFormState();
}

class _DeductionComponentsFormState extends State<DeductionComponentsForm> {
  String? _metroPolitanCity = "Yes";

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Deduction Components'),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              // Section 80C Total Deductions
              Column(
                children: [
                  // Standard Deduction
                  Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: dark ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2.0,
                          blurRadius: 5.0,
                        )
                      ],
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Standard Deduction',
                      ),
                      keyboardType: TextInputType.number,
                      initialValue:
                          widget.taxCalculationData.stdDeduction.toString(),
                      onChanged: (String? value) {
                        setState(() {
                          widget.taxCalculationData.stdDeduction =
                              (value!.isEmpty) ? 0 : int.parse(value);
                          widget.taxCalculationData.calculateTaxableSalary();
                        });
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: dark ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2.0,
                            blurRadius: 5.0,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Section 80C',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.info),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return section80C;
                                            });
                                      },
                                    ),
                                  ],
                                ),
                                Text(
                                    "${widget.taxCalculationData.calculate80CDeductions()}",
                                    style: const TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),

                          // PPF
                          Container(
                            margin: const EdgeInsets.all(15),
                            child: TextFormField(
                              decoration:
                                  const InputDecoration(labelText: 'PPF'),
                              keyboardType: TextInputType.number,
                              onChanged: (String? value) {
                                setState(() {
                                  widget.taxCalculationData.ppf =
                                      (value!.isEmpty) ? 0 : int.parse(value);
                                  widget.taxCalculationData
                                      .calculateTaxableSalary();
                                });
                              },
                            ),
                          ),

                          // ELSS
                          Container(
                            margin: const EdgeInsets.all(15),
                            child: TextFormField(
                              decoration:
                                  const InputDecoration(labelText: 'ELSS'),
                              keyboardType: TextInputType.number,
                              onChanged: (String? value) {
                                setState(() {
                                  widget.taxCalculationData.elss =
                                      (value!.isEmpty) ? 0 : int.parse(value);
                                  widget.taxCalculationData
                                      .calculateTaxableSalary();
                                });
                              },
                            ),
                          ),

                          // EPF
                          Container(
                            margin: const EdgeInsets.all(15),
                            child: TextFormField(
                              decoration:
                                  const InputDecoration(labelText: 'EPF'),
                              keyboardType: TextInputType.number,
                              onChanged: (String? value) {
                                setState(() {
                                  widget.taxCalculationData.epf =
                                      (value!.isEmpty) ? 0 : int.parse(value);
                                  widget.taxCalculationData
                                      .calculateTaxableSalary();
                                });
                              },
                            ),
                          ),

                          // NSC
                          Container(
                            margin: const EdgeInsets.all(15),
                            child: TextFormField(
                              decoration:
                                  const InputDecoration(labelText: 'NSC'),
                              keyboardType: TextInputType.number,
                              onChanged: (String? value) {
                                setState(() {
                                  widget.taxCalculationData.nsc =
                                      (value!.isEmpty) ? 0 : int.parse(value);
                                  widget.taxCalculationData
                                      .calculateTaxableSalary();
                                });
                              },
                            ),
                          ),

                          // Home Loan Principle
                          Container(
                            margin: const EdgeInsets.all(15),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  labelText: 'Home Loan Principle'),
                              keyboardType: TextInputType.number,
                              onChanged: (String? value) {
                                setState(() {
                                  widget.taxCalculationData
                                          .homeLoanPrinciple80C =
                                      (value!.isEmpty) ? 0 : int.parse(value);
                                  widget.taxCalculationData
                                      .calculateTaxableSalary();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Section 80CCD(1B)
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'NPS [80CCD(1B)]',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.info),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return section80CCD;
                              },
                            );
                          },
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: validate80CCDdeduction,
                      onChanged: (String? value) {
                        setState(() {
                          widget.taxCalculationData.nps =
                              (value!.isEmpty) ? 0 : int.parse(value);
                          widget.taxCalculationData.calculateTaxableSalary();
                        });
                      },
                    ),
                  ),

                  // Section 80D
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Medical Premiums [80D]',
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.info),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return section80D;
                                  });
                            },
                          )),
                      keyboardType: TextInputType.number,
                      validator: validate80Ddeduction,
                      onChanged: (String? value) {
                        setState(() {
                          widget.taxCalculationData.medicalPremiums =
                              (value!.isEmpty) ? 0 : int.parse(value);
                          widget.taxCalculationData.calculateTaxableSalary();
                        });
                      },
                    ),
                  ),

                  // Section 80E
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Education Loan Interest [80E]',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.info),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return section80E;
                              },
                            );
                          },
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (String? value) {
                        setState(() {
                          widget.taxCalculationData.educationLoanInterest =
                              (value!.isEmpty) ? 0 : int.parse(value);
                          widget.taxCalculationData.calculateTaxableSalary();
                        });
                      },
                    ),
                  ),

                  // Section 80TTA
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Savings Account Interest [80TTA]',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.info),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return section80TTA;
                              },
                            );
                          },
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: validate80TTAdeduction,
                      onChanged: (String? value) {
                        setState(() {
                          widget.taxCalculationData.savingsAccountInterest =
                              (value!.isEmpty) ? 0 : int.parse(value);
                          widget.taxCalculationData.calculateTaxableSalary();
                        });
                      },
                    ),
                  ),

                  // Section 24B
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Home Loan Interest [24B]',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.info),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return section24;
                              },
                            );
                          },
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: validate24Bdeduction,
                      onChanged: (String? value) {
                        setState(() {
                          widget.taxCalculationData.homeLoanInterest24B =
                              (value!.isEmpty) ? 0 : int.parse(value);
                          widget.taxCalculationData.calculateTaxableSalary();
                        });
                      },
                    ),
                  ),

                  // MetroPolitan City
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: dark ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2.0,
                          blurRadius: 5.0,
                        )
                      ],
                    ),
                    margin: const EdgeInsets.all(15),
                    child: Column(
                      children : [
                        const Text(
                          'MetroPolitan City',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),

                        RadioListTile(
                          title: const Text("Yes"),
                          value: "Yes",
                          groupValue: _metroPolitanCity,
                          onChanged: (String? value) {
                            setState(() {
                              _metroPolitanCity = value;
                              widget.taxCalculationData.metroPolitanCity = true;
                              widget.taxCalculationData.calculateHRAexemption();
                              widget.taxCalculationData.calculateTaxableSalary();
                            });                              
                          }, 
                        ),
                        RadioListTile(
                          title: const Text("No"),
                          value: "No",
                          groupValue: _metroPolitanCity,
                          onChanged : (String? value) {
                            setState(() {
                              _metroPolitanCity = value;
                              widget.taxCalculationData.metroPolitanCity = false;
                              widget.taxCalculationData.calculateHRAexemption();
                              widget.taxCalculationData.calculateTaxableSalary();
                            });
                          }
                        )
                      ]

                    )
                  ),


                  // Section 10(13A)
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Rent Paid [10(13A)]',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.info),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return section10_13a;
                              },
                            );
                          },
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) => validateHRAdeduction(
                          (value!.isEmpty) ? 0 : int.parse(value),
                          widget.taxCalculationData),
                      onChanged: (String? value) {
                        setState(() {
                          widget.taxCalculationData.rentPaid =
                              (value!.isEmpty) ? 0 : double.parse(value);
                          widget.taxCalculationData.calculateTaxableSalary();
                          widget.taxCalculationData.calculateHRAexemption();
                        });
                      },
                    ),
                  ),
                ],
              ),

              Container(
                  child: Text(
                      "Final HRA Exemption : ${widget.taxCalculationData.hraExemption.toStringAsFixed(2)}")),

              // Total Deductions
              Container(
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      const Text(
                        'Total Deductions',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                          "${widget.taxCalculationData.calculateTotalDeductions()}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  )),

              // Taxable Salary
              Container(
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      const Text(
                        'Taxable Salary',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                          widget.taxCalculationData.taxableSalary
                              .toStringAsFixed(2),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  )),

              // Next Button
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.taxCalculationData.calculateTaxOldRegime();
                      widget.taxCalculationData.calculateTaxNewRegime();
                      Get.to(TaxComparisonPage(
                          taxCalculationData: widget.taxCalculationData));
                    },
                    child: const Text('Next'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
