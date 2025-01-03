import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../models/coin.dart';

class CoinsDetailsPage extends StatefulWidget {
  Coin coin;

  CoinsDetailsPage({super.key, required this.coin});

  @override
  State<CoinsDetailsPage> createState() => _CoinsDetailsPageState();
}

class _CoinsDetailsPageState extends State<CoinsDetailsPage> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();
  double quantity = 0;

  buy(){
    if(_form.currentState!.validate()){
      //save purchase

      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Purchase completed successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.coin.name),
          backgroundColor: Colors.indigoAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    child: Image.asset(widget.coin.icon),
                  ),
                  Container(width: 10,),
                  Text(
                    real.format(widget.coin.price),
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1,
                      color: Colors.grey[800]
                    ),
                  ),
                ],
              ),
            ),

            // *1* I don't want it for now, but it's an option that, if there's no value in the inputText, it won't show the corresponding crypto quantity
            // (quantity > 0) ?

            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                margin: EdgeInsets.only(bottom: 24),
                padding: EdgeInsets.all(12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  //using 'withGreen' because 'withOpacity' is deprecated
                  color: Colors.teal[100],
                  borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                child: Text(
                  '$quantity ${widget.coin.abbreviation}',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal
                  ),
                ),
              ),
            ),

            // *2* continued ternary operator
            // : Container(
            //   margin: EdgeInsets.only(bottom: 24),
            // ),

            Form(
              key: _form,
              child: TextFormField(
                controller: _valor,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Amount',
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  suffix: Text(
                   'reais',
                   style: TextStyle(fontSize: 14),
                  )
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value){
                  if(value!.isEmpty){
                    return 'Enter the purchase amount';
                  }else if(double.parse(value) < 50){
                    return 'Minimum purchase is R\$ 50.00';
                  }
                  return null;
                },
                onChanged: (value){
                  setState(() {
                    quantity = (value.isEmpty) ? 0 : double.parse(value)/widget.coin.price;
                  });
                },
              )
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(top: 24),
              child: ElevatedButton(
                onPressed: () => buy(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check, color: Colors.white, size: 30,),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                          'Buy',
                      style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                )
              )
            )
          ],
        ),
      ),
    );
  }
}
