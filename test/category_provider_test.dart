import 'package:ar_list/models/category.dart';
import 'package:test/test.dart';
import 'package:ar_list/providers/category_provider.dart';

void main() {
  test('Categories must be saved', () async {
    // Create some categories
    CategoryProvider cp = CategoryProvider.instance;
    final Set<Category> categories = <Category>{};

    categories.add(Category('Teste 1'));
    categories.add(Category('Teste 4'));
    categories.add(Category('Teste 2'));
    categories.add(Category('Teste 3'));
    categories.add(Category('Teste 1'));

    cp.data = categories;
    cp.write();

    final Set<Category> fromFile = await cp.read();

    expect(fromFile.length, 4);

    fromFile.toList()
      ..sort((a, b) => a.compareTo(b))
      ..forEach((element) => print(element.toJson()));
  }, skip: true);

  test('Categories are comparable', () {
    Category c1 = Category('Teste 1');
    Category c2 = Category('Teste 1');
    expect(c1.compareTo(c2), 0);
    expect(c1 == c2, true);
  });
}
