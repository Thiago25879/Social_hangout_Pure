/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Voto;
import java.util.List;

/**
 *
 * @author Cliente
 */
public class VotoDAO extends GenericDAO<Voto, Integer>{
    
    public VotoDAO(){
        super(Voto.class);
    }
    public List<Voto> listar(String filtro) throws Exception{
        
        return em.createNamedQuery("Voto.findFilter").setParameter("filtro", "%" + filtro + "%").getResultList();
    }
    public List acharvotoList(Integer filtro, Integer filtro2, Integer filtro3) throws Exception{
        
        return em.createNamedQuery("Voto.findidFilter", Voto.class).setParameter("filtro" , filtro ).setParameter("filtro2", filtro2).setParameter("filtro3", filtro3).getResultList();
    }
    public List acharvotosList(Integer filtro, Integer filtro2) throws Exception{
        
        return em.createNamedQuery("Voto.findopcsFilter", Voto.class).setParameter("filtro" , filtro ).setParameter("filtro2", filtro2).getResultList();
    }
    public List acharvotosnumList(Integer filtro, Integer filtro2) throws Exception{
        
        return em.createNamedQuery("Voto.findvotosnumFilter", Voto.class).setParameter("filtro" , filtro ).setParameter("filtro2", filtro2).getResultList();
    }
}