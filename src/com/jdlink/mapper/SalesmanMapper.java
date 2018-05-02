package com.jdlink.mapper;

import com.jdlink.domain.Salesman;

import java.util.List;
import java.util.Map;

/**
 * Created by matt on 2018/4/23.
 */
public interface SalesmanMapper {

    void add(Salesman salesman);

    void delete(String salesmanId);

    List<Salesman> get(Map params);

    List<Salesman> getBySalesmanId(String salesmanId);

    List<Salesman> getByClientId(String clientId);

    void update(Salesman salesman);

    List<Salesman> list();

    int count();

}
