/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Participante;
import java.util.List;

/**
 *
 * @author Cliente
 */
public class ParticipanteDAO extends GenericDAO<Participante, Integer>{
    
    public ParticipanteDAO(){
        super(Participante.class);
    }
    //Select ainda não implementado no modelo
    public List<Participante> listar(String filtro) throws Exception{
        
        return em.createNamedQuery("Participante.findFilter").setParameter("filtro", "%" + filtro + "%").getResultList();
    }
    public List<Participante> listarporusuid(Integer filtro) throws Exception{
        
        return em.createNamedQuery("Participante.findbyusuidFilter").setParameter("filtro", filtro ).getResultList();
    }
    public Participante acharparticipante(Integer filtro, Integer filtro2) throws Exception{
        
        return (Participante) em.createNamedQuery("Participante.findidFilter").setParameter("filtro" , filtro ).setParameter("filtro2", filtro2).getSingleResult();
    }
    public List<Participante> acharparticipantelist(Integer filtro, Integer filtro2) throws Exception{
        
        return  em.createNamedQuery("Participante.findidFilter").setParameter("filtro" , filtro ).setParameter("filtro2", filtro2).getResultList();
    }
}
