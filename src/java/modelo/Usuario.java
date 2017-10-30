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
 * @author Cliente
 */
@Entity
@Table(name = "usuario")
@NamedQueries({
    @NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u"),
    @NamedQuery(name = "Usuario.findFilter", query = "SELECT h FROM Usuario h where LOWER(h.usulogin) like :filtro or LOWER(h.usunick) like :filtro"),
    @NamedQuery(name = "Usuario.findImg", query = "SELECT n FROM Usuario n where LOWER(n.usunick) like :filtro"),
    @NamedQuery(name = "Usuario.findMax", query = "SELECT MAX( c.usucodigo ) FROM Usuario c")})
public class Usuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "usucodigo")
    private Integer usucodigo;
    @Column(name = "usulogin")
    private String usulogin;
    @Column(name = "ususenha")
    private String ususenha;
    @Column(name = "usunick")
    private String usunick;
    @Column(name = "usuimg")
    private String usuimg;
    @OneToMany(mappedBy = "usucodigo")
    private List<Convitegr> convitegrList;
    @OneToMany(mappedBy = "usucodigo")
    private List<Membro> membroList;

    public Usuario() {
    }

    public Usuario(Integer usucodigo) {
        this.usucodigo = usucodigo;
    }

    public Integer getUsucodigo() {
        return usucodigo;
    }

    public void setUsucodigo(Integer usucodigo) {
        this.usucodigo = usucodigo;
    }

    public String getUsulogin() {
        return usulogin;
    }

    public void setUsulogin(String usulogin) {
        this.usulogin = usulogin;
    }

    public String getUsusenha() {
        return ususenha;
    }

    public void setUsusenha(String ususenha) {
        this.ususenha = ususenha;
    }

    public String getUsunick() {
        return usunick;
    }

    public void setUsunick(String usunick) {
        this.usunick = usunick;
    }

    public String getUsuimg() {
        return usuimg;
    }

    public void setUsuimg(String usuimg) {
        this.usuimg = usuimg;
    }

    public List<Convitegr> getConvitegrList() {
        return convitegrList;
    }

    public void setConvitegrList(List<Convitegr> convitegrList) {
        this.convitegrList = convitegrList;
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
        hash += (usucodigo != null ? usucodigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Usuario)) {
            return false;
        }
        Usuario other = (Usuario) object;
        if ((this.usucodigo == null && other.usucodigo != null) || (this.usucodigo != null && !this.usucodigo.equals(other.usucodigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "dao.Usuario[ usucodigo=" + usucodigo + " ]";
    }
    
}
