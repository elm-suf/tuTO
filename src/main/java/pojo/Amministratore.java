package pojo;

public class Amministratore{
    private String username;
    private String password;

    public Amministratore(){}

    public Amministratore(String username, String password, String nome, String cognome){
        this.username = username;
        this.password = password;
    }

    public void setUsername(String us) {
        username = us;
    }

    public void setPassword(String pass) {
        password = pass;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

}
