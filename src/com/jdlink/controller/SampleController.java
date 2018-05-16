package com.jdlink.controller;

import com.jdlink.domain.ApplyState;
import com.jdlink.domain.Client;
import com.jdlink.domain.SampleAppoint;
import com.jdlink.domain.SampleCheck;
import com.jdlink.service.ClientService;
import com.jdlink.service.SampleAppointService;
import com.jdlink.service.SampleCheckService;
import com.jdlink.util.RandomUtil;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by matt on 2018/5/14.
 */
@Controller
public class SampleController {
    @Autowired
    SampleAppointService sampleAppointService;
    @Autowired
    SampleCheckService sampleCheckService;
    @Autowired
    ClientService clientService;

    @RequestMapping("listSample")
    public ModelAndView listSample() {
        ModelAndView mav = new ModelAndView();
        // 获取两个列表
        List<SampleAppoint> sampleAppointList = sampleAppointService.list();
        List<SampleCheck> sampleCheckList = sampleCheckService.list();
        mav.addObject("sampleAppointList", sampleAppointList);
        mav.addObject("sampleCheckList", sampleCheckList);
        mav.setViewName("sample");
        return mav;
    }

    @RequestMapping("addSampleAppoint")
    public ModelAndView addSampleAppoint(SampleAppoint sampleAppoint) {
        ModelAndView mav = new ModelAndView();
        // 生成预约号
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
        String prefix = simpleDateFormat.format(date);
        int count = sampleAppointService.countById(prefix)+1;
        String suffix = "";
        if (count > 9) suffix = "0" + count;
        else suffix = count + "";
        sampleAppoint.setAppointId(RandomUtil.getAppointId(prefix, suffix));
        // 通过用户输入的公司名称匹配客户
        Client client = clientService.getByName(sampleAppoint.getCompanyName());
        // 若匹配到客户则更新预约表中的客户编号
        if (client != null) sampleAppoint.setClientId(client.getClientId());
        sampleAppoint.setState(ApplyState.Canceld);
        // 添加预约表
        sampleAppointService.add(sampleAppoint);
        // 刷新列表
        return listSample();
    }

    @RequestMapping("getSampleAppoint")
    public ModelAndView getSampleAppoint(String appointId) {
        ModelAndView mav = new ModelAndView();

        SampleAppoint sampleAppoint = sampleAppointService.getById(appointId);
        JSONObject jsonObject = JSONObject.fromBean(sampleAppoint);
        mav.addObject("message", jsonObject);
        mav.setViewName("data");
        return mav;
    }

    @RequestMapping("addSampleCheck")
    public ModelAndView addSampleCheck(SampleCheck sampleCheck, String appointId) {
        ModelAndView mav = new ModelAndView();
        sampleCheck.setAppointId(appointId);
        sampleCheck.setCheckId(RandomUtil.getCheckId(appointId));

        SampleAppoint sampleAppoint = sampleAppointService.getById(appointId);
        sampleCheck.setClientId(sampleAppoint.getClientId());

        // 添加登记表
        sampleCheckService.add(sampleCheck);
        // 刷新列表
        return listSample();
    }
}
