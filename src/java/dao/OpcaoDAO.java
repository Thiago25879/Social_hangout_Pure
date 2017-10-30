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
    
}
