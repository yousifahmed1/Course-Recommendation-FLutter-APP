class database {
  List<String> reminderlabel = ["Python Course","Assigment 3 networok ","flutter Course"];
  List<String> reminderdeadline = ["1/1/2024","4/1/2024","10/1/2024"];

  void addItem_label(String item) {
    reminderlabel.add(item);
  }

  void addItem_deadline(String item) {
    reminderdeadline.add(item);
  }

  void deleteItem(int index) {
    reminderlabel.removeAt(index);
  }
}