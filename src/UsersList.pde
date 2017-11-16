import java.util.Iterator;

class UsersList extends Section {
  Textarea textarea;
  Admin ad;

  public UsersList(PApplet window, Admin admin, String name) {
    super(window, name);
    ad = admin;
  }

  /*
   Adiciona o formulário.
   
   Na tela de usuários tem:
   - Label
   - Textarea pra colocar os dados.
   */
  void show() {
    cp.addButton("users_list_return_btn")
      .setPosition(44, 50)
      .setSize(20, 20)
      .setFont(createFont("arial", 10))
      .setLabel("<")
      .setGroup(container);

    cp.addTextlabel("users_list_label")
      .setPosition(70, 49)
      .setSize(135, 20)
      .setFont(createFont("arial", 20))
      .setText("Usuários cadastrados")
      .setGroup(container);

    Iterator it = admin.getUsersData();
    if (it.hasNext()) {
      int c = 1; // Para calcular o y de cada elemento.

      while (it.hasNext()) {
        String name = (String) it.next();
        cp.addTextlabel(String.format("%s_label", name))
          .setPosition(60, (c * 25) + 70)
          .setSize(130, 20)
          .setFont(createFont("arial", 20))
          .setText(String.format("%s", name))
          .setGroup(container);

        cp.addButton(String.format("%s_remove_btn", name))
          .setPosition(287, (c * 25) + 70)
          .setSize(20, 20)
          .setFont(createFont("arial", 10))
          .setId(Integer.parseInt(name))
          .setLabel("X")
          .setGroup(container);

        c++;
      }
    } else {
      cp.addTextlabel("no_users_label")
        .setPosition(60, 100)
        .setSize(130, 20)
        .setFont(createFont("arial", 20))
        .setText("Não há usuários")
        .setGroup(container);
    }

    super.show();
  }
}