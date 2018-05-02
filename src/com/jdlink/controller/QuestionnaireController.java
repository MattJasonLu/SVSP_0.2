package com.jdlink.controller;

import com.jdlink.domain.*;
import com.jdlink.service.ClientService;
import com.jdlink.service.QuestionnaireService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by matt on 2018/4/28.
 */
@Controller
public class QuestionnaireController {
    @Autowired
    QuestionnaireService questionnaireService;

    @Autowired
    ClientService clientService;

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
    public ModelAndView addQuestionnaire(Questionnaire questionnaire) {
        ModelAndView mav = new ModelAndView();

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
        questionnaire.addRawWastes(rawWastes);
        questionnaire.addWasteProcess(wasteProcess);
        mav.setViewName("questionnaire3");
        return mav;
    }

    @RequestMapping("forthQuestionnaire")
    public ModelAndView forthQuestionnaire(HttpSession session, DeriveWastes deriveWastes) {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("questionnaire4");
        return mav;
    }

}
