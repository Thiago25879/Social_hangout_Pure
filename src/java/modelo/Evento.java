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
 * @author Cliente
 */
@Entity
@Table(name = "evento")
@NamedQueries({
    @NamedQuery(name = "Evento.findAll", query = "SELECT e FROM Evento e"),
    @NamedQuery(name = "Evento.findFilter", query = "SELECT h FROM Evento h where LOWER(h.evenome) like :filtro or LOWER(h.evedesc) like :filtro  or LOWER(h.grucodigo.grunome) like :filtro"),
    @NamedQuery(name = "Evento.findImg", query = "SELECT n FROM Evento n where LOWER(n.evenome) like :filtro")})
public class Evento implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "evecodigo")
    private Integer evecodigo;
    @Column(name = "evenome")
    private String evenome;
    @Column(name = "evedesc")
    private String evedesc;
    @Column(name = "eveimg")
    private String eveimg;
    @JoinColumn(name = "grucodigo", referencedColumnName = "grucodigo")
    @ManyToOne
    private Grupo grucodigo;
    @OneToMany(mappedBy = "evecodigo")
    private List<Conviteev> conviteevList;
    @OneToMany(mappedBy = "evecodigo")
    private List<Decisao> decisaoList;
    @OneToMany(mappedBy = "evecodigo")
    private List<Participante> participanteList;

    public Evento() {
    }

    public Evento(Integer evecodigo) {
        this.evecodigo = evecodigo;
    }

    public Integer getEvecodigo() {
        return evecodigo;
    }

    public void setEvecodigo(Integer evecodigo) {
        this.evecodigo = evecodigo;
    }

    public String getEvenome() {
        return evenome;
    }

    public void setEvenome(String evenome) {
        this.evenome = evenome;
    }

    public String getEvedesc() {
        return evedesc;
    }

    public void setEvedesc(String evedesc) {
        this.evedesc = evedesc;
    }

    public String getEveimg() {
        return eveimg;
    }

    public void setEveimg(String eveimg) {
        this.eveimg = eveimg;
    }

    public Grupo getGrucodigo() {
        return grucodigo;
    }

    public void setGrucodigo(Grupo grucodigo) {
        this.grucodigo = grucodigo;
    }

    public List<Conviteev> getConviteevList() {
        return conviteevList;
    }

    public void setConviteevList(List<Conviteev> conviteevList) {
        this.conviteevList = conviteevList;
    }

    public List<Decisao> getDecisaoList() {
        return decisaoList;
    }

    public void setDecisaoList(List<Decisao> decisaoList) {
        this.decisaoList = decisaoList;
    }

    public List<Participante> getParticipanteList() {
        return participanteList;
    }

    public void setParticipanteList(List<Participante> participanteList) {
        this.participanteList = participanteList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (evecodigo != null ? evecodigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Evento)) {
            return false;
        }
        Evento other = (Evento) object;
        if ((this.evecodigo == null && other.evecodigo != null) || (this.evecodigo != null && !this.evecodigo.equals(other.evecodigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "dao.Evento[ evecodigo=" + evecodigo + " ]";
    }
    
}
