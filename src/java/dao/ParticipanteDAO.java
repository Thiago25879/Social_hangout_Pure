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
    
}
