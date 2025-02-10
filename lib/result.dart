import 'package:flutter/material.dart';
import 'package:irovolt_app/helpers/app_config.dart';
import 'package:irovolt_app/home.dart';

class Result extends StatefulWidget {
  final String appliance;
  final double dayCost;
  final double weekCost;
  final double monthCost;
  final double yearCost;

  const Result({
    super.key,
    required this.appliance,
    required this.dayCost,
    required this.weekCost,
    required this.monthCost,
    required this.yearCost,
  });

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConfig.primaryColor.shade300,
        title: Text(
          AppConfig.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leadingWidth: 80,
        leading: Padding(
          padding: EdgeInsets.only(left: 0, bottom: 12),
          child: Image.asset(
            AppConfig.logo,
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Appliance Energy Calculator",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Estimated cost to operate",
                style: TextStyle(
                  color: const Color(0xff0c3b2e),
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Text(
                  widget.appliance,
                  style: TextStyle(
                    fontSize: 20,
                    color: const Color(0xffb46617),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card.filled(
                color: const Color(0xff0c3b2e),
                child: SizedBox(
                  width: 400,
                  height: 160,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Cost per day",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Card.outlined(
                            child: SizedBox(
                              width: 130,
                              height: 50,
                              child: Center(
                                child: Text(
                                  "₱ ${widget.dayCost.toStringAsFixed(3)}",
                                  style: TextStyle(
                                    color: const Color(0xffb46617),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card.filled(
                child: SizedBox(
                  width: 400,
                  height: 160,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Cost per week",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Card.outlined(
                            child: SizedBox(
                              width: 130,
                              height: 50,
                              child: Center(
                                child: Text(
                                  // "₱ ${widget.weekCost}",
                                  "₱ ${widget.weekCost.toStringAsFixed(3)}",
                                  style: TextStyle(
                                    color: const Color(0xffb46617),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card.filled(
                color: const Color(0xff0c3b2e),
                child: SizedBox(
                  width: 400,
                  height: 160,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Cost per month",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Card.outlined(
                            child: SizedBox(
                              width: 130,
                              height: 50,
                              child: Center(
                                child: Text(
                                  "₱ ${widget.monthCost.toStringAsFixed(3)}",
                                  style: TextStyle(
                                    color: const Color(0xffb46617),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card.filled(
                child: SizedBox(
                  width: 400,
                  height: 160,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Cost per year",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Card.outlined(
                            child: SizedBox(
                              width: 130,
                              height: 50,
                              child: Center(
                                child: Text(
                                  "₱ ${widget.yearCost.toStringAsFixed(3)}",
                                  style: TextStyle(
                                    color: const Color(0xffb46617),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
                    backgroundColor: const Color(0xff0c3b2e),
                  ),
                  child: Text(
                    "Compute Another",
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
