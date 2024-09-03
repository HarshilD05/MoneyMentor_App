import 'package:flutter/material.dart';

class TDS_PopupDescription extends StatelessWidget {
  final String title;
  final String description;

  const TDS_PopupDescription({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4.0,
            blurRadius: 5.0,
          )
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text( 
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
        content: Flexible(
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: Text(description),
          ),
        ),
      ),
    );
  }
}

// Section 80 C 
const TDS_PopupDescription section80C = TDS_PopupDescription(
  title: 'Section 80C',
  description: """Section 80C of the Income Tax Act allows you to claim deductions up to Rs. 1.5 lakh for investments made in specified instruments such as PPF, EPF, NSC, ELSS, etc.
  These Investments have a minimum lock-in Period and cannot be withdrawn before the specified time period.: 
  1. PPF : 15 Years
  2. EPF : Till Retirement
  3. NSC : 5 Years
  4. ELSS : 3 Years
  5. Home Loan Principle : 5 Years
  """,
);

// Section 80 D : Medical Premiums
const TDS_PopupDescription section80D = TDS_PopupDescription(
  title: 'Medical Premiums [Section 80D]',
  description: 'Section 80D of the Income Tax Act allows you to claim deductions up to Rs. 25,000 for health insurance premiums paid for self, spouse, and children. An additional deduction of Rs. 25,000 is allowed for premiums paid for parents. If the parents are senior citizens (>65), the deduction limit is Rs. 50,000.',
);

// Section 80 E : Education Loans
const TDS_PopupDescription section80E = TDS_PopupDescription(
  title: 'Education Loans [Section 80E]',
  description: 'Section 80E of the Income Tax Act allows you to claim deductions on the interest paid on education loans for higher studies. The deduction is available for a maximum of 8 years or until the interest is paid, whichever is earlier.',
);

// Section 80 TTA and TTB : Savings Account Interest
const TDS_PopupDescription section80TTA = TDS_PopupDescription(
  title: 'Savings Account Interest [Section 80TTA]',
  description: 'Section 80TTA of the Income Tax Act allows you to claim deductions up to Rs. 10,000 on interest earned from savings accounts. Whereas Section 80TTB allows senior citizens to claim deductions up to Rs. 50,000 on interest earned from savings accounts.',
);

// Scetion 80 CCD : NPS Contributions
const TDS_PopupDescription section80CCD = TDS_PopupDescription(
  title: 'NPS Contributions [Section 80CCD]',
  description: 'Section 80CCD of the Income Tax Act allows you to claim deductions on contributions made to the National Pension Scheme (NPS). The deduction limit is 10% of the salary for salaried individuals and 20% of the gross total income for self-employed individuals along with an additional deduction of ₹50,000 under Section 80CCD(1B).',
);

// Section 24 : Home Loan Interest
const TDS_PopupDescription section24 = TDS_PopupDescription(
  title: 'Home Loan Interest [Section 24]',
  description: 'Section 24 of the Income Tax Act allows you to claim deductions on the interest paid on home loans. The maximum deduction allowed is ₹2 lakh for self-occupied properties and the entire interest amount for let-out properties.',
);

// Section 10[14] : Leave Travel Allowance
const TDS_PopupDescription section10_14 = TDS_PopupDescription(
  title: 'Leave Travel Allowance [Section 10]',
  description: 'Section 10 of the Income Tax Act allows you to claim deductions on the expenses incurred for travel within India. The deduction is available for two journeys in a block of four years.',
);

// Section 10[13a] : House Rent Allowance
const TDS_PopupDescription section10_13a = TDS_PopupDescription(
  title: 'House Rent Allowance [Section 10(13A)]',
  description: 'Section 10(13A) of the Income Tax Act allows you to claim deductions on the House Rent Allowance received from your employer. The deduction amount is the minimum of the following: 1) Actual HRA received, 2) 50% of the salary for individuals living in metro cities or 40% for non-metro cities, 3) Rent paid in excess of 10% of the salary.',
);

