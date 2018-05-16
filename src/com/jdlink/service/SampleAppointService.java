package com.jdlink.service;

import com.jdlink.domain.SampleAppoint;

import java.util.List;

/**
 * Created by matt on 2018/5/14.
 */
public interface SampleAppointService {

    void add(SampleAppoint sampleAppoint);

    void delete(String appointId);

    SampleAppoint getById(String appointId);

    int countById(String appointId);

    List<SampleAppoint> list();

}
