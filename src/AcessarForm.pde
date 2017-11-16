
class AcessarForm extends Section {

  public AcessarForm(PApplet window, String name) {
    super(window, name);
  }

  /*
   Adiciona o formulário.
   
   Na tela de acesso tem:
   - Label
   - Textfield usuario
   - Textfield senha
   - Botão entrar
   */
  void show() {
    Textfield aux;
    cp.addTextlabel("form_acessar_label")
      .setPosition(44, 49)
      .setSize(135, 20)
      .setFont(createFont("arial", 20))
      .setText("Acesse sua conta")
      .setGroup(container);

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

    cp.addButton("btn_entrar")
      .setPosition(44, 251)
      .setSize(260, 60)
      .setFont(createFont("arial", 20))
      .setColorBackground(0xFFFF4081)
      .setLabel("ENTRAR")
      .setGroup(container);

    super.show();
  }
}