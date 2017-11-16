
/*
  Classe Keyboard
 
 Gerencia tudo relacionado ao teclado.
 */
class Keyboard {

  ControlP5 cp;
  private Group teclado;
  private int teclado_width;
  private int teclado_height;

  public Keyboard(PApplet window) {
    cp = new ControlP5(window);
    teclado_width = window.width;
    teclado_height = window.height / 2;

    teclado = cp.addGroup("teclado")
      .setPosition(0, teclado_height)
      .setSize(teclado_width, teclado_height)
      .setBackgroundColor(color(255));
  }

  /*
    Adiciona as teclas do teclado.
   
   Baseia-se na matriz de teclas para criar os componentes,
   e coloca-los no grupo do teclado. É colocado como id o número
   correspondente para usar na função de digitar. Ao chamar a função
   os elementos já são colocados na janela.
   */
  void addKeyboard() {
    char[][] keys = {
      { '1', '2', '3' }, 
      { '4', '5', '6' }, 
      { '7', '8', '9' }, 
      { '*', '0', '#' }
    };

    int btn_width = teclado_width / keys[0].length;
    int btn_height = teclado_height / keys.length;

    for (int i = 0; i < keys.length; i++) {
      for (int j = 0; j < keys[i].length; j++) {
        cp.addButton(String.format("num_%c", keys[i][j]))
          .setLabel(String.valueOf(keys[i][j]))
          .setId(Character.getNumericValue(keys[i][j]))
          .setPosition((j * btn_width), (i * btn_height))
          .setSize(btn_width, btn_height)
          .setFont(createFont("arial", 30))
          .setColorBackground(0xFFE2E2E2)
          .setColorLabel(0xFF424242)
          .setGroup(teclado);
      }
    }
  }

  void keyboardEvent(ControlEvent ev) {
  }

  /*
    Retorna o objeto grupo do teclado.
   */
  Group getGroup() {
    return teclado;
  }
}