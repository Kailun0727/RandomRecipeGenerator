import 'package:flutter/material.dart';
import 'package:random_recipe_generator/recipe.dart';



class SelectAllergiesPage extends StatefulWidget {
  SelectAllergiesPage({Key? key}) : super(key: key);

  @override
  State<SelectAllergiesPage> createState() => _SelectAllergiesPageState();
}

String selectedAllergiesInfo ="";

class _SelectAllergiesPageState extends State<SelectAllergiesPage> {
  List<String> selectedAllergies = []; //store the selected allergies

  void _allergiesSelection(String food) { //selection function:handle selecting food and deselecting food
    setState(() {

      selectedAllergiesInfo = selectedAllergies.join(",");

      if (selectedAllergies.contains(food)) { //if nothing
        selectedAllergies.remove(food); //remove = nothing
      } else {
        selectedAllergies.add(food); //else add = store food inside
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Allergies'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage("https://images.unsplash.com/photo-1559466273-d95e72debaf8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Zm9vZCUyMHBvcnRyYWl0fGVufDB8fDB8fHww&w=1000&q=80"),
                fit: BoxFit.cover
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Select Allergies Item:"),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FoodButton(                                       //when user click this button,gestureDetector will detect user click this button
                    food: 'Egg',                                    //the value "egg"
                    isSelected: selectedAllergies.contains('Egg'),  //check "'egg" ady inside the list? if yes inside the button color change to blue.
                    onTap: () => _allergiesSelection('Egg'),        //triggered the button is tapped
                  ),
                  SizedBox(width: 20,),
                  FoodButton(
                    food: 'Peanut',
                    isSelected: selectedAllergies.contains('Peanut'),
                    onTap: () => _allergiesSelection('Peanut'),
                  ),
                  SizedBox(width: 20,),
                  FoodButton(
                    food: 'Dairy',
                    isSelected: selectedAllergies.contains('Dairy'),
                    onTap: () => _allergiesSelection('Dairy'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FoodButton(
                    food: 'Soy',
                    isSelected: selectedAllergies.contains('Soy'),
                    onTap: () => _allergiesSelection('Soy'),
                  ),
                  SizedBox(width: 20,),
                  FoodButton(
                    food: 'Sesame',
                    isSelected: selectedAllergies.contains('Sesame'),
                    onTap: () => _allergiesSelection('Sesame'),
                  ),
                  SizedBox(width: 20,),
                  FoodButton(
                    food: 'Wheat',
                    isSelected: selectedAllergies.contains('Wheat'),
                    onTap: () => _allergiesSelection('Wheat'),
                  ),
                ],

              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        spreadRadius: 4,
                        color: Colors.grey.withOpacity(0.2),
                      )
                    ]
                ),
                child: Column(
                  children: [
                    const Text("Allergies Item Selected:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    Column(
                      children:
                      selectedAllergies.map((food) {
                        return Text(food, style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold));
                      }).toList(),
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: _navigateToAnswerPage,
        onPressed: (){
          selectedAllergiesInfo = selectedAllergies.join(",");

          Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipePage(selectedAllergies))); //bring the allergies list to recipe page
        },
        child: const Text("Next"),
      ),
    );
  }
}


class FoodButton extends StatelessWidget {
  final String food; //declare
  final bool isSelected;
  final VoidCallback onTap;

  FoodButton({
    required this.food,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.blue : Colors.grey, //is selected? true= blue,false= grey
        ),
        child: Center(
          child: Text(
            food,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
