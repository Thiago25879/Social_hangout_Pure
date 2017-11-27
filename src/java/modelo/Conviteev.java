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
@Table(name = "conviteev")
@NamedQueries({
    @NamedQuery(name = "Conviteev.findAll", query = "SELECT c FROM Conviteev c"),
    @NamedQuery(name = "Conviteev.findbymemidFilter", query = "SELECT l FROM Conviteev l where l.memcodigo.usucodigo.usucodigo = :filtro"),
    @NamedQuery(name = "Conviteev.findbygruidFilter", query = "SELECT l FROM Conviteev l where l.memcodigo.grucodigo.grucodigo = :filtro"),
    @NamedQuery(name = "Conviteev.findbyeveidFilter", query = "SELECT l FROM Conviteev l where l.evecodigo.evecodigo = :filtro"),
    @NamedQuery(name = "Conviteev.findidFilter", query = "SELECT l FROM Conviteev l where l.memcodigo.memcodigo = :filtro and l.evecodigo.evecodigo = :filtro2"), 
    @NamedQuery(name = "Conviteev.findFilter", query = "SELECT h FROM Conviteev h where LOWER(h.conevresposta) like :filtro or LOWER(h.memcodigo.usucodigo.usunick) like :filtro or LOWER(h.evecodigo.evenome) like :filtro")})

public class Conviteev implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "conevcodigo")
    private Integer conevcodigo;
    @Column(name = "conevresposta")
    private String conevresposta;
    @JoinColumn(name = "evecodigo", referencedColumnName = "evecodigo")
    @ManyToOne
    private Evento evecodigo;
    @JoinColumn(name = "memcodigo", referencedColumnName = "memcodigo")
    @ManyToOne
    private Membro memcodigo;

    public Conviteev() {
    }

    public Conviteev(Integer conevcodigo) {
        this.conevcodigo = conevcodigo;
    }

    public Integer getConevcodigo() {
        return conevcodigo;
    }

    public void setConevcodigo(Integer conevcodigo) {
        this.conevcodigo = conevcodigo;
    }

    public String getConevresposta() {
        return conevresposta;
    }

    public void setConevresposta(String conevresposta) {
        this.conevresposta = conevresposta;
    }

    public Evento getEvecodigo() {
        return evecodigo;
    }

    public void setEvecodigo(Evento evecodigo) {
        this.evecodigo = evecodigo;
    }

    public Membro getMemcodigo() {
        return memcodigo;
    }

    public void setMemcodigo(Membro memcodigo) {
        this.memcodigo = memcodigo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (conevcodigo != null ? conevcodigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Conviteev)) {
            return false;
        }
        Conviteev other = (Conviteev) object;
        if ((this.conevcodigo == null && other.conevcodigo != null) || (this.conevcodigo != null && !this.conevcodigo.equals(other.conevcodigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Conviteev[ conevcodigo=" + conevcodigo + " ]";
    }
    
}
