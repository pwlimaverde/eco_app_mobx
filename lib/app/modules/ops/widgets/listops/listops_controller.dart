import 'package:mobx/mobx.dart';
import '../../ops_repository.dart';
part 'listops_controller.g.dart';

class ListopsController = _ListopsBase with _$ListopsController;



abstract class _ListopsBase with Store {

    final OpsRepository repo;

  _ListopsBase(this.repo);


}
