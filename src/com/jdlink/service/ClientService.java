package com.jdlink.service;

import com.jdlink.domain.Client;

import java.util.List;
import java.util.Map;

/**
 * Created by matt on 2018/4/23.
 */
public interface ClientService {

    void add(Client client);

    void delete(String clientId);

    Client getByClientId(String clientId);

    List<Client> get(Map params);

    List<Client> get(Client client);

    void update(Client client);

    List<Client> list();

    int count();

}