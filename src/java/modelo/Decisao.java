/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.List;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author thiago
 */
@Entity
@Table(name = "decisao")
@NamedQueries({
    @NamedQuery(name = "Decisao.findAll", query = "SELECT d FROM Decisao d"),
    @NamedQuery(name = "Decisao.findbyeveidFilter", query = "SELECT l FROM Decisao l where l.evecodigo.evecodigo = :filtro"),
    @NamedQuery(name = "Decisao.findFilter", query = "SELECT h FROM Decisao h where LOWER(h.dectitulo) like :filtro or LOWER(h.decdesc) like :filtro or LOWER(h.evecodigo.evenome) like :filtro")})
public class Decisao implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "deccodigo")
    private Integer deccodigo;
    @Column(name = "decdesc")
    private String decdesc;
    @Column(name = "dectitulo")
    private String dectitulo;
    @Column(name = "opcnumvotos")
    private Integer opcnumvotos;
    @OneToMany(mappedBy = "deccodigo")
    private List<Opcao> opcaoList;
    @OneToMany(mappedBy = "deccodigo")
    private List<Voto> votoList;
    @JoinColumn(name = "evecodigo", referencedColumnName = "evecodigo")
    @ManyToOne
    private Evento evecodigo;

    public Decisao() {
    }

    public Decisao(Integer deccodigo) {
        this.deccodigo = deccodigo;
    }

    public Integer getDeccodigo() {
        return deccodigo;
    }

    public void setDeccodigo(Integer deccodigo) {
        this.deccodigo = deccodigo;
    }

    public String getDecdesc() {
        return decdesc;
    }

    public void setDecdesc(String decdesc) {
        this.decdesc = decdesc;
    }

    public String getDectitulo() {
        return dectitulo;
    }

    public void setDectitulo(String dectitulo) {
        this.dectitulo = dectitulo;
    }
    
    public Integer getDecnumvotos() {
        return opcnumvotos;
    }

    public void setDecnumvotos(Integer opcnumvotos) {
        this.opcnumvotos = opcnumvotos;
    }

    public List<Opcao> getOpcaoList() {
        return opcaoList;
    }

    public void setOpcaoList(List<Opcao> opcaoList) {
        this.opcaoList = opcaoList;
    }

    public List<Voto> getVotoList() {
        return votoList;
    }

    public void setVotoList(List<Voto> votoList) {
        this.votoList = votoList;
    }

    public Evento getEvecodigo() {
        return evecodigo;
    }

    public void setEvecodigo(Evento evecodigo) {
        this.evecodigo = evecodigo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (deccodigo != null ? deccodigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Decisao)) {
            return false;
        }
        Decisao other = (Decisao) object;
        if ((this.deccodigo == null && other.deccodigo != null) || (this.deccodigo != null && !this.deccodigo.equals(other.deccodigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Decisao[ deccodigo=" + deccodigo + " ]";
    }
    
}
