/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Membro;
import java.util.List;

/**
 *
 * @author Cliente
 */
public class MembroDAO extends GenericDAO<Membro, Integer>{
    
    public MembroDAO(){
        super(Membro.class);
    }
    //Select ainda não implementado no modelo
    public List<Membro> listar(String filtro) throws Exception{
        
        return em.createNamedQuery("Membro.findFilter").setParameter("filtro", "%" + filtro + "%").getResultList();
    }
    public List<Membro> listarporusuid(Integer filtro) throws Exception{
        
        return em.createNamedQuery("Membro.findbyusuidFilter").setParameter("filtro", filtro ).getResultList();
    }
    public List<Membro> listarporgruid(Integer filtro) throws Exception{
        
        return em.createNamedQuery("Membro.findbygruidFilter").setParameter("filtro", filtro ).getResultList();
    }
    public Membro acharmembro(Integer filtro, Integer filtro2) throws Exception{
        
        return (Membro) em.createNamedQuery("Membro.findidFilter").setParameter("filtro" , filtro ).setParameter("filtro2", filtro2).getSingleResult();
    }
    public List acharmembroList(Integer filtro, Integer filtro2) throws Exception{
        
        return em.createNamedQuery("Membro.findidFilter", Membro.class).setParameter("filtro" , filtro ).setParameter("filtro2", filtro2).getResultList();
    }
    public List<Membro> achargrmembroList(Integer filtro) throws Exception{
        
        return em.createNamedQuery("Membro.findgrFilter", Membro.class).setParameter("filtro" , filtro ).getResultList();
    }
    
    
}
