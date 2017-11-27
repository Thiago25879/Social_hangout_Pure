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
@Table(name = "opcao")
@NamedQueries({
    @NamedQuery(name = "Opcao.findAll", query = "SELECT o FROM Opcao o"),
    @NamedQuery(name = "Opcao.findbydecidFilter", query = "SELECT l FROM Opcao l where l.deccodigo.deccodigo = :filtro"),
    @NamedQuery(name = "Opcao.findFilter", query = "SELECT h FROM Opcao h where LOWER(h.opcnome) like :filtro or LOWER(h.deccodigo.dectitulo) like :filtro or LOWER(h.parcodigo.memcodigo.usucodigo.usunick) like :filtro")})
public class Opcao implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "opccodigo")
    private Integer opccodigo;
    @Column(name = "opcnome")
    private String opcnome;
    @JoinColumn(name = "deccodigo", referencedColumnName = "deccodigo")
    @ManyToOne
    private Decisao deccodigo;
    @JoinColumn(name = "parcodigo", referencedColumnName = "parcodigo")
    @ManyToOne
    private Participante parcodigo;
    @OneToMany(mappedBy = "opccodigo")
    private List<Voto> votoList;

    public Opcao() {
    }

    public Opcao(Integer opccodigo) {
        this.opccodigo = opccodigo;
    }

    public Integer getOpccodigo() {
        return opccodigo;
    }

    public void setOpccodigo(Integer opccodigo) {
        this.opccodigo = opccodigo;
    }

    public String getOpcnome() {
        return opcnome;
    }

    public void setOpcnome(String opcnome) {
        this.opcnome = opcnome;
    }

    public Decisao getDeccodigo() {
        return deccodigo;
    }

    public void setDeccodigo(Decisao deccodigo) {
        this.deccodigo = deccodigo;
    }

    public Participante getParcodigo() {
        return parcodigo;
    }

    public void setParcodigo(Participante parcodigo) {
        this.parcodigo = parcodigo;
    }

    public List<Voto> getVotoList() {
        return votoList;
    }

    public void setVotoList(List<Voto> votoList) {
        this.votoList = votoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (opccodigo != null ? opccodigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Opcao)) {
            return false;
        }
        Opcao other = (Opcao) object;
        if ((this.opccodigo == null && other.opccodigo != null) || (this.opccodigo != null && !this.opccodigo.equals(other.opccodigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Opcao[ opccodigo=" + opccodigo + " ]";
    }
    
}
