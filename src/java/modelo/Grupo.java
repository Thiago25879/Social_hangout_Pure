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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author thiago
 */
@Entity
@Table(name = "grupo")
@NamedQueries({
    @NamedQuery(name = "Grupo.findAll", query = "SELECT g FROM Grupo g"),
    @NamedQuery(name = "Grupo.findFilter", query = "SELECT h FROM Grupo h where LOWER(h.grunome) like :filtro"),
    @NamedQuery(name = "Grupo.findImg", query = "SELECT n FROM Grupo n where LOWER(n.grunome) like :filtro")})
public class Grupo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "grucodigo")
    private Integer grucodigo;
    @Column(name = "gruimg")
    private String gruimg;
    @Column(name = "grunome")
    private String grunome;
    @OneToMany(mappedBy = "grucodigo")
    private List<Convitegr> convitegrList;
    @OneToMany(mappedBy = "grucodigo")
    private List<Evento> eventoList;
    @OneToMany(mappedBy = "grucodigo")
    private List<Membro> membroList;

    public Grupo() {
    }

    public Grupo(Integer grucodigo) {
        this.grucodigo = grucodigo;
    }

    public Integer getGrucodigo() {
        return grucodigo;
    }

    public void setGrucodigo(Integer grucodigo) {
        this.grucodigo = grucodigo;
    }

    public String getGruimg() {
        return gruimg;
    }

    public void setGruimg(String gruimg) {
        this.gruimg = gruimg;
    }

    public String getGrunome() {
        return grunome;
    }

    public void setGrunome(String grunome) {
        this.grunome = grunome;
    }

    public List<Convitegr> getConvitegrList() {
        return convitegrList;
    }

    public void setConvitegrList(List<Convitegr> convitegrList) {
        this.convitegrList = convitegrList;
    }

    public List<Evento> getEventoList() {
        return eventoList;
    }

    public void setEventoList(List<Evento> eventoList) {
        this.eventoList = eventoList;
    }

    public List<Membro> getMembroList() {
        return membroList;
    }

    public void setMembroList(List<Membro> membroList) {
        this.membroList = membroList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (grucodigo != null ? grucodigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Grupo)) {
            return false;
        }
        Grupo other = (Grupo) object;
        if ((this.grucodigo == null && other.grucodigo != null) || (this.grucodigo != null && !this.grucodigo.equals(other.grucodigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Grupo[ grucodigo=" + grucodigo + " ]";
    }
    
}
