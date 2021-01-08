import 'package:ar_list/models/category.dart';
import 'package:test/test.dart';
import 'package:ar_list/repositories/category_repository.dart';

void main() {
  test('Categories must be saved', () async {
    // Create some categories
    CategoryRepository repository = CategoryRepository.instance;
    final Set<Category> categories = <Category>{};

    categories.add(Category('Teste 1'));
    categories.add(Category('Teste 4'));
    categories.add(Category('Teste 2'));
    categories.add(Category('Teste 3'));
    categories.add(Category('Teste 1'));

    repository.data = categories;
    await repository.write();

    final Set<Category> fromFile = await repository.read();

    expect(fromFile.length, 4);

    fromFile.toList()
      ..sort((a, b) => a.compareTo(b))
      ..forEach((element) => print(element.toJson()));
  }, skip: false);

  test('Categories are comparable', () {
    Category c1 = Category('Teste 1');
    Category c2 = Category('Teste 1');
    Category c3 = Category('Teste 3');
    expect(c1.compareTo(c2), 0);
    expect(c1.compareTo(c3), -1);
    expect(c1 == c2, true);
    expect(c1 == c3, false);
  });
}
