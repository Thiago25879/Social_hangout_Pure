/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author thiago
 */
@Entity
@Table(name = "voto")
@NamedQueries({
    @NamedQuery(name = "Voto.findAll", query = "SELECT v FROM Voto v"),
    @NamedQuery(name = "Voto.findbydecidFilter", query = "SELECT v FROM Voto v where v.deccodigo.deccodigo = :filtro"),
    @NamedQuery(name = "Voto.findbymemidFilter", query = "SELECT v FROM Voto v where v.memcodigo.usucodigo = :filtro"),
    @NamedQuery(name = "Voto.findbyopcidFilter", query = "SELECT v FROM Voto v where v.opccodigo.opccodigo = :filtro"),
    @NamedQuery(name = "Voto.findidFilter", query = "SELECT l FROM Voto l where l.deccodigo.deccodigo = :filtro and l.memcodigo.memcodigo = :filtro2 and l.opccodigo.opccodigo = :filtro3"),
    @NamedQuery(name = "Voto.findopcsFilter", query = "SELECT l FROM Voto l where l.deccodigo.deccodigo = :filtro and l.memcodigo.memcodigo = :filtro2"),
    @NamedQuery(name = "Voto.findvotosnumFilter", query = "SELECT l FROM Voto l where l.deccodigo.deccodigo = :filtro and l.opccodigo.opccodigo = :filtro2"),
    @NamedQuery(name = "Voto.findFilter", query = "SELECT v FROM Voto v where LOWER(v.deccodigo.dectitulo) like :filtro or LOWER(v.memcodigo.usucodigo.usunick) like :filtro or LOWER(v.opccodigo.opcnome) like :filtro")})
public class Voto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "votcodigo")
    private Integer votcodigo;
    @JoinColumn(name = "deccodigo", referencedColumnName = "deccodigo")
    @ManyToOne
    private Decisao deccodigo;
    @JoinColumn(name = "memcodigo", referencedColumnName = "memcodigo")
    @ManyToOne
    private Membro memcodigo;
    @JoinColumn(name = "opccodigo", referencedColumnName = "opccodigo")
    @ManyToOne
    private Opcao opccodigo;

    public Voto() {
    }

    public Voto(Integer votcodigo) {
        this.votcodigo = votcodigo;
    }

    public Integer getVotcodigo() {
        return votcodigo;
    }

    public void setVotcodigo(Integer votcodigo) {
        this.votcodigo = votcodigo;
    }

    public Decisao getDeccodigo() {
        return deccodigo;
    }

    public void setDeccodigo(Decisao deccodigo) {
        this.deccodigo = deccodigo;
    }

    public Membro getMemcodigo() {
        return memcodigo;
    }

    public void setMemcodigo(Membro memcodigo) {
        this.memcodigo = memcodigo;
    }

    public Opcao getOpccodigo() {
        return opccodigo;
    }

    public void setOpccodigo(Opcao opccodigo) {
        this.opccodigo = opccodigo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (votcodigo != null ? votcodigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Voto)) {
            return false;
        }
        Voto other = (Voto) object;
        if ((this.votcodigo == null && other.votcodigo != null) || (this.votcodigo != null && !this.votcodigo.equals(other.votcodigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Voto[ votcodigo=" + votcodigo + " ]";
    }
    
}
