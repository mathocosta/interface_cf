/*
  Classe Section
 
 Classe base para as outras partes de cima das telas.
 Contém atributos e métodos compartilhados.
 */
class Section {
  ControlP5 cp;
  protected Group container;
  protected int container_width;
  protected int container_height;
  protected ArrayList<Textfield> campos;

  public Section(PApplet window, String name) {
    cp = new ControlP5(window);
    container_width = window.width;
    container_height = window.height / 2;
    campos = new ArrayList();

    container = cp.addGroup(name)
      .setPosition(0, 0)
      .setSize(container_width, container_height)
      .setBackgroundColor(color(63, 81, 177));
  }

  /*
    Exibe a seção.
   
   A seção depedende do tipo da classe filha, portanto
   não há nada implementado aqui. A única coisa necessária
   é a chamada do método `addEvents()` ao final, então é obrigatório chamar o método do pai.
   */
  void show() {
    addEvents();
  }

  /*
    Adiciona os eventos nos textfields.
   
   Evento de click para desativar o foco dos outros e
   deixar no que está clicado.
   */
  void addEvents() {
    for (Textfield e : campos) {
      e.onClick(new CallbackListener() {
        public void controlEvent(CallbackEvent ev) {
          for (Textfield aux : campos) {
            aux.setFocus(false);
          }
          Textfield t = (Textfield)ev.getController();
          t.setFocus(true);
        }
      }
      );
    }
  }

  /*
    Método para preencher o campo.
   
   Recebe o evento disparado pelo teclado, e coloca no campo que está em
   foco o valor do dígito.
   */
  void fillFieldEvent(ControlEvent ev) {
    for (Textfield e : campos) {
      if (e.isFocus()) {
        e.setText(e.getText() + String.valueOf(ev.getController().getId()));
        e.keepFocus(true);
      }
    }
  }

  /*
    Método de fechar
   
   para ser executado quando sair dessa tela.
   */
  void close() {
    container.hide();
  }

  Group getGroup() {
    return container;
  }
}