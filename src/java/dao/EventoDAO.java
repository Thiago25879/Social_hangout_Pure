/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Evento;
import java.util.List;

/**
 *
 * @author Cliente
 */
public class EventoDAO extends GenericDAO<Evento, Integer>{
    
    public EventoDAO(){
        super(Evento.class);
    }
    //Select ainda não implementado no modelo
    public List<Evento> listar(String filtro) throws Exception{
        
        return em.createNamedQuery("Evento.findFilter").setParameter("filtro", "%" + filtro + "%").getResultList();
    }
    public List<Evento> listarImg(String filtro) throws Exception{
        
        return em.createNamedQuery("Evento.findImg").setParameter("filtro", "%" + filtro + "%").getResultList();
    }
    
    public List<Evento> listarbyEve(Integer filtro) throws Exception{
        
        return em.createNamedQuery("Evento.findbyeveidFilter").setParameter("filtro",filtro).getResultList();
    }
    
            
}
