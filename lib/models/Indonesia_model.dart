class IndonesiaModel {
  final int confirmed;
  final int recovered;
  final int death;
  final int activeCare;
  final String updated;

  IndonesiaModel(
      {this.updated,
      this.confirmed,
      this.recovered,
      this.death,
      this.activeCare});
}
