import 'dart:io';

void main() {
  Map<String, int> items = {};
  while(true){
    print("1. Add items to the list: ");
    print("2. Remove items from the list: ");
    print("3. Show all items: ");
    print("4. Search item by id or name: ");
    print("5. Exit. ");
    print("Enter your Selection: ");
    int?sel=int.parse(stdin.readLineSync()!);
    switch(sel){
      case 1:
        print("Enter the Item ID: ");
        int?id=int.parse(stdin.readLineSync()!);
        print("Enter the Item Name: ");
        String item_name=stdin.readLineSync() ?? 'default';
        items[item_name]=id;
        print("${item_name} with ${id} added successfully to list");
        break;
      case 2:
        print("Enter the item name or id to remove from the list: ");
        String r_name = stdin.readLineSync() ?? 'default';
        bool find = false;
        if (items.containsKey(r_name)) {
          find = true;
          // items.remove(r_name);
          final value = items.remove(r_name);
          print("$r_name with ID ${value} removed successfully");
          break;
        }

        if (find == false) {
          print("$r_name not found in the list");
        }
        break;
      case 3:
        for (MapEntry items in items.entries) {
          print("ID is ${items.value} and Item name is ${items.key}");
        }
        break;
      case 4:
        print("Enter the name of the item: ");
        String? name = stdin.readLineSync();
        if (items.containsKey(name)) {
          print("item found");
        } else {
          print("item is not in the list");
        }
        break;
      case 5:
        print("program terminated");
        return;
    }
  }
}
