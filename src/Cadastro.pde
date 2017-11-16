
class Cadastro extends Section {

  public Cadastro(PApplet window, String name) {
    super(window, name);
  }

  /*
   Adiciona o formulário.
   
   Na tela de acesso tem:
   - Label
   - Textfield usuario
   - Textfield senha
   - Botão cartão
   */
  void show() {
    cp.addButton("form_criar_return_btn")
      .setPosition(44, 50)
      .setSize(20, 20)
      .setFont(createFont("arial", 10))
      .setLabel("<")
      .setGroup(container);

    cp.addTextlabel("form_criar_label")
      .setPosition(70, 49)
      .setSize(135, 20)
      .setFont(createFont("arial", 20))
      .setText("Criar um novo acesso")
      .setGroup(container);

    Textfield aux;

    aux = cp.addTextfield("usuario")
      .setPosition(44, 87)
      .setSize(260, 56)
      .setFocus(true)
      .setFont(createFont("arial", 20))
      .setLabel("")
      .setColorValue(0xFF424242)
      .setColorBackground(0xFFC5CAE9)
      .setGroup(container);

    campos.add(aux);

    aux = cp.addTextfield("senha")
      .setPosition(44, 167)
      .setSize(260, 56)
      .setFont(createFont("arial", 20))
      .setLabel("")
      .setColorValue(0xFF424242)
      .setColorBackground(0xFFC5CAE9)
      .setGroup(container);

    campos.add(aux);

    cp.addButton("btn_cartao")
      .setPosition(44, 251)
      .setSize(260, 60)
      .setFont(createFont("arial", 20))
      .setColorBackground(0xFFFF4081)
      .setLabel("CARTÃO")
      .setGroup(container);

    super.show();
  }
}