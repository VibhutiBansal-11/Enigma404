import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
class QrCode extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Medical Background'),),
        body: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Scan to see medical history'),
                SizedBox(height: 10,),
                Container(
                    height: 350,
                    width: 350,
                    child:SfBarcodeGenerator(value:'Link to Website',
                        showValue: true, textSpacing: 15,
                        symbology: QRCode())
                )
              ],
            )
        )
    );
  }
}