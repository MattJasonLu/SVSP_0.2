package com.jdlink.controller;

import com.jdlink.domain.*;
import com.jdlink.service.ClientService;
import com.jdlink.util.RandomUtil;
import com.sun.org.apache.bcel.internal.generic.InstructionConstants;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

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
        clientService.update(client);
        return null;
    }

    /**
     * 取出所有客户对象
     * @return 客户列表集合对象
     */
    @RequestMapping("listClient")
    @ResponseBody
    public String listClient(Page page) {
        // 取出所有客户
        List<Client> clientList = clientService.list(page);
        // 计算最后页
        page.caculateLast(clientService.total());
        JSONArray array = JSONArray.fromArray(clientList.toArray(new Client[clientList.size()]));
        // 返回结果
        return array.toString();
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
        return null;
    }

    @RequestMapping("disableClient")
    public ModelAndView disableClient(String clientId) {
        ModelAndView mav = new ModelAndView();
        // 禁用用户
        clientService.disableState(clientId);
        // 刷新页面
        return null;
    }

    @RequestMapping("showClient")
    public ModelAndView showClient(String clientId) {
        ModelAndView mav = new ModelAndView();
        Client client = clientService.getByClientId(clientId);
        mav.addObject("client", client);
        // 获取枚举列表
        // 企业类型
        List<String> enterpriseTypeStrList = new ArrayList<>();
        for (EnterpriseType enterpriseType : EnterpriseType.values()) {
            enterpriseTypeStrList.add(enterpriseType.getName());
        }
        // 经营方式
        List<String> operationModeStrList = new ArrayList<>();
        for (OperationMode operationMode : OperationMode.values()) {
            operationModeStrList.add(operationMode.getName());
        }
        // 经营单位类别
        List<String> operationTypeStrList = new ArrayList<>();
        for (OperationType operationType : OperationType.values()) {
            operationTypeStrList.add(operationType.getName());
        }
        // 应急预案
        List<String> contingencyPlanStrList = new ArrayList<>();
        for (ContingencyPlan contingencyPlan : ContingencyPlan.values()) {
            contingencyPlanStrList.add(contingencyPlan.getName());
        }
        // 危废记录
        List<String> operationRecordStrList = new ArrayList<>();
        for (OperationRecord operationRecord : OperationRecord.values()) {
            operationRecordStrList.add(operationRecord.getName());
        }
        // 申报状态
        List<String> applicationStatusStrList = new ArrayList<>();
        for (ApplicationStatus applicationStatus : ApplicationStatus.values()) {
            applicationStatusStrList.add(applicationStatus.getName());
        }

        mav.addObject("operationModeStrList", operationModeStrList);
        mav.addObject("enterpriseTypeStrList", enterpriseTypeStrList);
        mav.addObject("operationTypeStrList", operationTypeStrList);
        mav.addObject("contingencyPlanStrList", contingencyPlanStrList);
        mav.addObject("operationRecordStrList", operationRecordStrList);
        mav.addObject("applicationStatusStrList", applicationStatusStrList);
        mav.setViewName("showClient");
        return mav;
    }
}
