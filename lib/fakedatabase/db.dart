import 'package:flutter/cupertino.dart';

class FakeDB extends ChangeNotifier{
  
  List db = [];
  int _totalAmount = 0;

 

  get totalAmount => _totalAmount;

  set totalAmount(int val){
    _totalAmount = val;
    notifyListeners();
  }

  incCount(List db,int index){
    db[index]["count"] += 1;
    notifyListeners();
  }

  decCount(List db,int index){
    db[index]["count"] -= 1;
    notifyListeners();
  }
  
  totAmount(List db){
    _totalAmount = 0;
    db.forEach((element) {
      if(element["count"]!=0){
        totalAmount += element["count"]*element["cost"];
      }
    });
    print(totalAmount);
    notifyListeners();
  }

  fetchWhopper(){
    db = [{
    "category": "0",
    "title": "Veg Whopper × 2",
    "subtitle": "Regular Meal With Fries(R) + Pepsi(R)",
    "cost": 298,
    "count": 0,
    "veg": true,
    "image": "assets/vegwhopper(kingsaver).JPG"
  },
  {
    "category": "0",
    "title": "Chicken Whopper × 2",
    "subtitle": "Regular Meal With Fries(R) + Pepsi(R)",
    "cost": 318,
    "count": 0,
    "veg": true,
    "image": "assets/chickenwhopper(kingsaver).JPG"
  },
  ];
  notifyListeners();
  }

  fetchKS(){
    db =[{
    "category": "1",
    "title": "Crispy Chicken Supreme × 2",
    "subtitle": "Regular Meal With Fries(R) + Pepsi(R)",
    "cost": 170,
    "count": 0,
    "veg": true,
    "image": "assets/crispychickensupreme.JPG"
  },
  {
    "category": "0",
    "title": "BK Veggie + Creamy Paneer Bowl",
    "subtitle": "Regular Meal With Fries(R) + Pepsi(R)",
    "cost": 214,
    "count": 0,
    "veg": false,
    "image": "assets/bkvegiecreamypaneer(kingsaver).JPG"
  },
  {
    "category": "0",
    "title": "Chicken Chilli Cheese Melt × 2",
    "subtitle": "Regular Meal With Fries(R) + Pepsi(R)",
    "cost": 258,
    "count": 0,
    "veg": false,
    "image": "assets/chickenchilli(kingssaver).JPG"
  },
  {
    "category": "0",
    "title": "Chicken Whopper × 2",
    "subtitle": "Regular Meal With Fries(R) + Pepsi(R)",
    "cost": 318,
    "count": 0,
    "veg": true,
    "image": "assets/chickenwhopper(kingsaver).JPG"
  },
  {
    "category": "0",
    "title": "Veg Whopper × 2",
    "subtitle": "Regular Meal With Fries(R) + Pepsi(R)",
    "cost": 298,
    "count": 0,
    "veg": true,
    "image": "assets/vegwhopper(kingsaver).JPG"
  },
  ];
  notifyListeners();
  }


  // List db =[{
  //   "category": "1",
  //   "title": "Crispy Chicken Supreme × 2",
  //   "subtitle": "Regular Meal With Fries(R) + Pepsi(R)",
  //   "cost": 170,
  //   "count": 0,
  //   "veg": true,
  //   "image": "assets/crispychickensupreme.JPG"
  // },
  // {
  //   "category": "0",
  //   "title": "BK Veggie + Creamy Paneer Bowl",
  //   "subtitle": "Regular Meal With Fries(R) + Pepsi(R)",
  //   "cost": 214,
  //   "count": 0,
  //   "veg": false,
  //   "image": "assets/bkvegiecreamypaneer(kingsaver).JPG"
  // },
  // {
  //   "category": "0",
  //   "title": "Chicken Chilli Cheese Melt × 2",
  //   "subtitle": "Regular Meal With Fries(R) + Pepsi(R)",
  //   "cost": 258,
  //   "count": 0,
  //   "veg": false,
  //   "image": "assets/chickenchilli(kingssaver).JPG"
  // },
  // {
  //   "category": "0",
  //   "title": "Chicken Whopper × 2",
  //   "subtitle": "Regular Meal With Fries(R) + Pepsi(R)",
  //   "cost": 318,
  //   "count": 0,
  //   "veg": true,
  //   "image": "assets/chickenwhopper(kingsaver).JPG"
  // },
  // {
  //   "category": "0",
  //   "title": "Veg Whopper × 2",
  //   "subtitle": "Regular Meal With Fries(R) + Pepsi(R)",
  //   "cost": 298,
  //   "count": 0,
  //   "veg": true,
  //   "image": "assets/vegwhopper(kingsaver).JPG"
  // },
  // ];
}