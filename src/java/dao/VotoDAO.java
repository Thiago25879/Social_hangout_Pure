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
}