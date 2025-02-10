import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:irovolt_app/data/appliance.dart';
import 'package:irovolt_app/helpers/app_config.dart';
import 'package:irovolt_app/result.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final dropDownKey = GlobalKey<DropdownSearchState>();
  double hrs = 1;
  int? selectedWeek;
  List<Appliance> appliances = [];
  Appliance? selectedAppliance;
  Set<int> selectedDays = {};
  double cpKWH = 11.84;

  @override
  void initState() {
    super.initState();
    loadAppliances().then((data) {
      setState(() {
        appliances = data;
      });
    });
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
              const SizedBox(height: 15),
              Card(
                color: const Color(0xff0c3b2e),
                child: SizedBox(
                  width: 400,
                  height: 100,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        "Know how much your gadgets and appliances consume so you stay in control and manage your budget better.",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: DropdownSearch<Appliance>(
                  key: dropDownKey,
                  items: (filter, infiniteScrollProps) => appliances,
                  filterFn: (Appliance item, String filter) {
                    return item.name.toLowerCase().contains(filter.toLowerCase());
                  },
                  itemAsString: (Appliance? a) => a?.name ?? "",
                  onChanged: (Appliance? appliance) {
                    setState(() {
                      selectedAppliance = appliance;
                    });
                  },
                  compareFn: (item1, item2) => item1.name == item2.name,
                  decoratorProps: DropDownDecoratorProps(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      labelText: "Select an Appliance",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  selectedItem: selectedAppliance,
                  popupProps: PopupProps.menu(
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card.outlined(
                child: SizedBox(
                  width: 400,
                  height: 160,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Wattage",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "This is the appliance power rating",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Card.filled(
                            child: SizedBox(
                              width: 100,
                              height: 50,
                              child: Center(
                                child: Text(
                                  "${selectedAppliance?.watts ?? 0}",
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
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Hours used per day",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "How long do you operate the appliance daily?",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Card.outlined(
                            child: SizedBox(
                              width: 100,
                              height: 50,
                              child: Center(
                                child: Text(
                                  "${hrs.round()}",
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
                child: Text(
                  "Move the slider to change number of hours above",
                  style: TextStyle(
                    color: const Color(0xff0c3b2e),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              Slider(
                value: hrs,
                min: 1,
                max: 24,
                divisions: 24,
                label: hrs.round().toString(),
                activeColor: const Color(0xffffba00),
                inactiveColor: Colors.grey,
                thumbColor: const Color(0xffb46617),
                onChanged: (double val) {
                  setState(() {
                    hrs = val;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "1",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      "24",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Text(
                  "Days used per week",
                  style: TextStyle(
                    fontSize: 20,
                    color: const Color(0xffb46617),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(7, (index) {
                    bool isSelected = selectedDays.contains(index);
                    List<String> days = ["SU", "M", "T", "W", "T", "F", "S"];
                    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (isSelected) {
                            selectedDays.remove(index);
                          } else {
                            selectedDays.add(index);
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(13),
                        // backgroundColor: const Color(0xff0c3b2e),
                        backgroundColor: isSelected ? Color(0xffffba00) : Colors.grey,
                      ),
                      child: Text(
                        days[index],
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Text(
                  "Weeks used per month",
                  style: TextStyle(
                    fontSize: 20,
                    color: const Color(0xffb46617),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(4, (index) {
                  List<String> weeks = ["1 Week", "2 Weeks", "3 Weeks", "4 Weeks"];
                  return ListTile(
                    title: Text(
                      weeks[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Radio(
                      value: index,
                      groupValue: selectedWeek,
                      activeColor: const Color(0xffffba00),
                      onChanged: (value) {
                        setState(() {
                          selectedWeek = value;
                        });
                      },
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    double KWHpd = ((selectedAppliance?.watts ?? 0) * hrs) / 1000;
                    double cpDAY = KWHpd * cpKWH;
                    double cpWEEK = cpDAY * selectedDays.length;
                    double cpMONTH = cpWEEK * (selectedWeek! + 1);
                    double cpYEAR = cpMONTH * 12;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Result(
                          appliance: selectedAppliance!.name,
                          dayCost: cpDAY,
                          weekCost: cpWEEK,
                          monthCost: cpMONTH,
                          yearCost: cpYEAR,
                        ),
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
                    "Calculate",
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
