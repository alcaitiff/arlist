import 'package:ar_list/models/category.dart';
import 'package:test/test.dart';
import 'package:ar_list/providers/category_provider.dart';

void main() {
  test('Categories must be saved', () async {
    // Create some categories

    final Set<Category> categories = <Category>{};

    categories.add(Category('Teste 1'));
    categories.add(Category('Teste 2'));
    categories.add(Category('Teste 3'));
    categories.add(Category('Teste 4'));
    categories.add(Category('Teste 1'));

    CategoryProvider.writeCategories(categories);

    final Set<Category> fromFile = await CategoryProvider.readCategories();

    expect(fromFile.length, 5);
    fromFile.forEach((element) => print(element.toJson()));
  });
}
