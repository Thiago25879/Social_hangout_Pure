/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Conviteev;
import java.util.List;

/**
 *
 * @author Cliente
 */
public class ConviteevDAO extends GenericDAO<Conviteev, Integer> {
    
    public ConviteevDAO(){
        super(Conviteev.class);
    }
    //Select ainda não implementado no modelo
    public List<Conviteev> listar(String filtro) throws Exception{
        
        return em.createNamedQuery("Conviteev.findFilter").setParameter("filtro", "%" + filtro + "%").getResultList();
    }
    
}