import 'package:flutter/material.dart';
import 'package:nectar/data/models/product.dart';
import 'package:nectar/core/core.dart';
import 'package:nectar/features/product_info/presenation/widgets/favorite_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductInfoPage extends StatefulWidget {
  final Product product;
  const ProductInfoPage({super.key, required this.product});

  @override
  State<ProductInfoPage> createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  late PageController controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[50],
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(15),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppColors.titleColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Column(
        children: [
          //image of the product
          Container(
            height: 285,
            decoration: BoxDecoration(
              color: AppColors.productInfoBackground,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemCount: widget.product.images.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        widget.product.images[index],
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ),
                if (widget.product.images.length > 1)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: AnimatedSmoothIndicator(
                      activeIndex: currentIndex,
                      count: widget.product.images.length,
                      effect: ExpandingDotsEffect(
                        dotColor: AppColors.dotColor,
                        activeDotColor: AppColors.primaryColor,
                        expansionFactor: 2.0,
                        dotHeight: 5,
                        dotWidth: 8,
                        spacing: 8,
                      ),
                    ),
                  ),
              ],
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
                      widget.product.title,
                      style: theme.textTheme.titleLarge,
                    ),
                    FavoriteWidget(product: widget.product),
                  ],
                ),
                Text(
                  "${widget.product.weight} pcs, Priceg",
                  style: theme.textTheme.bodyMedium,
                ),
                // const SizedBox(height: 15),
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
                // const SizedBox(height: 8),
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
                          for (int i = 0; i < widget.product.rating; i++)
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
                  child: Text("Add to Basket", style: TextStyle(fontSize: 20)),
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
