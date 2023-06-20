import 'package:flutter/material.dart';
import 'package:flutter_project/AddDebitCard.dart';

class RimoneChargeCard extends StatefulWidget {
  const RimoneChargeCard({Key? key}) : super(key: key);

  @override
  State<RimoneChargeCard> createState() => _RimoneChargeCardState();
}

class _RimoneChargeCardState extends State<RimoneChargeCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            color: Colors.yellow,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.account_balance_wallet,
                        color: Colors.white,
                        size: 48,
                      ),
                      Text(
                        '₹5,000.00',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector( onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddCard()));
                      },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Add Card',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Icon(Icons.add),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // replace with your actual transaction count
              itemBuilder: (context, index) {
                if (index < 3) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(Icons.money),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Transaction ${index + 1}'),
                                SizedBox(height: 4),
                                Text('April 14, 2023'),
                              ],
                            ),
                            Spacer(),
                            Text(
                              '-₹50.00',
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return SizedBox(height: 0);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
