/*
  Código da parte do administrador do Sistema de Controle de Acesso
 desenvolvido para a cadeira de Computação Física.
 SMD - UFC - 2017.2
 */
import controlP5.*;


Keyboard k;    // Objeto do Keyboard.
Section s;     // Instância de Form, só precisa de um já que só é modificado a referência.
Admin admin;   // Objeto do Admin.

void setup() {
  size(350, 700);

  admin = new Admin(); // Inicializa o admin.

  k = new Keyboard(this);
  s = new AcessarForm(this, "form_acessar");  // Inicia com o form de acesso.
  s.show();

  k.addKeyboard();
}

void draw() {
  background(0); // Isso tem que ter pra funcionar.
}

/*
  Função que controla as interações
 com a interface.
 */
void controlEvent(ControlEvent ev) {
  if (ev.isController()) {
    Controller ctrl = ev.getController();

    // Caso botão do teclado, faz o update da UI.
    if (ctrl.getParent().getName().equals("teclado")) {
      k.keyboardEvent(ev);

      // Caso o seja o '#', apagar os campos.
      if (ctrl.getName().equals("num_#")) {
        for (Textfield t : s.campos) t.clear();
      } else {
        s.fillFieldEvent(ev);
      }
    }

    String ctrl_name = ctrl.getName();
    // Caso btn_entrar seja pressionado, enviar dados para a verificação.
    if (ctrl_name.equals("btn_entrar")) {
      String username = ((Textfield) s.campos.get(0)).getText();
      String senha = ((Textfield) s.campos.get(1)).getText();

      if (!username.equals("") && !senha.equals("")) {
        if (admin.verificar(senha, username)) {
          s.close();
          s = new AdminUI(this, "admin_ui");
          s.show();
        } else {
          for (Textfield t : s.campos) t.clear();
          ((Textfield) s.campos.get(0)).setText("Usuário Inválido");
        }
      }
    }

    // Caso os botões da página de admin sejam pressionados.
    if (ctrl_name.equals("btn_gerenciar")) {
      s.close();
      s = new UsersList(this, admin, "users_list");
      s.show();
    } else if (ctrl_name.equals("btn_cadastrar")) {
      s.close();
      s = new Cadastro(this, "form_cadastro");
      s.show();
    }

    // Caso os botões da página de gerenciamento sejam pressionados.
    if (ctrl.getParent().getName().equals("users_list")) {
      println("Removendo: " + ctrl.getId());
      admin.remove(ctrl.getId());

      s.close();
      s = new UsersList(this, admin, "users_list");
      s.show();
    }

    // Caso o botão da página de cadastro seja pressionado.
    if (ctrl.getName().equals("btn_cartao")) {
      String username = ((Textfield) s.campos.get(0)).getText();
      String senha = ((Textfield) s.campos.get(1)).getText();
      if (!username.equals("") && !senha.equals("")) {
        if (!admin.verificar(senha, username)) {
          println("Adicionando: " + username);
          admin.adicionar(senha, username);

          s.close();
          s = new AdminUI(this, "admin_ui");
          s.show();
        } else {
          for (Textfield t : s.campos) t.clear();

          ((Textfield) s.campos.get(0)).setText("Usuário já existente");
        }
      }
    }

    // Caso botões de retorno para a admin.
    if (ctrl_name.equals("form_criar_return_btn") || ctrl_name.equals("users_list_return_btn")) {
      s.close();
      s = new AdminUI(this, "admin_ui");
      s.show();
    }
  }
}