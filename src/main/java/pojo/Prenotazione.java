package pojo;

import java.sql.Date;

public class Prenotazione {
    private int corso;
    private int docente;
    private int studente;
    private int slot;
    private Date data;

    public Prenotazione(){}

    public Prenotazione(Corso corso, Docente docente, Studente studente, int slot, Date data){
        this.corso = corso.getId();
        this.docente = docente.getId();
        this.studente = studente.getId();
        this.slot = slot;
        this.data = data;
    }

    public int getCorso(){
        return corso;
    }

    public int getDocente(){
        return docente;
    }

    public int getStudente(){
        return studente;
    }

    public int getSlot(){
        return slot;
    }

    public Date getData(){
        return data;
    }

    public void setCorso(Corso c){
        corso = c.getId();
    }

    public void setDocente(Docente d){
        docente = d.getId();
    }

    public void setStudente(Studente s){
        studente = s.getId();
    }

    public void setSlot(int s){
        slot = s;
    }

    public void setData(Date d){
        data = d;
    }

}
