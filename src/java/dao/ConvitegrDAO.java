/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Convitegr;
import java.util.List;

/**
 *
 * @author Cliente
 */
public class ConvitegrDAO extends GenericDAO<Convitegr, Integer>{
    
    public ConvitegrDAO(){
        super(Convitegr.class);
    }
    //Select ainda não implementado no modelo
    public List<Convitegr> listar(String filtro) throws Exception{
        
        return em.createNamedQuery("Convitegr.findFilter").setParameter("filtro", "%" + filtro + "%").getResultList();
    }
    public Convitegr acharconvite(Integer filtro, Integer filtro2) throws Exception{
        
        return (Convitegr) em.createNamedQuery("Convitegr.findidFilter").setParameter("filtro" , filtro ).setParameter("filtro2", filtro2).getSingleResult();
    }
    public List acharconviteList(Integer filtro, Integer filtro2) throws Exception{
        
        return em.createNamedQuery("Convitegr.findidListFilter", Convitegr.class).setParameter("filtro" , filtro ).setParameter("filtro2", filtro2).getResultList();
    }
}
