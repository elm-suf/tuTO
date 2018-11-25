package pojo;

public class Insegnamento {
    private int id;
    private int docente;
    private int corso;

    public Insegnamento(){}

    public Insegnamento(int docente, int corso){
        this.docente = docente;
        this.corso = corso;
    }

    public int getId(){
        return id;
    }

    public int getDocente(){
        return docente;
    }

    public int getCorso(){
        return corso;
    }

    public void setDocente(int docente){
        this.docente = docente;
    }

    public void setCorso(int corso){
        this.corso = corso;
    }
}
