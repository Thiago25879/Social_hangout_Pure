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
@Table(name = "convitegr")
@NamedQueries({
    @NamedQuery(name = "Convitegr.findAll", query = "SELECT c FROM Convitegr c"),
    @NamedQuery(name = "Convitegr.findidFilter", query = "SELECT l FROM Convitegr l where l.usucodigo.usucodigo = :filtro and l.grucodigo.grucodigo = :filtro2"), 
    @NamedQuery(name = "Convitegr.findidListFilter", query = "SELECT l FROM Convitegr l where l.usucodigo.usucodigo = :filtro and l.grucodigo.grucodigo = :filtro2"), 
    @NamedQuery(name = "Convitegr.findFilter", query = "SELECT h FROM Convitegr h where LOWER(h.congrresposta) like :filtro or LOWER(h.grucodigo.grunome) like :filtro or LOWER(h.usucodigo.usunick) like :filtro")})
public class Convitegr implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "congrcodigo")
    private Integer congrcodigo;
    @Column(name = "congrresposta")
    private String congrresposta;
    @JoinColumn(name = "grucodigo", referencedColumnName = "grucodigo")
    @ManyToOne
    private Grupo grucodigo;
    @JoinColumn(name = "usucodigo", referencedColumnName = "usucodigo")
    @ManyToOne
    private Usuario usucodigo;

    public Convitegr() {
    }

    public Convitegr(Integer congrcodigo) {
        this.congrcodigo = congrcodigo;
    }

    public Integer getCongrcodigo() {
        return congrcodigo;
    }

    public void setCongrcodigo(Integer congrcodigo) {
        this.congrcodigo = congrcodigo;
    }

    public String getCongrresposta() {
        return congrresposta;
    }

    public void setCongrresposta(String congrresposta) {
        this.congrresposta = congrresposta;
    }

    public Grupo getGrucodigo() {
        return grucodigo;
    }

    public void setGrucodigo(Grupo grucodigo) {
        this.grucodigo = grucodigo;
    }

    public Usuario getUsucodigo() {
        return usucodigo;
    }

    public void setUsucodigo(Usuario usucodigo) {
        this.usucodigo = usucodigo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (congrcodigo != null ? congrcodigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Convitegr)) {
            return false;
        }
        Convitegr other = (Convitegr) object;
        if ((this.congrcodigo == null && other.congrcodigo != null) || (this.congrcodigo != null && !this.congrcodigo.equals(other.congrcodigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Convitegr[ congrcodigo=" + congrcodigo + " ]";
    }
    
}
