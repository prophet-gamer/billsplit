import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class Resultpage extends StatefulWidget {
  final String bill;
  final String tax;
  final double friends;
  final double tip;
  const Resultpage(this.bill, this.friends, this.tax, this.tip, {super.key});

  @override
  State<Resultpage> createState() => _ResultpageState();
}

class _ResultpageState extends State<Resultpage> {
  String dividedamount = '';
  @override
  void initState() {
    super.initState();
    divideamount();
  }

  divideamount() {
    double taxamount =
        double.parse(widget.bill) * (double.parse(widget.tax) / 100);
    double finalbill =
        (double.parse(widget.bill) + taxamount + widget.tip) / widget.friends;
    setState(() {
      dividedamount = finalbill.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 40),
              child: Text(
                "Result: ",
                style: GoogleFonts.montserrat(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
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
                          "Equally Divided",
                          style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          dividedamount,
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
                            Text("Friends",
                                style: GoogleFonts.montserrat(
                                    fontSize: 16, fontWeight: FontWeight.w700)),
                            Text("Tax",
                                style: GoogleFonts.montserrat(
                                    fontSize: 16, fontWeight: FontWeight.w700)),
                            Text("Tip",
                                style: GoogleFonts.montserrat(
                                    fontSize: 16, fontWeight: FontWeight.w700)),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.friends.round().toString(),
                                style: GoogleFonts.montserrat(
                                    fontSize: 16, fontWeight: FontWeight.w700)),
                            Text("${widget.tax} %",
                                style: GoogleFonts.montserrat(
                                    fontSize: 16, fontWeight: FontWeight.w700)),
                            Text("\$${widget.tip.round().toString()}",
                                style: GoogleFonts.montserrat(
                                    fontSize: 16, fontWeight: FontWeight.w700)),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Column(
                children: [
                  Text(
                    "Everybody should pay $dividedamount",
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.deepOrange),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Calculate Again",
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
