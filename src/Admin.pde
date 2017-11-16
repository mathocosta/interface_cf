import java.util.Iterator;

/*
  Classe Admin
 
 Onde está toda a lógica do negócio.
 */
class Admin {
  int senha = 1234;
  int username = 1234;
  HashMap<String, String> users;  

  public Admin() {
    users = new HashMap();

    users.put("1234", "1234");
    users.put("2002", "2002");
    users.put("1", "1");
  }

  boolean verificar(String s, String u) {
    return (users.containsKey(u) && users.get(u).equals(s));
  }
  
  void remove(int id) {
    if (users.containsKey(String.valueOf(id))) {
      users.remove(String.valueOf(id));
    }
  }

  void adicionar(String u, String s) {
    users.put(u,s);
  }

  Iterator<String> getUsersData() {
    return users.keySet().iterator();
  }
}