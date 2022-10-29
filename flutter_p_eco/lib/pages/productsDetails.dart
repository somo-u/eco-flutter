
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/productsp.dart';

class DetailsScreen extends StatelessWidget {
  static const id = '/ProductDetailsScreen';
DetailsScreen({Key? key}) : super(key: key);

   final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Color.fromARGB(255, 247, 247, 247),
  primary:  Color(0xffE56B6F),
  minimumSize: Size(70,60),
  padding: EdgeInsets.symmetric(horizontal: 85),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  ),);

  @override
  Widget build(BuildContext context) {

   

    
    var id = ModalRoute.of(context)?.settings.arguments as String;
    final products = Provider.of<Products>(context,listen: false).theId(id);
    return Scaffold(
      appBar: AppBar(
         backgroundColor:Color(0xffE56B6F),
      ),
    body: SafeArea(
 
  child: 
Stack(
  children: [
    Container(

          height: 300,
child:
        Image.asset(
          products.image, 
                        fit: BoxFit.fill,
                       
                   width: double.infinity,       
        ), 

    ),
   
   ListView(
children: [
  
SizedBox(

  height: 260,

),
Container(
   
  decoration: BoxDecoration(
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(35),
    ),
 color: Colors.white,
  ),
  
  child: Column(
    
mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
 
  Padding(padding: EdgeInsets.symmetric(
    vertical: 30,

  ),
  child: Row(

    children: [
      Padding(padding: EdgeInsets.only(left: 30, top: 30
      
      ),
      
          child: Text(products.title , style: TextStyle(fontSize: 33 , fontWeight: FontWeight.bold,    fontStyle: FontStyle.italic,  ),)
      ),
  Row(

    children: [
      
      Padding(padding: EdgeInsets.only(left: 40, top: 30),
   

      child: Text(products.price.toString() +"KWD" , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.w600,  color: Color.fromARGB(255, 228, 93, 93) ) , ),

   ),

   ],
   ),
],

  ),
  
  
  ),
     Container(
child:
Padding ( padding: EdgeInsets.only(left:20, top:20, ),

   child: Text("Read More :" , style:TextStyle(fontSize: 23 , fontWeight: FontWeight.w800,  color: Color.fromARGB(255, 86, 83, 83) ) , ),
),

    

  ),
   Padding ( padding: EdgeInsets.only(top: 30, left: 20),
  child: Text(products.description, style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w200,  color: Colors.grey, ),   textAlign: TextAlign.start),
  ),
  
  ],
  
  ),
  
  
  

  ),
  ],),],),),);}}
