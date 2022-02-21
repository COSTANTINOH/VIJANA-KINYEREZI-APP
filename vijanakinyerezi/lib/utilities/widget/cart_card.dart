import 'package:flutter/material.dart';
import 'package:vijanakinyerezi/utilities/widget/dimension.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
                jtmanualSpacer(step: 5),
                const Text(
                  "Vunja Bei Stores",
                ),
                jtmanualSpacer(step: 5),
                const Icon(
                  Icons.check_box_outline_blank_outlined,
                )
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_box_outline_blank_outlined,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/images.jpg",
                        width: 68,
                        height: 65,
                      ),
                    ),
                    jtmanualSpacer(step: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nike shoes',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: const <Widget>[
                              Icon(
                                Icons.star,
                                size: 11.0,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 11.0,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 11.0,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 11.0,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star_half,
                                size: 11.0,
                                color: Colors.yellow,
                              ),
                              Text(
                                '4',
                                style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Roboto",
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              const Text(
                                "\$ 30",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Roboto",
                                ),
                              ),
                              jtmanualSpacer(step: 5),
                              const Text(
                                "Size x/2",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto",
                                    color: Color(0xff767676)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SizedBox(
                  height: 40,
                  width: 131,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.remove,
                        ),
                        const VerticalDivider(
                          color: Colors.black45,
                          thickness: 2,
                          width: 10,
                        ),
                        Text(
                          "2",
                          style: TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        const VerticalDivider(
                          color: Colors.black45,
                          thickness: 2,
                          width: 10,
                        ),
                        const Icon(
                          Icons.add,
                        )
                      ],
                    ),
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
