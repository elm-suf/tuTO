package pojo;

import java.sql.Date;

public class Prenotazione {
    private int id;
    private String stato;
    private String studente;
    private String docente;
    private int id_insegnamento;
    private String slot;
    private Date data;

    public Prenotazione(){}

    public Prenotazione(String stato, Studente studente, Docente docente, int id_ins, String slot, Date data){
        this.stato = stato;
        this.studente = studente.getUsername();
        this.docente = docente.getUsername();
        this.id_insegnamento = id_ins;
        this.slot = slot;
        this.data = data;
    }

    public String getStato(){
        return stato;
    }

    public String getStudente(){
        return studente;
    }

    public String getDocente(){
        return docente;
    }

    public int getIdInsegnamento(){
        return id_insegnamento;
    }

    public String getSlot(){
        return slot;
    }

    public Date getData(){
        return data;
    }

    public void setStato(String s){
        stato = s;
    }

    public void setStudente(Studente s){
        studente = s.getUsername();
    }

    public void setDocente(Docente d){
        docente = d.getUsername();
    }

    public void setIdInsegnamento(int id){
        id_insegnamento = id;
    }

    public void setSlot(String s){
        slot = s;
    }

    public void setData(Date d){
        data = d;
    }

}
