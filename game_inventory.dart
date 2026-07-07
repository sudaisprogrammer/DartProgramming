import 'dart:io';

class Item {
  int id;
  String name;
  int power;

  List<Item> items = [];

  Item({this.id = 0, this.name = '', this.power = 0});

  void additems(int mid, String n, int pow) {
    for (int i = 0; i < items.length; i++) {
      if (mid == items[i].id) {
        print("\nDuplicate ID found");
        print("please enter unique ID\n");
        break;
      }
    }
    Item item = Item(id: mid, name: n, power: pow);
    items.add(item);
    print("\nItem has been added successfully\n");
  }

  void deleteitembyid() {
    bool find = false;
    print("Enter the Item ID: ");
    int? item_id = int.parse(stdin.readLineSync()!);
    for (int i = 0; i < items.length; i++) {
      if (item_id == items[i].id) {
        print("\nItem ID found");
        items.removeAt(i);
        find = true;
        print("\nItem removed successfully");
        break;
      }
    }
    if (find == false) {
      print("\nitem not found try again");
    }
  }

  void upgradeitempower() {
    print("Enter the item ID to upgrade power: ");
    int? iPower = int.parse(stdin.readLineSync()!);
    bool find = false;
    for (int i = 0; i < items.length; i++) {
      if (iPower == items[i].id) {
        print("\nCurrent Power of Item is ${items[i].power}");
        print("Enter the power to upgrade 0-100: ");
        int? ipow = int.parse(stdin.readLineSync()!);
        items[i].power += ipow;

        //twist if power goes>100 it will automatically rmeove from the memory
        if (items[i].power > 100) {
          items.removeAt(i);
          print("Item has been cursed and removed from memory");
        }
        else{
        print("\nItem power upgraded to ${items[i].power} successfully");
        }
        find = true;
        break;
      }
    }
    if (find == false) {
      print("\n${iPower} Not found");
    }
  }

  void displayallitems() {
    for (var item in items) {
      print("\nItem Name is ${item.name}");
      print("Item ID is ${item.id}");
      print("Item Power is ${item.power}\n");
    }
  }
}

void main() {
  Item item = Item();
  print(
    "============ Welcome to Game Inventory Management System ============",
  );
  while (true) {
    print("\n1. Add new item: ");
    print("2. Delete item by ID: ");
    print("3. Upgrade item power: ");
    print("4. Display all items: ");
    print("\nEnter your Selection: ");
    int? selctn = int.parse(stdin.readLineSync()!);
    switch (selctn) {
      case 1:
        print("Enter the Item Name: ");
        String? mname = stdin.readLineSync();
        print("Enter the Item ID: ");
        int? item_id = int.parse(stdin.readLineSync()!);
        print("Enter the Item Power(0-100): ");
        int? item_power = int.parse(stdin.readLineSync()!);
        // item = Item(id: item_id, name: mname, power: item_power);
        item.additems(item_id, mname!, item_power);
        break;
      case 2:
        item.deleteitembyid();
        break;
      case 3:
        item.upgradeitempower();
        break;
      case 4:
        item.displayallitems();
        break;
      default:
        print("program terminated");
        return;
    }
  }
}
