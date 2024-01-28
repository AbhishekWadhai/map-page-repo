import 'package:flutter/material.dart';
import 'package:map_page/screens/mapPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void typeCallback(newValue){
    setState(() {
      dropdownValue1 = newValue;
      if(dropdownValue1 == 'Wheat') {
        image1 = 'wheat1';
        image2 = 'wheat2';
      }
      else if(dropdownValue1 == 'Rice'){
        image1 = 'rice1';
        image2 = 'rice2';
      }else if(dropdownValue1 == 'Corn'){
        image1 = 'corn1';
        image2 = 'corn2';
      }else if(dropdownValue1 == 'Cotton'){
        image1 = 'cotton1';
        image2 = 'cotton2';
      }else if(dropdownValue1 == 'Soyabean'){
        image1 = 'soya1';
        image2 = 'soya2';
      }else if(dropdownValue1 == 'Pulses'){
        image1 = 'pusles1';
        image2 = 'pulses2';
      }else if(dropdownValue1 == 'Sugarcane'){
        image1 = 'sugarcane1';
        image2 = 'sugarcane2';
      }else if(dropdownValue1 == 'Sunflower'){
        image1 = 'sunflower1';
        image2 = 'sunflower2';
      }else if(dropdownValue1 == 'Peanuts'){
        image1 = 'peanut1';
        image2 = 'peanut2';
      }else if(dropdownValue1 == 'Jawar'){
        image1 = 'jawar1';
        image2 = 'jawar2';
      }
    });
  }
  var cropTypes = ['Wheat',
    'Rice',
    'Corn',
    'Cotton',
    'Soyabean',
    'Pulses',
    'Sugarcane',
    'Sunflower',
    'Peanuts',
    'Jawar'];
  String? dropdownValue1;
  var quantityUnits = ['kg','lbs'];
  String? dropdownValue2;
  String variety = 'default';
  String expectedQuantity = '10';
  String pricePerKg = '100';
  String note = 'your note';
  String image1 = 'wheat1';
  String image2 = 'wheat2';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF375A06),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: null,
        ),
        title: Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Text(
            'Sell Produce',
            style: TextStyle(
              fontFamily: 'Outfit',
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Type of Crop',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 14,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: DropdownButton(
                    underline: Container(),
                    hint: Text('Select Crop'),
                    items: cropTypes.map((cropType){
                      return DropdownMenuItem(
                        value: cropType,
                          child: Text(cropType));
                    }).toList(),
                      value: dropdownValue1,
                      onChanged: typeCallback,
                    isExpanded: true,
                  ),
                ),
                SizedBox(height: 10),
                const Text(
                  'Variety',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 14,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none
                      ),
                      onChanged: (String vary){
                        variety = vary;
                      },
                    )),
                SizedBox(height: 10),
                const Text(
                  'Expected Quantity',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 200,
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none
                            ),
                            onChanged: (String quant){
                              expectedQuantity = quant;
                            }
                            )),
                    ),
                    SizedBox(width: 10),
            Container(
              child: Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0)
                    ),
                  child: DropdownButton(
                    underline: Container(),
                    hint: Text('kg'),
                    items: quantityUnits.map((quantityUnit){
                      return DropdownMenuItem(
                          value: quantityUnit,
                          child: Text(quantityUnit));
                    }).toList(),
                    value: dropdownValue2,
                    onChanged: (newValue){
                      setState(() {
                        dropdownValue2 = newValue;
                      });

                    },
                    isExpanded: true,
                  ),
                ),
              ),
            ),
                  ],
                ),
                SizedBox(height: 10),
                const Text(
                  'Price(per kg)',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none
                      ),
                      onChanged: (String ppk){
                        pricePerKg=ppk;
                      },
                    )),
                SizedBox(height: 10),
                const Text(
                  'Note',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 14,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none
                      ),
                      onChanged: (String notes){
                        note=notes;
                      },
                    )),
                SizedBox(height: 10),
                const Text(
                  'Images',
                  style: TextStyle(
                    //fontFamily: 'Readex Pro',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0)
                          ),
                        width: 100,
                        height: 100,
                        child: Image(
                          image: AssetImage('images/cropType/$image1.png'),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        child: Image(
                          image: AssetImage('images/cropType/$image2.png'),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  //alignment: Alignment.,
                  child: FloatingActionButton(
                    child: Text('Add my Produce',
                      style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),),
                      backgroundColor: Color(0xFF709301),
                      onPressed: (){
                      print('Type of Crop : $dropdownValue1');
                      print('Variety : $variety');
                      print('Expected Quantity : $expectedQuantity $dropdownValue2');
                      print('Price(per kg) : $pricePerKg');
                      print('Note : $note');
                      //print();
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => MapPage()));
                  }
                  ),
                )
              ]
          ),
        ),
    ),
      ),
    );
  }
}
