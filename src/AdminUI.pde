
class AdminUI extends Section {

  public AdminUI(PApplet window, String name) {
    super(window, name);
  }

  void show() {
    cp.addTextlabel("btns_label")
      .setPosition(44, 49)
      .setSize(135, 20)
      .setFont(createFont("arial", 20))
      .setText("O que deseja fazer?")
      .setGroup(container);

    cp.addButton("btn_gerenciar")
      .setPosition(44, 86)
      .setSize(260, 60)
      .setFont(createFont("arial", 20))
      .setColorBackground(0xFFFF4081)
      .setLabel("GERENCIAR")
      .setGroup(container);

    cp.addButton("btn_cadastrar")
      .setPosition(44, 167)
      .setSize(260, 60)
      .setFont(createFont("arial", 20))
      .setColorBackground(0xFFFF4081)
      .setLabel("CADASTRAR")
      .setGroup(container);

    super.show();
  }
}