import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dividend/dividend.dart';

class DividendPage extends StatefulWidget {
  DividendPage({super.key});

  @override
  State<DividendPage> createState() => _DividendPageState();
}

class _DividendPageState extends State<DividendPage> {
  TextEditingController _stockAmountcontroller = TextEditingController();

  TextEditingController _investmentDaysLeftcontroller = TextEditingController();

  TextEditingController _totalInvestmentDaysAmountcontroller = TextEditingController();

  TextEditingController _totalInterestcontroller = TextEditingController();

  String result = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 400,
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'stock amount',
                              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            ),
                            controller: _stockAmountcontroller,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'investment days left',
                              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            ),
                            controller: _investmentDaysLeftcontroller,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'total investment days amount',
                              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            ),
                            controller: _totalInvestmentDaysAmountcontroller,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'total interest',
                              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            ),
                            controller: _totalInterestcontroller,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),

                    //output
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey), bottom: BorderSide(color: Colors.grey), left: BorderSide(color: Colors.grey), right: BorderSide(color: Colors.grey) )
                      ),
                      child: Center(child: Text('$result')),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                        onPressed: (){
                          Dividend dividend1 = Dividend(
                              stockAmount: double.parse(_stockAmountcontroller.text.trim()),
                              investmentDaysLeft: int.parse(_investmentDaysLeftcontroller.text.trim()),
                              totalInterest: double.parse(_totalInterestcontroller.text.trim()),
                              totalInvestmentDaysAmount: double.parse(_totalInvestmentDaysAmountcontroller.text.trim())
                          );
                          double dividend;
                          dividend = dividend1.calculateDividend(stockAmount: double.parse(_stockAmountcontroller.text.trim()), investmentDaysLeft: int.parse(_investmentDaysLeftcontroller.text.trim()), totalInvestmentDaysAmount: double.parse(_totalInvestmentDaysAmountcontroller.text.trim()), totalInterest: double.parse(_totalInterestcontroller.text.trim()));
                          setState(() {
                            result = (dividend*double.parse(_stockAmountcontroller.text.trim())).toString();
                          });
                        },
                        child: Text('CALCULATE')
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
