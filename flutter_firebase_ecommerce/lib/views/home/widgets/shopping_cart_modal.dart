import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/controllers/cart_controller.dart';
import 'package:flutter_firebase_ecommerce/views/home/widgets/shopping_cart_item.dart';
import 'package:get/get.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:wc_flutter_share/wc_flutter_share.dart';

class ShoppingCartModal extends StatelessWidget {
  ShoppingCartModal({Key? key}) : super(key: key);

  final CartController _cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                child: Text(
                  'Carrinho de compras',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
              ),
            ),
            Obx(
              () => Column(
                children: _cartController.cartItens
                    .map(
                      (cartItem) => ShoppingCartItem(
                        cartItem: cartItem,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 30,
          child: Container(
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Obx(
              () => GestureDetector(
                onTap: _cartController.cartItens.isNotEmpty
                    ? () async => _generateCheckoutPDF()
                    : null,
                child: PhysicalModel(
                  color: Colors.grey.withOpacity(.4),
                  elevation: 2,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _cartController.cartItens.isNotEmpty
                          ? Colors.blueAccent
                          : Colors.blueGrey[300],
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(14),
                      alignment: Alignment.center,
                      child: Text(
                        'Checkout (\$${_cartController.totalCartPrice.value})',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void _generateCheckoutPDF() async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
      build: (pw.Context context) => pw.Center(
          child: pw.Column(
        children: [
          //pw.Image( 'assets/images/logo.png'),
          pw.Padding(
            padding: const pw.EdgeInsets.only(top: 18, bottom: 60),
            child: pw.Text('POKEMART - INVOICE',
                style:
                    pw.TextStyle(fontSize: 32, fontWeight: pw.FontWeight.bold)),
          ),
          pw.Container(
            padding: const pw.EdgeInsets.all(20.0),
            child: pw.Table(children: [
              pw.TableRow(children: [
                pw.Text('PRODUTO',
                    style: pw.TextStyle(
                        fontSize: 24, fontWeight: pw.FontWeight.bold)),
                pw.Text('QUANTIDADE',
                    style: pw.TextStyle(
                        fontSize: 24, fontWeight: pw.FontWeight.bold)),
                pw.Text('VALOR',
                    style: pw.TextStyle(
                        fontSize: 24, fontWeight: pw.FontWeight.bold)),
              ])
            ]),
          ),
          pw.Container(
            alignment: pw.Alignment.center,
            padding: const pw.EdgeInsets.all(20.0),
            child: pw.Table(
              children: _cartController.cartItens
                  .map((cartItem) => pw.TableRow(children: [
                        pw.Text(cartItem.product.name,
                            style: const pw.TextStyle(fontSize: 18)),
                        pw.Center(
                          child: pw.Text(cartItem.quantity.toString(),
                              style: const pw.TextStyle(fontSize: 18)),
                        ),
                        pw.Align(
                          alignment: pw.Alignment.centerRight,
                          child: pw.Text(
                              '\$${cartItem.totalItemPrice.toString()}',
                              style: const pw.TextStyle(fontSize: 18)),
                        )
                      ]))
                  .toList(),
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.only(top: 20),
            child: pw.Align(
              alignment: pw.Alignment.centerRight,
              child: pw.Text(
                'Valor total: \$${_cartController.totalCartPrice.toString()}',
                style:
                    pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
              ),
            ),
          )
        ],
      )),
    ));

    var pdfBytes = await pdf.save();

    WcFlutterShare.share(
        sharePopupTitle: 'Pokemart Checkout',
        fileName: 'PokemartCheckout.pdf',
        mimeType: 'application/pdf',
        bytesOfFile: pdfBytes);
  }
}
