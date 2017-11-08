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
@Table(name = "membro")
@NamedQueries({
    @NamedQuery(name = "Membro.findAll", query = "SELECT m FROM Membro m"),
    @NamedQuery(name = "Membro.findbyusuidFilter", query = "SELECT l FROM Membro l where l.usucodigo.usucodigo = :filtro"),
    @NamedQuery(name = "Membro.findbygruidFilter", query = "SELECT l FROM Membro l where l.grucodigo.grucodigo = :filtro"),
    @NamedQuery(name = "Membro.findFilter", query = "SELECT h FROM Membro h where LOWER(h.memdata) like :filtro or LOWER(h.usucodigo.usunick) like :filtro or LOWER(h.grucodigo.grunome) like :filtro")})
public class Membro implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "memcodigo")
    private Integer memcodigo;
    @Column(name = "memdata")
    private String memdata;
    @Column(name = "memativo")
    private Boolean memativo;
    @OneToMany(mappedBy = "memcodigo")
    private List<Voto> votoList;
    @OneToMany(mappedBy = "memcodigo")
    private List<Conviteev> conviteevList;
    @JoinColumn(name = "grucodigo", referencedColumnName = "grucodigo")
    @ManyToOne
    private Grupo grucodigo;
    @JoinColumn(name = "usucodigo", referencedColumnName = "usucodigo")
    @ManyToOne
    private Usuario usucodigo;
    @OneToMany(mappedBy = "memcodigo")
    private List<Participante> participanteList;

    public Membro() {
    }

    public Membro(Integer memcodigo) {
        this.memcodigo = memcodigo;
    }

    public Integer getMemcodigo() {
        return memcodigo;
    }

    public void setMemcodigo(Integer memcodigo) {
        this.memcodigo = memcodigo;
    }

    public String getMemdata() {
        return memdata;
    }

    public void setMemdata(String memdata) {
        this.memdata = memdata;
    }

    public Boolean getMemativo() {
        return memativo;
    }

    public void setMemativo(Boolean memativo) {
        this.memativo = memativo;
    }

    public List<Voto> getVotoList() {
        return votoList;
    }

    public void setVotoList(List<Voto> votoList) {
        this.votoList = votoList;
    }

    public List<Conviteev> getConviteevList() {
        return conviteevList;
    }

    public void setConviteevList(List<Conviteev> conviteevList) {
        this.conviteevList = conviteevList;
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

    public List<Participante> getParticipanteList() {
        return participanteList;
    }

    public void setParticipanteList(List<Participante> participanteList) {
        this.participanteList = participanteList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (memcodigo != null ? memcodigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Membro)) {
            return false;
        }
        Membro other = (Membro) object;
        if ((this.memcodigo == null && other.memcodigo != null) || (this.memcodigo != null && !this.memcodigo.equals(other.memcodigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Membro[ memcodigo=" + memcodigo + " ]";
    }
    
}
