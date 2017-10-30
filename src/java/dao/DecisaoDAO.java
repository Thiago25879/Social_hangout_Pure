/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Decisao;
import java.util.List;

/**
 *
 * @author Cliente
 */
public class DecisaoDAO extends GenericDAO<Decisao, Integer>{
    
    public DecisaoDAO(){
        super(Decisao.class);
    }
    //Select ainda não implementado no modelo
    public List<Decisao> listar(String filtro) throws Exception{
        
        return em.createNamedQuery("Decisao.findFilter").setParameter("filtro", "%" + filtro + "%").getResultList();
    }
    
}
