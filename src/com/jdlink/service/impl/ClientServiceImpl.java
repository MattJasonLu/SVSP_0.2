package com.jdlink.service.impl;

import com.jdlink.domain.Client;
import com.jdlink.mapper.ClientMapper;
import com.jdlink.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by matt on 2018/4/23.
 */
@Service
public class ClientServiceImpl implements ClientService {

    @Autowired
    ClientMapper clientMapper;

    @Override
    public void add(Client client) {
        clientMapper.add(client);
    }

    @Override
    public void delete(String clientId) {
        clientMapper.delete(clientId);
    }

    @Override
    public Client getByClientId(String clientId) {
        return clientMapper.getByClientId(clientId);
    }

    @Override
    public List<Client> get(Map params) {
        return clientMapper.get(params);
    }

    @Override
    public List<Client> get(Client client) {
        return clientMapper.get(client);
    }

    @Override
    public void update(Client client) {
        clientMapper.update(client);
    }

    @Override
    public List<Client> list() {
        return clientMapper.list();
    }

    @Override
    public int count() {
        return clientMapper.count();
    }
}
