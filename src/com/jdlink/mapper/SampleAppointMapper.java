package com.jdlink.mapper;

import com.jdlink.domain.SampleAppoint;

import java.util.List;

/**
 * Created by matt on 2018/4/23.
 */
public interface SampleAppointMapper {

    void add(SampleAppoint sampleAppoint);

    void delete(String appointId);

    SampleAppoint getById(String appointId);

    int countById(String appointId);

    List<SampleAppoint> list();

}
