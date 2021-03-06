/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Opcao;
import java.util.List;

/**
 *
 * @author Cliente
 */
public class OpcaoDAO extends GenericDAO<Opcao, Integer>{
    
    public OpcaoDAO(){
        super(Opcao.class);
    }
    //Select ainda não implementado no modelo
    public List<Opcao> listar(String filtro) throws Exception{
        
        return em.createNamedQuery("Opcao.findFilter").setParameter("filtro", "%" + filtro + "%").getResultList();
    }
    
    public List<Opcao> listarpordeccid(Integer filtro) throws Exception{
        
        return em.createNamedQuery("Opcao.findbydecidFilter").setParameter("filtro", filtro ).getResultList();
    }
    
    public List acharopcaoList(Integer filtro, Integer filtro2) throws Exception{
        
        return em.createNamedQuery("Opcao.findidFilter", Opcao.class).setParameter("filtro" , filtro ).setParameter("filtro2", filtro2).getResultList();
    }
    
}
