import 'package:flutter/material.dart';
import 'package:flutter_app/MyCart.dart';
import 'package:flutter_app/showproduct.dart';
import 'package:flutter_app/model/CartModel.dart';
import 'package:flutter_app/model/ProductModel.dart';
import 'package:flutter_app/provider/CartProvider.dart';
import 'package:flutter_app/provider/ProductProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ShowProduct extends StatefulWidget {
  const ShowProduct({Key? key}) : super(key: key);

  @override
  State<ShowProduct> createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {

  int countCart = 0;
  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    productProvider.getList();
    var cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getList();
    countCart = cartProvider.count;
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = 148 + (size.height - kToolbarHeight - 24) / 4.4;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)
          )
        ),
        backgroundColor: Colors.blueAccent,
        title: Row(
          children: [
            Text("Shop",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),

                ),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyCart())
                  );
                },
                child: Row(
                  children: [
                    Text(countCart.toString() + "  | ",style: TextStyle(fontWeight: FontWeight.bold),),
                    Icon(Icons.shopping_cart)
                  ],
                )

            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GridView.count(
                  childAspectRatio: (itemWidth/itemHeight),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: [
                    ...productProvider.list.map((e){
                      return Container(
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20),
                          color:
                          (
                              Colors.white
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ProductDisplay(product: ProductModel()))
                                );
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Image(image: NetworkImage(e.imageLink??""),height: (size.height - kToolbarHeight - 24) / 5,fit: BoxFit.fill),
                                    SizedBox(height: 20,),
                                    SizedBox(
                                      child: Text(e.title??"",
                                        style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      height: 40,
                                    ),
                                    SizedBox(height: 4,),
                                    /*Row(
                                      children: [
                                        RatingBar.builder(
                                          initialRating: e.rating?.rate??5.0,
                                          minRating: 0.1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                          itemSize: 14,

                                        ),
                                        Text((e.rating?.count??0.0).toString() + " ratings", overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black,fontSize: 10),),
                                      ],
                                    ),*/
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Text("\$",style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text((e.price.toString()),style: TextStyle(fontWeight: FontWeight.bold),)
                                    ],
                                  ),
                                ),
                                Container(
                                  width: itemWidth/3,
                                  height: itemHeight/10,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(40),
                                              side: BorderSide(color: Colors.lightBlueAccent)
                                          ),

                                        ),
                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
                                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),

                                      ),
                                      onPressed: (){
                                        cartProvider.Add(ProductModel());
                                        cartProvider.countCart();
                                        setState(() {
                                          countCart = cartProvider.count;
                                        });
                                        _showToast(context);
                                      },
                                      child: Row(
                                        children: [
                                          Icon(Icons.add_shopping_cart,color: Colors.white,size: 14,),
                                        ],
                                        mainAxisAlignment: MainAxisAlignment.center,
                                      )

                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList()
                  ],

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Add to Cart'),
        action: SnackBarAction(label: 'Hide', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}