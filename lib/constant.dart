import 'package:flutter/material.dart';

const List<int> numberList = <int>[
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22,
  23,
  24,
  25,
  26,
  27,
  28,
  29,
  30
];

const defaultPadding = 20.0;

List ColorData = [
  Colors.amber,
  Colors.black,
  Colors.blue,
  Colors.cyan,
  Colors.deepPurple,
  Colors.pink,
  Colors.red
];

List ColorInformation = [
  'Available',
  'Reserved',
  'Open',
  'Hold',
  'No Order',
  'On Cleaning',
  'Finalizing',
  'Shift Warning'
];

List<Map> menuList = [
  {
    'title': 'Steam',
    'subtitle': [
      {'name': 'fish', 'isAdded': false, 'count': 0,'price':1000,'itemId':1},
      {'name': 'fish2s', 'isAdded': false, 'count': 0,'price':2000,'itemId':2},
      {'name': 'fish3s', 'isAdded': false, 'count': 0,'price':3000,'itemId':3},
      {'name': 'bowl', 'isAdded': false, 'count': 0,'price':4000,'itemId':4},
      {'name': 'beat', 'isAdded': false, 'count': 0,'price':5000,'itemId':5},
      {'name': 'pork', 'isAdded': false, 'count': 0,'price':6000,'itemId':6}
    ]
  },
  {
    'title': 'Steam Nasi',
    'subtitle': [
      {'name': 'fishn', 'isAdded': false, 'count': 0,'price':1000,'itemId':8},
      {'name': 'fishn2', 'isAdded': false, 'count': 0,'price':1000,'itemId':9},
      {'name': 'fishn4', 'isAdded': false, 'count': 0,'price':1000,'itemId':10},
      {'name': 'fishn3', 'isAdded': false, 'count': 0,'price':1000,'itemId':11},
      {'name': 'fishn5', 'isAdded': false, 'count': 0,'price':1000,'itemId':12},
      {'name': 'bowl122', 'isAdded': false, 'count': 0,'price':1000,'itemId':13},
      {'name': 'beat2222', 'isAdded': false, 'count': 0,'price':1000,'itemId':14},
      {'name': 'pork222', 'isAdded': false, 'count': 0,'price':1000,'itemId':15}
    ]
  },
  {
    'title': 'Bakmie',
    'subtitle': [
      {'name': 'fish', 'isAdded': false, 'count': 0,'price':1000,'itemId':16},
      {'name': 'bowl', 'isAdded': false, 'count': 0,'price':1000,'itemId':17},
      {'name': 'beat', 'isAdded': false, 'count': 0,'price':1000,'itemId':18},
      {'name': 'pork', 'isAdded': false, 'count': 0,'price':1000,'itemId':19}
    ]
  },
  {
    'title': 'Ayam',
    'subtitle': [
      {'name': 'fish', 'isAdded': false, 'count': 0,'price':1000,'itemId':20},
      {'name': 'bowl', 'isAdded': false, 'count': 0,'price':1000,'itemId':21},
      {'name': 'beat', 'isAdded': false, 'count': 0,'price':1000,'itemId':22},
      {'name': 'pork', 'isAdded': false, 'count': 0,'price':1000,'itemId':23}
    ]
  },
  {
    'title': 'beef sushi',
    'subtitle': [
      {'name': 'fish', 'isAdded': false, 'count': 0,'price':1000,'itemId':24},
      {'name': 'bowl', 'isAdded': false, 'count': 0,'price':1000,'itemId':25},
      {'name': 'beat', 'isAdded': false, 'count': 0,'price':1000,'itemId':26},
      {'name': 'pork', 'isAdded': false, 'count': 0,'price':1000,'itemId':27}
    ]
  },
  {
    'title': 'sushi',
    'subtitle': [
      {'name': 'fish', 'isAdded': false, 'count': 0,'price':1000,'itemId':28},
      {'name': 'bowl', 'isAdded': false, 'count': 0,'price':1000,'itemId':29},
      {'name': 'beat', 'isAdded': false, 'count': 0,'price':1000,'itemId':30},
      {'name': 'pork', 'isAdded': false, 'count': 0,'price':1000,'itemId':31}
    ]
  },
];

List<Map> paymentList = [
  {'title': 'HAKAU UDANG', 'price': 30000, 'quantity': '3'},
  {'title': 'HAKAU UDANG2', 'price': 30000, 'quantity': '3'},
  {'title': 'HAKAU UDANG3', 'price': 30000, 'quantity': '3'},
  {'title': 'HAKAU UDANG3', 'price': 30000, 'quantity': '3'},
  {'title': 'HAKAU UDANG3', 'price': 30000, 'quantity': '3'},
  {'title': 'HAKAU UDANG3', 'price': 30000, 'quantity': '3'},
  {'title': 'HAKAU UDANG3', 'price': 30000, 'quantity': '3'},
  {'title': 'HAKAU UDANG3333', 'price': 30000, 'quantity': '3'},
  {'title': 'HAKAU UDANG366666', 'price': 30000, 'quantity': '3'},
];

List<Map> saleCategory = [
  {'title': 'Dine in', 'isSelected': true},
  {'title': 'GOFOOD', 'isSelected': false},
  {'title': 'GRAB FOOD', 'isSelected': false},
  {'title': 'SHOPE FOOD', 'isSelected': false},
  {'title': 'Take Away', 'isSelected': false},
];

List<Map> tenderList = [
  {'title': 'Debit BCA', 'isSelected': true},
  {'title': 'Flazz', 'isSelected': false},
  {'title': 'GOBIZ', 'isSelected': false},
  {'title': 'GOPAY', 'isSelected': false},
];

final submenuCount =['All','Steam  (13)' ,'Boat  (12)' ,'Goat  (11)' ,'ABC  (13)' ,];
