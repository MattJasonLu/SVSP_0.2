package com.jdlink.mapper;

import com.jdlink.domain.Client;

import java.util.List;
import java.util.Map;

/**
 * Created by matt on 2018/4/23.
 */
public interface ClientMapper {

    void add(Client client);

    void delete(String clientId);

    Client getByClientId(String clientId);

    Client getByName(String companyName);

    List<Client> get(Map params);

    List<Client> get(Client client);

    void update(Client client);

    List<Client> list();

    void enableState(String clientId);

    void disableState(String clientId);

    int count();

}
