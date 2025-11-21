import 'package:flutter/material.dart';
import 'package:nectar/data/models/product.dart';

class ProductInfo extends StatelessWidget {
  final Product product;
  const ProductInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[50],
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(15),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppColors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(15),
        //     child: (Icon(Icons.ios_share_outlined, color: Color(0XFF212121))),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            //image of the product
            Container(
              width: double.infinity,
              height: 285,
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(product.images[0]),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
            ),
            // product information
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // AddToFavorite(item: product),
                    ],
                  ),
                  Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 23,
                      color: Color(0XFF7C7C7C),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     AddQuantity(
                  //       qty: tempQty,
                  //       increased: (){
                  //         tempQty.value++;
                  //       },
                  //       decreased: (){
                  //         if(tempQty.value > 0){
                  //               tempQty.value--;
                  //         }
                  //       },),
                  //     SizedBox(width: 20,),
                  //     Text("\$${widget.item.price}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, fontFamily: "Gilory"),)
                  //   ],
                  // ),
                  const SizedBox(height: 8),
                  Divider(thickness: 0.5, color: Color(0XFF7C7C7C)),
                  // ProductDetail(title: "Product Details" ,details: product.details,),
                  Divider(thickness: 0.5, color: Color(0XFF7C7C7C)),
                  // ProductDetail(title: "Nutritions" ,details: product.nutritions,),
                  Divider(thickness: 0.5, color: Color(0XFF7C7C7C)),
                  Padding(
                    padding: const EdgeInsets.only(left: 21),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Reviews",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            for (int i = 0; i < product.rating; i++)
                              Icon(Icons.star, color: Color(0XFFF3603F)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  //Add to basket
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Add to Basket",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  // buildMaterialButton(
                  //   text: "Add to Basket",
                  //       onPressed: (){
                  //         if(controller.isIn(controller.basket, widget.item)){
                  //           if(tempQty.value == 0){
                  //             controller.removeByItem(widget.item);
                  //           }
                  //           else if(tempQty.value > 0){
                  //             widget.item.qty.value = tempQty.value;
                  //         }
                  //         }
                  //         else{
                  //           if(tempQty.value > 0){
                  //             controller.basket.add(widget.item);
                  //             widget.item.qty.value = tempQty.value;
                  //             controller.total.value += widget.item.price * widget.item.qty.value;
                  //         }
                  //         }
                  //         Get.back();
                  //         if( tempQty.value > 0){
                  //           Get.snackbar(
                  //             "title",
                  //             "message",
                  //             duration: Duration(seconds: 3),
                  //             snackPosition: SnackPosition.TOP,
                  //             backgroundColor: const Color(0XFF53B175),
                  //             titleText:Text("Done!", style: TextStyle(color: Colors.white),),
                  //             messageText:Text("The ${widget.item.name} has been added to Your basket", style: TextStyle(color: Colors.white))
                  //             );
                  //         }
                  //       }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetail extends StatefulWidget {
  final String details;
  final String title;
  const ProductDetail({super.key, required this.details, required this.title});

  @override
  ProductDetailState createState() => ProductDetailState();
}

class ProductDetailState extends State<ProductDetail> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        childrenPadding: EdgeInsets.symmetric(horizontal: 10),
        trailing: Icon(
          isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
          size: 30,
        ),
        onExpansionChanged: (bool expanded) {
          setState(() {
            isExpanded = expanded;
          });
        },
        children: [
          Text(
            widget.details,
            style: TextStyle(color: Color(0XFF7C7C7C), fontSize: 18),
          ),
        ],
      ),
    );
  }
}
