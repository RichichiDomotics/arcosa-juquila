package com.cbj.almacen.repository.impl;

import com.cbj.almacen.domain.CausasRetraso;
import com.cbj.almacen.repository.CausasRetrasoDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by GERENCIA SISTEMAS on 28/12/2016.
 */
@Repository(value = "causasRetrasoDao")
public class CausasRetrasoDaoImpl implements CausasRetrasoDao {
    private static final Logger logger = LoggerFactory
            .getLogger(InventarioDaoImpl.class);

    private EntityManager em = null;

    /*
     * Sets the entity manager.
     */
    @PersistenceContext
    public void setEntityManager(EntityManager em) {
        this.em = em;
    }

    @Transactional(readOnly = false)
    public boolean insertCausaRetraso(CausasRetraso causasRetraso) {
        boolean respuesta=false;
        try{
            em.persist(causasRetraso);
            respuesta=true;
        }catch(Exception e){
            logger.error(e.getMessage() + e.getCause());
            respuesta=false;
        }
        return respuesta;
    }

    @Transactional(readOnly = false)
    public boolean updateCausaRetraso(CausasRetraso causasRetraso) {
        boolean respuesta = false;
        try {
            em.merge(causasRetraso);
            respuesta = true;
        } catch (Exception e) {
            logger.error(e.getMessage() + e.getCause());
            respuesta = false;
        }
        return respuesta;
    }

    @Override
    public List<CausasRetraso> getAll(){
        try{
            Query query = em.createNamedQuery("CausasRetraso.getAll");
            return query.getResultList();
        }catch (Exception e){
            logger.error("Error al traer las Causas de Retraso");
            e.printStackTrace();
            return new ArrayList<CausasRetraso>();
        }
    }
}
