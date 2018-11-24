package pojo;

import java.util.ArrayList;
import java.util.List;

public class Professore {

    private int id;
    private String username;
    private String nome;
    private String cognome;
    private String password;
    private List<Corso> insegnamento;


    public Professore(){}

    public Professore(String username, String nome, String cognome, String password) {
        insegnamento = new ArrayList<>();
        this.username = username;
        this.nome = nome;
        this.cognome = cognome;
        this.password = password;
    }

    public void addInsegnamneto(Corso corso){
        insegnamento.add(corso);
    }

    public List<Corso> getInsegnamenti(){
        return insegnamento;
    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void removeInsegnamneto(Corso corso) {
        insegnamento.remove(corso);
    }
}
