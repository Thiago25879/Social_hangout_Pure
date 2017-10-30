/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Grupo;
import java.util.List;

/**
 *
 * @author Cliente
 */
public class GrupoDAO extends GenericDAO<Grupo, Integer>{
    
    public GrupoDAO(){
        super(Grupo.class);
    }
    //Select ainda não implementado no modelo
    public List<Grupo> listar(String filtro) throws Exception{
        
        return em.createNamedQuery("Grupo.findFilter").setParameter("filtro", "%" + filtro + "%").getResultList();
    }
    public List<Grupo> listarImg(String filtro) throws Exception{
        
        return em.createNamedQuery("Grupo.findImg").setParameter("filtro", "%" + filtro + "%").getResultList();
    }
    
    
    
}
