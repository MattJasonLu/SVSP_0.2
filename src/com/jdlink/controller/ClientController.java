package com.jdlink.controller;

import com.jdlink.domain.Client;
import com.jdlink.service.ClientService;
import com.jdlink.util.RandomUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * Created by matt on 2018/4/23.
 */
@Controller
public class ClientController {

    @Autowired
    ClientService clientService;

    @RequestMapping("addClient")
    public ModelAndView addClient(Client client) {
        ModelAndView mav = new ModelAndView();
        try {
            // 文件名设置，上传文件
            // TODO: 同名文件上传会出现问题，修改为随机名称
            if (client.getMaterialAttachment() != null && !client.getMaterialAttachment().getOriginalFilename().equals("")) {
                String materialAttachmentName = client.getMaterialAttachment().getOriginalFilename();
                client.setMaterialAttachmentUrl(materialAttachmentName);
                File materialAttachment = new File("file/" + materialAttachmentName);
                materialAttachment.getParentFile().mkdirs();
                // 若文件存在则删除
                if (materialAttachment.exists()) materialAttachment.delete();
                client.getMaterialAttachment().transferTo(materialAttachment);
            }

            if (client.getProcessAttachment() != null && !client.getProcessAttachment().getOriginalFilename().equals("")) {
                String processAttachmentName = client.getProcessAttachment().getOriginalFilename();
                client.setProcessAttachmentUrl(processAttachmentName);
                File processAttachment = new File("file/" + processAttachmentName);
                processAttachment.getParentFile().mkdirs();
                if (processAttachment.exists()) processAttachment.delete();
                client.getProcessAttachment().transferTo(processAttachment);
            }
        } catch (IOException e) {
            e.printStackTrace();
            mav.addObject("message", "创建客户失败，请完善信息！");
            mav.setViewName("fail");
        }
        // TODO: 修改暂时编号（规则未定）
        client.setTemporaryId(RandomUtil.getRandomFileName());

        try {
            clientService.add(client);
            mav.addObject("message", "备案成功");
            mav.setViewName("success");
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("message", "信息输入错误，请重试！" + e);
            mav.setViewName("fail");
        }
        return mav;
    }

    @RequestMapping("updateClient")
    public ModelAndView updateClient(Client client) {
        ModelAndView mav = new ModelAndView();
        try {

        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("message", "信息输入错误，请重试！");
            mav.setViewName("fail");
        }
        return mav;
    }

    @RequestMapping("listClient")
    public ModelAndView listClient() {
        ModelAndView mav = new ModelAndView();
        List<Client> clientList = clientService.list();
        mav.addObject("clientList", clientList);
        mav.setViewName("beian");

        return mav;
    }

    @RequestMapping("getClient")
    public ModelAndView getClient(String keyword) {
        ModelAndView mav = new ModelAndView();
        Map param = new HashMap();
        param.put("keyword", keyword);

        List<Client> clientList = clientService.get(param);
        mav.addObject("clientList", clientList);

        mav.setViewName("beian");

        return mav;
    }

    @RequestMapping("enableClient")
    public ModelAndView enableClient(String clientId) {
        ModelAndView mav = new ModelAndView();
        // 启用用户
        clientService.enableState(clientId);
        // 刷新页面
        return listClient();
    }

    @RequestMapping("disableClient")
    public ModelAndView disableClient(String clientId) {
        ModelAndView mav = new ModelAndView();
        // 禁用用户
        clientService.disableState(clientId);
        // 刷新页面
        return listClient();
    }
}
