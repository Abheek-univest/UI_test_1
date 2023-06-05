import 'package:flutter/material.dart';

void main() => runApp(const BottomSheetApp());

class BottomSheetApp extends StatelessWidget {
  const BottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff000000),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Univest')),
        body: const plans(),
      ),
    );
  }
}

class plans extends StatefulWidget {
  const plans({super.key});

  @override
  State<plans> createState() => _plansState();
}

class _plansState extends State<plans> {
  String cost = '';
  bool p = true;
  late Color colour;

  List dataList = [true, false, false];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('PLANS'),
        onPressed: () {
          cost = '₹499';
          colour = const Color(0xffffca3f);
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('Plans just for you',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.merge(const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff202020)))),
                          const SizedBox(height: 25),
                          RichText(
                            text: TextSpan(
                              text: '🎉',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.merge(const TextStyle(
                                      color: Color(0xff414141))),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: ' Yay!',
                                ),
                                TextSpan(
                                    text: ' Special prices',
                                    style: TextStyle(color: Color(0xffffca3f))),
                                TextSpan(
                                  text: ' only for you',
                                ),
                                TextSpan(
                                  text: ' 🎉',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          Text('Active Plan:6 months plan',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.merge(const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff202020)))),
                          const SizedBox(height: 25),
                          ListView.builder(
                              itemCount: dataList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        dataList[dataList.indexWhere(
                                            (element) =>
                                                element == true)] = false;
                                        dataList[index] = true;
                                        // cost='₹499';p1=true;p2=false;p3=false;colour=p1?const Color(0xffffca3f):const Color(0xffbcbcbc);
                                      });
                                    },
                                    child: Stack(
                                      children: [
                                        PlanWidget(dataList: dataList, colour: colour,index: index,),
                                        (index == 0)
                                            ? Center(
                                                child: Container(
                                                height: 30,
                                                width: 120,
                                                decoration:
                                                    const BoxDecoration(
                                                  color: Color(0xffffca3f),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(12),
                                                    bottomRight:
                                                        Radius.circular(12),
                                                  ),
                                                ),
                                                child: const Center(
                                                  child: Text("Recommended"),
                                                ),
                                              ))
                                            : SizedBox()
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              child: Text(
                                'Have a coupon code?',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.merge(const TextStyle(
                                        color: Color(0xff00439d),
                                        fontWeight: FontWeight.bold)),
                                textAlign: TextAlign.left,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 50, //height of button
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                backgroundColor: const Color(0xffffca3f),
                                foregroundColor: Colors.black,
                                elevation: 0,
                              ),
                              child: Text(
                                'Pay $cost',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.merge(const TextStyle(
                                        color: Color(0xff000000),
                                        fontWeight: FontWeight.bold)),
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              });
        },
      ),
    );
  }
}

class PlanWidget extends StatelessWidget {
  const PlanWidget({
    super.key,
    required this.dataList,
    required this.colour,
    required this.index,
  });

  final List dataList;
  final Color colour;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68, //height of button
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.all(
                  Radius.circular(12)),
          border: Border.all(
              color: dataList[index]
                  ? colour
                  : Colors.black12,
              width: 1.0)),
      child: Padding(
        padding:
            const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,
          children: [
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start,
              children: [
                Text(
                  '3 months',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium,
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,
                  children: [
                    Text(
                      '₹499',
                      style: Theme.of(
                              context)
                          .textTheme
                          .titleMedium,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      '₹999',
                      style:
                          Theme.of(
                                  context)
                              .textTheme
                              .titleMedium
                              ?.merge(
                                const TextStyle(
                                  decoration:
                                      TextDecoration.lineThrough,
                                  color: Color(
                                      0xffbcbcbc),
                                ),
                              ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: FractionalOffset
                  .centerRight,
              child: Text(
                '₹150/month',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.merge(const TextStyle(
                        color: Color(
                            0xff0d73ce))),
                textAlign:
                    TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
