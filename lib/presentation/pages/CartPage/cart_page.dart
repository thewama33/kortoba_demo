import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
   CartPage({Key? key}) : super(key: key);
  List pro = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: pro.isEmpty
          ? const Center(
              child: Text("No Items on Cart !"),
            )
          : Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:const [
                       Text("My cart"),
                      Text("Total items: cartProducts.itemsLength"),
                    ],
                  ),
                ),
                const Divider(height: 2.0, color: Colors.black),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Expanded(
                  child: ListView(
                    children: pro
                        .map((prod) => _buildElement(
                            context, prod, 12))
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: FittedBox(
                              child: Text("\$ 400"),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    //go to payments
                                  },
                                  child: const Text("Checkout Now !")),
                            ),
                          )
                        ]),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildElement(BuildContext context, prod, int quantity) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Card(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        image: DecorationImage(
                          image: NetworkImage(prod.thumbnail),
                        ),
                      ),
                    ),
                  )),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(prod.title),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("\$ ${prod.price.toStringAsFixed(2)}"),
                            Text("$quantity x"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                ScaffoldMessenger.of(context)
                                  ..clearSnackBars()
                                  ..showSnackBar(
                                    const SnackBar(
                                      content: Text("Succesfully Removed !"),
                                    ),
                                  );
                              },
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.blue),
                                child: const Icon(Icons.remove),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("$quantity"),
                            ),
                            InkWell(
                              onTap: () {
                                ScaffoldMessenger.of(context)
                                  ..clearSnackBars()
                                  ..showSnackBar(
                                    const SnackBar(
                                      content: Text("Succesfully Added !"),
                                    ),
                                  );
                              },
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.blue),
                                child: const Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      );
}
