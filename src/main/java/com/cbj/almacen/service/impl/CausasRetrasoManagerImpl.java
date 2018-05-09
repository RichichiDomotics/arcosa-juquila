package com.cbj.almacen.service.impl;

import com.cbj.almacen.domain.CausasRetraso;
import com.cbj.almacen.repository.CausasRetrasoDao;
import com.cbj.almacen.service.CausasRetrasoManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by GERENCIA SISTEMAS on 28/12/2016.
 */
@Component
public class CausasRetrasoManagerImpl implements CausasRetrasoManager {
    private static final long serialVersionUID = 1L;

    @Autowired
    private CausasRetrasoDao causasRetrasoDao;

    @Override
    public List<CausasRetraso> getAll(){
        return causasRetrasoDao.getAll();
    }
}
