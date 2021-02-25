abstract class ModelAdapter<Model, Ext> {

  Model toModel(Ext external);

  Ext fromModel(Model model);

  List<Model> toListModel(List<Ext> externals){
    return externals.map((e) => this.toModel(e));
  }

  List<Ext> fromListModel(List<Model> models){
    return models.map((e) => this.fromModel(e));
  }

}