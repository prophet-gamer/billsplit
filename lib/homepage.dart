import "package:billsplit/result.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class BillSplit extends StatefulWidget {
  const BillSplit({super.key});

  @override
  State<BillSplit> createState() => _BillSplitState();
}

class _BillSplitState extends State<BillSplit> {
  double friendsValue = 0.0;
  double tip = 0.0;
  String tax = '0';
  String bill = '';

  buildBotton(String text) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(15),
        ),
        onPressed: () {
          if (text == '-') {
            setState(() {
              bill = '';
            });
          } else {
            setState(() {
              bill += text;
            });
          }
        },
        child: Text(
          text,
          style:
              GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  TextStyle infostyle =
      GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 40),
                child: Text(
                  "Split Bill",
                  style: GoogleFonts.montserrat(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: const BoxDecoration(color: Colors.yellow),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Amount",
                            style: GoogleFonts.montserrat(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            bill,
                            style: GoogleFonts.montserrat(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Friends", style: infostyle),
                              Text("Tax", style: infostyle),
                              Text("Tip", style: infostyle),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(friendsValue.round().toString(),
                                  style: infostyle),
                              Text("$tax %", style: infostyle),
                              Text("\$${tip.round().toString()}",
                                  style: infostyle),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "How Many Friedns?",
                style: GoogleFonts.montserrat(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              Slider(
                min: 0,
                max: 15,
                divisions: 15,
                activeColor: Colors.orange,
                inactiveColor: Colors.grey,
                value: friendsValue,
                onChanged: (value) {
                  setState(() {
                    friendsValue = value;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Tip",
                          style: GoogleFonts.montserrat(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    tip--;
                                  });
                                },
                                backgroundColor: Colors.grey[400],
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              "\$${tip.round().toString()}",
                              style: GoogleFonts.montserrat(
                                  fontSize: 27,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    tip++;
                                  });
                                },
                                backgroundColor: Colors.grey[400],
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            tax = value;
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Tax in %",
                          labelStyle: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  buildBotton("1"),
                  buildBotton("2"),
                  buildBotton("3"),
                ],
              ),
              Row(
                children: [
                  buildBotton("4"),
                  buildBotton("5"),
                  buildBotton("6"),
                ],
              ),
              Row(
                children: [
                  buildBotton("7"),
                  buildBotton("8"),
                  buildBotton("9"),
                ],
              ),
              Row(
                children: [
                  buildBotton("."),
                  buildBotton("0"),
                  buildBotton("-"),
                ],
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Resultpage(bill, friendsValue, tax, tip),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Split Bill",
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
