import 'package:flutter/material.dart';

class EMI extends StatefulWidget {
  const EMI({Key? key}) : super(key: key);

  @override
  State<EMI> createState() => _EMIState();
}

class _EMIState extends State<EMI> {
  double l = 0;
  double r = 0;
  double t = 0;
  double a = 0;

  amountCalc() {
    setState(() {
      a = l * (1 + r * t);
    });
  }

  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.blue,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                  size: 35,
                ),
              )
            ],
          ),
          SizedBox(
            height: height / 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Home',
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
          SizedBox(
            height: height / 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Profile',
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
          SizedBox(
            height: height / 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Logout',
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ]),
      ),
      body: Stack(
        children: [
          Container(
            height: height / 2.5,
            width: width / 1,
            color: Colors.blue,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: width / 5,
                      ),
                      Text(
                        "EMI CALCULATOR",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 20,
                ),
                Text(
                  "your loan EMI is",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  "${double.parse(a.toStringAsFixed(2))}",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: height / 1.5,
                  width: width / 1.1,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Loan Amount",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "${double.parse(l.toStringAsFixed(2))}",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Slider(
                        onChanged: (loanAmount) {
                          setState(() {
                            l = loanAmount;
                          });
                        },
                        value: l,
                        max: 1000000,
                        min: 0,
                      ),
                      SizedBox(
                        height: height / 55,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Interest Rate",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "${double.parse(r.toStringAsFixed(2))}%",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Slider(
                        onChanged: (rate) {
                          setState(() {
                            r = rate;
                          });
                        },
                        value: r,
                        min: 0,
                        max: 10,
                      ),
                      SizedBox(
                        height: height / 55,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "loan Tenure",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "${double.parse(t.toStringAsFixed(1))}years",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Slider(
                        onChanged: (tenure) {
                          setState(() {
                            t = tenure;
                          });
                        },
                        value: t,
                        min: 0,
                        max: 15,
                      ),
                      SizedBox(
                        height: height / 15,
                      ),
                      ElevatedButton(
                        onPressed: amountCalc,
                        child: Text(
                          "Claculate",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
