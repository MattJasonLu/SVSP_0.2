package com.jdlink.controller;

import com.jdlink.domain.Client;
import com.jdlink.domain.Salesman;
import com.jdlink.service.ClientService;
import com.jdlink.service.SalesmanService;
import com.jdlink.util.RandomUtil;
import com.sun.javafx.sg.PGShape;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by matt on 2018/4/23.
 */
@Controller
public class SalesmanController {

    @Autowired
    SalesmanService salesmanService;

    @Autowired
    ClientService clientService;

    @RequestMapping("addSalesman")
    public ModelAndView addSalesman(Salesman salesman) {
        ModelAndView mav = new ModelAndView();
        try {
            salesmanService.add(salesman);
            mav.addObject("message", "业务员信息新增成功");
            mav.setViewName("success");
        } catch (Exception e) {
            mav.addObject("message", "新增失败，检查输入信息是否有误");
            mav.setViewName("fail");
        }
        return mav;
    }

    @RequestMapping("updateSalesman")
    public ModelAndView updateSalesman(String salesmanId, String clientId) {
        ModelAndView mav = new ModelAndView();
        try {
            Salesman salesman = new Salesman();
            salesman.setClientId(clientId);
            salesman.setSalesmanId(salesmanId);
            salesmanService.update(salesman);
            mav.addObject("message", "业务员信息更新成功");
            mav.setViewName("success");
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("message", "信息输入错误，请重试！");
            mav.setViewName("fail");
        }
        return mav;
    }

    @RequestMapping("deleteSalesman")
    public ModelAndView deleteSalesman(String salesmanId) {
        ModelAndView mav = new ModelAndView();
        try {
            salesmanService.delete(salesmanId);
            mav.addObject("message", "业务员信息删除成功");
            mav.setViewName("success");
        } catch (Exception e) {
            mav.addObject("message", "删除失败，请重试！");
            mav.setViewName("fail");
        }
        return mav;
    }


    @RequestMapping("listSalesman")
    public ModelAndView listSalesman() {
        ModelAndView mav = new ModelAndView();
        List<Salesman> salesmanList = salesmanService.list();

        mav.addObject("salesmanList", salesmanList);
        mav.setViewName("salesmanManagement");

        return mav;
    }

    @RequestMapping("getSalesman")
    public ModelAndView getSalesman(String type, String keyword) {
        ModelAndView mav = new ModelAndView();
        List<Salesman> salesmanList = null;
        Map param = new HashMap();
        if (type.equals("clientId")) {
            param.put("clientId", keyword);
//            salesmanList = salesmanService.getByClientId(keyword);
        } else if (type.equals("salesmanId")) {
            param.put("salesmanId", keyword);
//            salesmanList = salesmanService.getBySalesmanId(keyword);
        }
        salesmanList = salesmanService.get(param);
        mav.addObject("salesmanList", salesmanList);
        mav.setViewName("salesmanManagement");
        return mav;
    }

    @RequestMapping("bindClient")
    public ModelAndView bindClient(Salesman salesman) {
        ModelAndView mav = new ModelAndView();
        // 将客户信息加入mav
        List<Client> clientList = clientService.list();
        mav.addObject("clientList", clientList);
        // 加入当前业务员信息
        mav.addObject("salesman", salesman);
        // 跳转到绑定客户页面
        mav.setViewName("bindClient");
        return mav;
    }

}
