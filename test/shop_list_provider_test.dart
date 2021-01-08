import 'package:ar_list/models/category.dart';
import 'package:ar_list/models/shop_item.dart';
import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/models/shop_list_entry.dart';
import 'package:ar_list/repositories/shop_list_repository.dart';
import 'package:test/test.dart';

void main() {
  test('ShopLists must be saved', () async {
    // Create some categories
    ShopListRepository repository = ShopListRepository.instance;
    final Set<ShopList> items = <ShopList>{};

    Category c1, c2;
    ShopItem si1, si2, si3, si4;
    ShopListEntry e1, e2, e3, e4, e5;
    ShopList l1, l2;

    c1 = Category('Teste 1');
    c2 = Category('Teste 2');

    si1 = ShopItem('Item 1', c1);
    si2 = ShopItem('Item 2', c1);
    si3 = ShopItem('Item 1', c2);
    si4 = ShopItem('Item 3', c1);

    e1 = ShopListEntry(si1);
    e1.quantity = 3;
    e2 = ShopListEntry(si2);
    e2.quantity = 30;
    e3 = ShopListEntry(si3);
    e3.quantity = 300;
    e4 = ShopListEntry(si4);
    e4.got = true;
    e5 = ShopListEntry(si2);
    e5.quantity = 30;

    l1 =
        ShopList('Lista 1').addEntry(e1).addEntry(e2).addEntry(e3).addEntry(e4);
    l2 = ShopList('Lista 2').addEntry(e2).addEntry(e2).addEntry(e5);

    items..add(l1)..add(l2);

    repository.data = items;
    await repository.write();

    final Set<ShopList> fromFile = await repository.read();

    expect(fromFile.length, 2);

    fromFile.toList()..forEach((element) => print(element.toJson()));
  }, skip: false);
}
