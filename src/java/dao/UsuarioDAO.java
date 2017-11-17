/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Usuario;
import java.util.List;

/**
 *
 * @author Cliente
 */
public class UsuarioDAO extends GenericDAO<Usuario, Integer>{
    
    public UsuarioDAO(){
        super(Usuario.class);
    }
    //Select ainda não implementado no modelo
    public List<Usuario> listar(String filtro) throws Exception{
        
        return em.createNamedQuery("Usuario.findFilter").setParameter("filtro", "%" + filtro + "%").getResultList();
    }
    public Usuario buscarPorChavePrimaria(String usulogin)
    {
        return em.find(Usuario.class, usulogin);
    }
    public List<Usuario> listarImg(String filtro) throws Exception{
        
        return em.createNamedQuery("Usuario.findImg").setParameter("filtro", "%" + filtro + "%").getResultList();
    }
    public Usuario buscarUsr(String filtro) throws Exception{
        
        return (Usuario) em.createNamedQuery("Usuario.findUsr").setParameter("filtro", filtro).getSingleResult();
    }
    public Integer Max() throws Exception {
              
        return (Integer) em.createNamedQuery("Usuario.findMax").getSingleResult(); 
    }
    
}
