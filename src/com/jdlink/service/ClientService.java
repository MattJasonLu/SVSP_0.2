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

    Client getByName(String companyName);

    List<Client> get(Map params);

    List<Client> get(Client client);

    void update(Client client);

    List<Client> list();
    /**
     * 启用用户
     * @param clientId
     */
    void enableState(String clientId);
    /**
     * 禁用用户
     * @param clientId
     */
    void disableState(String clientId);

    void setCheckStateToSubmit(String clientId);

    void setCheckStateExamining(String clientId);

    void setCheckStateFinished(String clientId);

    int count();

}
