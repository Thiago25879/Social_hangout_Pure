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
@Table(name = "participante")
@NamedQueries({
    @NamedQuery(name = "Participante.findAll", query = "SELECT p FROM Participante p"),
        @NamedQuery(name = "Participante.findFilter", query = "SELECT h FROM Participante h where LOWER(h.evecodigo.evenome) like :filtro or LOWER(h.memcodigo.usucodigo.usunick) like :filtro")})
public class Participante implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "parcodigo")
    private Integer parcodigo;
    @OneToMany(mappedBy = "parcodigo")
    private List<Opcao> opcaoList;
    @JoinColumn(name = "evecodigo", referencedColumnName = "evecodigo")
    @ManyToOne
    private Evento evecodigo;
    @JoinColumn(name = "memcodigo", referencedColumnName = "memcodigo")
    @ManyToOne
    private Membro memcodigo;

    public Participante() {
    }

    public Participante(Integer parcodigo) {
        this.parcodigo = parcodigo;
    }

    public Integer getParcodigo() {
        return parcodigo;
    }

    public void setParcodigo(Integer parcodigo) {
        this.parcodigo = parcodigo;
    }

    public List<Opcao> getOpcaoList() {
        return opcaoList;
    }

    public void setOpcaoList(List<Opcao> opcaoList) {
        this.opcaoList = opcaoList;
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
        hash += (parcodigo != null ? parcodigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Participante)) {
            return false;
        }
        Participante other = (Participante) object;
        if ((this.parcodigo == null && other.parcodigo != null) || (this.parcodigo != null && !this.parcodigo.equals(other.parcodigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Participante[ parcodigo=" + parcodigo + " ]";
    }
    
}
