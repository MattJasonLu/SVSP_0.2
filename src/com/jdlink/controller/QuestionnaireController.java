package com.jdlink.controller;

import com.jdlink.domain.*;
import com.jdlink.service.*;
import com.jdlink.util.RandomUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.tags.form.FormTag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by matt on 2018/4/28.
 */
@Controller
public class QuestionnaireController {

    @Autowired
    ClientService clientService;
    @Autowired
    QuestionnaireService questionnaireService;
    @Autowired
    RawWastesService rawWastesService;
    @Autowired
    WasteProcessService wasteProcessService;
    @Autowired
    DeriveWastesService deriveWastesService;
    @Autowired
    MixingElementService mixingElementService;
    @Autowired
    SensitiveElementService sensitiveElementService;

    @RequestMapping("listQuestionnaire")
    public ModelAndView listQuestionnaire(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        try {
            // 通过session获取到客户编号clientId
            Client client = (Client) session.getAttribute("client");
            List<Questionnaire> questionnaireList = questionnaireService.getByClientId(client.getClientId());
            mav.addObject("questionnaireList", questionnaireList);
            mav.addObject("client", client);
            mav.setViewName("assessment");
        } catch (Exception e) {
            mav.addObject("message", "用户信息获取失败，请重新登录");
            mav.setViewName("fail");
        }

        return mav;
    }

    @RequestMapping("addQuestionnaire")
    public ModelAndView addQuestionnaire(HttpSession session, DeriveWastes deriveWastes) {
        ModelAndView mav = new ModelAndView();
        // 从session中获取
        Questionnaire questionnaire = (Questionnaire) session.getAttribute("questionnaire");
        // 更新数据
        DeriveWastes deriveWastes1 = questionnaire.getDeriveWastesList().get(0);
        deriveWastes1.setWasteCharacterList(deriveWastes.getWasteCharacterList());
        deriveWastes1.setWasteProtectList(deriveWastes.getWasteProtectList());
        deriveWastes1.setEyeMeasures(deriveWastes.getEyeMeasures());
        deriveWastes1.setSkinMeasures(deriveWastes.getSkinMeasures());
        deriveWastes1.setSwallowMeasures(deriveWastes.getSwallowMeasures());
        deriveWastes1.setSuctionMeasures(deriveWastes.getSuctionMeasures());
        deriveWastes1.setPutOutFireMeasures(deriveWastes.getPutOutFireMeasures());
        deriveWastes1.setLeakMeasures(deriveWastes.getLeakMeasures());

        // 添加调查表
        questionnaireService.add(questionnaire);
        // 添加调查表中的原材料
        for (RawWastes rawWastes : questionnaire.getRawWastesList()) {
            rawWastesService.add(rawWastes);
        }
        // 添加调查表中的处理流程
        for (WasteProcess wasteProcess : questionnaire.getWasteProcessList()) {
            wasteProcessService.add(wasteProcess);
        }
        // 添加调查表中的次生危废
        for (DeriveWastes wastes : questionnaire.getDeriveWastesList()) {
            deriveWastesService.add(wastes);
            if (wastes.getMixingElementList() != null)
            for (MixingElement mixingElement : wastes.getMixingElementList()) {
                mixingElementService.add(mixingElement);
            }
            if (wastes.getSensitiveElementList() != null)
            for (SensitiveElement sensitiveElement : wastes.getSensitiveElementList()) {
                sensitiveElementService.add(sensitiveElement);
            }
        }

        mav.addObject("message", "新增调查表成功！");
        mav.setViewName("success");

        return mav;
    }

    @RequestMapping("showQuestionnaire")
    public ModelAndView showQuestionnaire(HttpSession session) {
        ModelAndView mav = new ModelAndView();

        Client client = (Client) session.getAttribute("client");
        mav.addObject("client", client);

        // 获取当前时间
        Date now = new Date();
        String time = new SimpleDateFormat("yyyy-MM-dd").format(now);
        mav.addObject("time", time);
        mav.setViewName("questionnaire1");
        // 创建调查表数据对象
        Questionnaire questionnaire = new Questionnaire();
        questionnaire.setTime(now);
        questionnaire.setClientId(client.getClientId());
        questionnaire.setQuestionnaireId(RandomUtil.getRandomFileName());

        session.setAttribute("questionnaire", questionnaire);
        return mav;
    }

    @RequestMapping("secondQuestionnaire")
    public ModelAndView secondQuestionnaire(HttpSession session, String author) {
        ModelAndView mav = new ModelAndView();

        Questionnaire questionnaire = (Questionnaire) session.getAttribute("questionnaire");
        questionnaire.setAuthor(author);

        mav.setViewName("questionnaire2");
        return mav;
    }

    @RequestMapping("thirdQuestionnaire")
    public ModelAndView thirdQuestionnaire(HttpSession session, RawWastes rawWastes, WasteProcess wasteProcess) {
        ModelAndView mav = new ModelAndView();
        Questionnaire questionnaire = (Questionnaire) session.getAttribute("questionnaire");
        // 设置原材料的编号，随机
        rawWastes.setMaterialId(RandomUtil.getRandomFileName());
        wasteProcess.setProcessId(RandomUtil.getRandomFileName());
        questionnaire.addRawWastes(rawWastes);
        questionnaire.addWasteProcess(wasteProcess);

        // 遍历枚举数据
        List<String> formTypeStrList = new ArrayList<>();
        for (FormType formType : FormType.values()) {
            formTypeStrList.add(formType.getName());
        }
        List<String> smellTypeStrList = new ArrayList<>();
        for (SmellType smellType : SmellType.values()) {
            smellTypeStrList.add(smellType.getName());
        }
        List<String> solubilityStrList = new ArrayList<>();
        for (Solubility solubility : Solubility.values()) {
            solubilityStrList.add(solubility.getName());
        }
        mav.addObject("formTypeStrList", formTypeStrList);
        mav.addObject("smellTypeStrList", smellTypeStrList);
        mav.addObject("solubilityStrList", solubilityStrList);
        mav.setViewName("questionnaire3");
        return mav;
    }

    // TODO: 对于DeriveWastes参数绑定，浮点型数据不填则无法绑定，出现错误400，待完善

    @RequestMapping("forthQuestionnaire")
    public ModelAndView forthQuestionnaire(HttpSession session, DeriveWastes deriveWastes) {
        ModelAndView mav = new ModelAndView();
        Questionnaire questionnaire = (Questionnaire) session.getAttribute("questionnaire");
        deriveWastes.setId(RandomUtil.getRandomFileName());
        // 对于此处更新混合物成分列表的操作，因迭代时删除发生错误故采取不删反增继续事务
        List<MixingElement> newMixingElementList = new ArrayList<>();
        for (MixingElement mixingElement : deriveWastes.getMixingElementList()) {
            if (mixingElement.getName() != "") {
                mixingElement.setId(RandomUtil.getRandomFileName());
                newMixingElementList.add(mixingElement);
            }
        }
        deriveWastes.setMixingElementList(newMixingElementList);
        if (deriveWastes.getSensitiveElementList() != null) {
            for (SensitiveElement sensitiveElement : deriveWastes.getSensitiveElementList()) {
                sensitiveElement.setId(RandomUtil.getRandomFileName());
            }
        }
        questionnaire.addDeriveWastesList(deriveWastes);

        mav.addObject("deriveWastes", deriveWastes);
        mav.setViewName("questionnaire4");
        return mav;
    }

}
