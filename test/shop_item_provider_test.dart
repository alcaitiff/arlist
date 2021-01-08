import 'package:ar_list/models/category.dart';
import 'package:ar_list/models/shop_item.dart';
import 'package:ar_list/repositories/shop_item_repository.dart';
import 'package:test/test.dart';

void main() {
  test('ShopItems must be saved', () async {
    ShopItemRepository repository = ShopItemRepository.instance;
    final Set<ShopItem> items = <ShopItem>{};

    // Create some categories
    Category c1, c2;
    c1 = Category('Teste 1');
    c2 = Category('Teste 2');

    // Create some items
    items.add(ShopItem('Item 2', c1));
    items.add(ShopItem('Item 2', c2));
    items.add(ShopItem('Item 1', c1));
    items.add(ShopItem('Item 1', c2));
    items.add(ShopItem('Item 3', c1));
    items.add(ShopItem('Item 3', c1));
    items.add(ShopItem('Item 3', c2));

    repository.data = items;
    await repository.write();

    final Set<ShopItem> fromFile = await repository.read();

    expect(fromFile.length, 6);

    fromFile.toList()
      ..sort((a, b) => a.compareTo(b))
      ..forEach((element) => print(element.toJson()));
  }, skip: false);

  test('ShopItems are comparable', () {
    Category c1 = Category('Teste 1');
    Category c2 = Category('Teste 1');
    Category c3 = Category('Teste 3');
    ShopItem s1 = ShopItem('Teste 1', c1);
    ShopItem s2 = ShopItem('Teste 2', c1);
    ShopItem s3 = ShopItem('Teste 1', c2);
    ShopItem s4 = ShopItem('Teste 1', c1);
    ShopItem s5 = ShopItem('Teste 1', c3);

    expect(s1.compareTo(s2), -1);
    expect(s1.compareTo(s3), 0);
    expect(s1 == s2, false);
    expect(s1 == s3, true);
    expect(s1 == s4, true);
    expect(s1 == s5, false);
  });
}
