package com.cbj.almacen.service;

import com.cbj.almacen.domain.CausasRetraso;

import java.io.Serializable;
import java.util.List;

/**
 * Created by GERENCIA SISTEMAS on 28/12/2016.
 */
public interface CausasRetrasoManager extends Serializable {
    public List<CausasRetraso> getAll();
}
