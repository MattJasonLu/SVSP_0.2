package com.jdlink.service.impl;

import com.jdlink.domain.SampleAppoint;
import com.jdlink.mapper.SampleAppointMapper;
import com.jdlink.service.SampleAppointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by matt on 2018/5/14.
 */
@Service
public class SampleAppointServiceImpl implements SampleAppointService {
    @Autowired
    SampleAppointMapper sampleAppointMapper;

    @Override
    public void add(SampleAppoint sampleAppoint) {
        sampleAppointMapper.add(sampleAppoint);
    }

    @Override
    public void delete(String appointId) {
        sampleAppointMapper.delete(appointId);
    }

    @Override
    public SampleAppoint getById(String appointId) {
        return sampleAppointMapper.getById(appointId);
    }

    @Override
    public int countById(String appointId) {
        return sampleAppointMapper.countById(appointId);
    }

    @Override
    public List<SampleAppoint> list() {
        return sampleAppointMapper.list();
    }
}
