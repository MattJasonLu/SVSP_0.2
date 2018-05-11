package com.jdlink.controller;

import com.jdlink.domain.*;
import com.jdlink.service.*;
import com.jdlink.util.RandomUtil;
import org.apache.ibatis.annotations.Param;
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
    WasteInclusionTypeService wasteInclusionTypeService;
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

    @RequestMapping("deleteQuestionnaire")
    public ModelAndView deleteQuestionnaire(HttpSession session, String questionnaireId) {
        ModelAndView mav = new ModelAndView();
        try {
            questionnaireService.delete(questionnaireId);
            // 通过session获取到客户编号clientId
            Client client = (Client) session.getAttribute("client");
            List<Questionnaire> questionnaireList = questionnaireService.getByClientId(client.getClientId());
            mav.addObject("questionnaireList", questionnaireList);
            mav.addObject("client", client);
            mav.setViewName("assessment");
        } catch (Exception e) {
            mav.addObject("message", "删除失败！");
            mav.setViewName("fail");
        }
        return mav;
    }

    @RequestMapping("getQuestionnaire")
    public ModelAndView getQuestionnaire(HttpSession session, String questionnaireId) {
        ModelAndView mav = new ModelAndView();
        try {
            // 通过session获取到客户编号clientId
            Client client = (Client) session.getAttribute("client");
            String clientId = client.getClientId();
            List<Questionnaire> questionnaireList = questionnaireService.get(clientId, questionnaireId);
            mav.addObject("questionnaireList", questionnaireList);
            mav.addObject("client", client);
            mav.setViewName("assessment");
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("message", "查询失败！");
            mav.setViewName("fail");
        }
        return mav;
    }

    @RequestMapping("addQuestionnaire")
    public ModelAndView addQuestionnaire(HttpSession session, Questionnaire newQuestionnaire) {
        // TODO: 当前增加调查表仅支持单个材料，多个材料后期完善
        ModelAndView mav = new ModelAndView();
        // 从session中获取
        Questionnaire questionnaire = (Questionnaire) session.getAttribute("questionnaire");
        // 更新数据
        for (int i = 0; i < questionnaire.getDeriveWastesList().size() && i < newQuestionnaire.getDeriveWastesList().size(); i++) {
            DeriveWastes newDeriveWastes = newQuestionnaire.getDeriveWastesList().get(i);
            DeriveWastes deriveWastes = questionnaire.getDeriveWastesList().get(i);
            if (newDeriveWastes.getWasteCharacterList() != null) {
                List<WasteCharacter> wasteCharacterList = new ArrayList<>();
                for (WasteCharacter wasteCharacter : newDeriveWastes.getWasteCharacterList()) {
                    if (wasteCharacter != null) wasteCharacterList.add(wasteCharacter);
                }
                deriveWastes.setWasteCharacterList(wasteCharacterList);
            }
            if (newDeriveWastes.getWasteProtectList() != null) {
                List<WasteProtect> wasteProtectList = new ArrayList<>();
                for (WasteProtect wasteProtect : newDeriveWastes.getWasteProtectList()) {
                    if (wasteProtect != null) wasteProtectList.add(wasteProtect);
                }
                deriveWastes.setWasteProtectList(wasteProtectList);
            }
            deriveWastes.setEyeMeasures(newDeriveWastes.getEyeMeasures());
            deriveWastes.setSkinMeasures(newDeriveWastes.getSkinMeasures());
            deriveWastes.setSwallowMeasures(newDeriveWastes.getSwallowMeasures());
            deriveWastes.setSuctionMeasures(newDeriveWastes.getSuctionMeasures());
            deriveWastes.setPutOutFireMeasures(newDeriveWastes.getPutOutFireMeasures());
            deriveWastes.setLeakMeasures(newDeriveWastes.getLeakMeasures());
        }

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
        mav.addObject("questionnaire", questionnaire);
        mav.addObject("message", "新增调查表成功！");
        mav.setViewName("success");

        return mav;
    }

    @RequestMapping("showQuestionnaire")
    public ModelAndView showQuestionnaire(HttpSession session, Questionnaire newQuestionnaire) {
        ModelAndView mav = new ModelAndView();
        // 第一次进入清空session
        session.removeAttribute("questionnaire");
        // 获取用户
        Client client = (Client) session.getAttribute("client");
        mav.addObject("client", client);
        mav.setViewName("questionnaire1");
        // 如果存在问卷编号
        if (session.getAttribute("questionnaire") == null) {
            Questionnaire questionnaire = new Questionnaire();
            if (newQuestionnaire.getQuestionnaireId() == null) {
                // 创建调查表数据对象
                questionnaire.setTime(new Date()); // 获取当前时间
                questionnaire.setClientId(client.getClientId());
                questionnaire.setQuestionnaireId(RandomUtil.getRandomFileName());
            } else {
                // 取得调查表对象
                questionnaire = questionnaireService.getById(newQuestionnaire.getQuestionnaireId());
                // 装载原材料
                questionnaire.setRawWastesList(rawWastesService.getByQuestionnaireId(newQuestionnaire.getQuestionnaireId()));
                // TODO: 处理枚举列表发生问题，暂时无法处理
                // 装载特别关注物质
//                questionnaire.setWasteInclusionTypeList(wasteInclusionTypeService.getByQuestionnaireId(newQuestionnaire.getQuestionnaireId()));
                // 装载处理流程
                questionnaire.setWasteProcessList(wasteProcessService.getByQuestionnaireId(newQuestionnaire.getQuestionnaireId()));
                // 装载次生危废

            }
            // 添加session
            session.setAttribute("questionnaire", questionnaire);
            mav.addObject("questionnaire", questionnaire);
        } else {
            Questionnaire questionnaire = (Questionnaire) session.getAttribute("questionnaire");

            // 更新页面2传递过来的数据
            // 设置原材料的编号
            for (RawWastes rawWastes : newQuestionnaire.getRawWastesList()) {
                if (rawWastes != null) {
                    rawWastes.setMaterialId(RandomUtil.getRandomFileName());
                }
            }
            // 设置生产工艺流程的编号
            for (WasteProcess wasteProcess : newQuestionnaire.getWasteProcessList()) {
                if (wasteProcess != null) {
                    wasteProcess.setProcessId(RandomUtil.getRandomFileName());
                }
            }
            questionnaire.setRawWastesList(newQuestionnaire.getRawWastesList());
            questionnaire.setWasteProcessList(newQuestionnaire.getWasteProcessList());
            // 特别关注的物质列表
            List<WasteInclusionType> wasteInclusionTypeList = new ArrayList<>();
            if (newQuestionnaire.getWasteInclusionTypeList() != null && newQuestionnaire.getWasteInclusionTypeList().size() > 0) {
                for (WasteInclusionType wasteInclusionType : newQuestionnaire.getWasteInclusionTypeList()) {
                    if (wasteInclusionType != null) wasteInclusionTypeList.add(wasteInclusionType);
                }
                // 更新
                questionnaire.setWasteInclusionTypeList(wasteInclusionTypeList);
            }
            mav.addObject("questionnaire", questionnaire);
        }
        return mav;
    }

    // 记录清空
    @RequestMapping("showAdminQuestionnaire")
    public ModelAndView showAdminQuestionnaire() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("questionnaire1");
        return mav;
    }

    @RequestMapping("firstQuestionnaire")
    public ModelAndView firstQuestionnaire(HttpSession session, Questionnaire newQuestionnaire) {
        ModelAndView mav = new ModelAndView();
        // 获取用户
        Client client = (Client) session.getAttribute("client");
        mav.addObject("client", client);
        mav.setViewName("questionnaire1");
        // 如果存在问卷编号
        if (session.getAttribute("questionnaire") == null) {
            Questionnaire questionnaire = new Questionnaire();
            if (newQuestionnaire.getQuestionnaireId() == null) {
                // 创建调查表数据对象
                questionnaire.setTime(new Date()); // 获取当前时间
                questionnaire.setClientId(client.getClientId());
                questionnaire.setQuestionnaireId(RandomUtil.getRandomFileName());
            } else {
                List<Questionnaire> questionnaireList = questionnaireService.get(client.getClientId(), newQuestionnaire.getQuestionnaireId());
                questionnaire = questionnaireList.get(0);
            }

            session.setAttribute("questionnaire", questionnaire);
        } else {
            Questionnaire questionnaire = (Questionnaire) session.getAttribute("questionnaire");

            // 更新页面2传递过来的数据
            // 设置原材料的编号
            for (RawWastes rawWastes : newQuestionnaire.getRawWastesList()) {
                if (rawWastes != null) {
                    rawWastes.setMaterialId(RandomUtil.getRandomFileName());
                }
            }
            // 设置生产工艺流程的编号
            for (WasteProcess wasteProcess : newQuestionnaire.getWasteProcessList()) {
                if (wasteProcess != null) {
                    wasteProcess.setProcessId(RandomUtil.getRandomFileName());
                }
            }
            questionnaire.setRawWastesList(newQuestionnaire.getRawWastesList());
            questionnaire.setWasteProcessList(newQuestionnaire.getWasteProcessList());
            // 特别关注的物质列表
            List<WasteInclusionType> wasteInclusionTypeList = new ArrayList<>();
            if (newQuestionnaire.getWasteInclusionTypeList() != null && newQuestionnaire.getWasteInclusionTypeList().size() > 0) {
                for (WasteInclusionType wasteInclusionType : newQuestionnaire.getWasteInclusionTypeList()) {
                    if (wasteInclusionType != null) wasteInclusionTypeList.add(wasteInclusionType);
                }
                // 更新
                questionnaire.setWasteInclusionTypeList(wasteInclusionTypeList);
            }

            mav.addObject("questionnaire", questionnaire);
        }
        return mav;
    }

    @RequestMapping("secondQuestionnaire")
    public ModelAndView secondQuestionnaire(HttpSession session, Questionnaire newQuestionnaire) {
        ModelAndView mav = new ModelAndView();
        // 获取调查表对象
        Questionnaire questionnaire = (Questionnaire) session.getAttribute("questionnaire");

        // 更新填表人
        if (newQuestionnaire.getAuthor() != null) {
            questionnaire.setAuthor(newQuestionnaire.getAuthor());
        }

        // 更新页面3过来的数据
        for (int i = 0; i < newQuestionnaire.getDeriveWastesList().size(); i++) {
            if (questionnaire.getDeriveWastesList() == null || questionnaire.getDeriveWastesList().size() == 0) {
                questionnaire.setDeriveWastesList(newQuestionnaire.getDeriveWastesList());
                break;
            }
            DeriveWastes newDeriveWastes = newQuestionnaire.getDeriveWastesList().get(i);
            DeriveWastes deriveWastes = questionnaire.getDeriveWastesList().get(i);

            deriveWastes.setName(newDeriveWastes.getName());
            deriveWastes.setCode(newDeriveWastes.getCode());
            deriveWastes.setFormType(newDeriveWastes.getFormType());
            deriveWastes.setFormTypeDetail(newDeriveWastes.getFormTypeDetail());
            deriveWastes.setSmellType(newDeriveWastes.getSmellType());
            deriveWastes.setSmellTypeDetail(newDeriveWastes.getSmellTypeDetail());
            deriveWastes.setSolubility(newDeriveWastes.getSolubility());
            deriveWastes.setSolubilityDetail(newDeriveWastes.getSolubilityDetail());
            deriveWastes.setIsLowTemp(newDeriveWastes.getIsLowTemp());
            deriveWastes.setLowTemp(newDeriveWastes.getLowTemp());
            deriveWastes.setSolubleTemp(newDeriveWastes.getSolubleTemp());
            deriveWastes.setIsMixture(newDeriveWastes.getIsMixture());
            deriveWastes.setMixingElementList(newDeriveWastes.getMixingElementList());
            deriveWastes.setSensitiveElementList(newDeriveWastes.getSensitiveElementList());
        }
        mav.addObject("questionnaire", questionnaire);
        mav.setViewName("questionnaire2");
        return mav;
    }

    @RequestMapping("thirdQuestionnaire")
    public ModelAndView thirdQuestionnaire(HttpSession session, Questionnaire newQuestionnaire) {
        ModelAndView mav = new ModelAndView();
        Questionnaire questionnaire = (Questionnaire) session.getAttribute("questionnaire");
        // 更新数据
        for (int i = 0; i < newQuestionnaire.getDeriveWastesList().size(); i++) {
            if (questionnaire.getDeriveWastesList().size() == 0) {
                questionnaire.setDeriveWastesList(newQuestionnaire.getDeriveWastesList());
                break;
            }
            DeriveWastes newDeriveWastes = newQuestionnaire.getDeriveWastesList().get(i);
            DeriveWastes deriveWastes = questionnaire.getDeriveWastesList().get(i);
            if (newDeriveWastes.getWasteCharacterList() != null) {
                List<WasteCharacter> wasteCharacterList = new ArrayList<>();
                for (WasteCharacter wasteCharacter : newDeriveWastes.getWasteCharacterList()) {
                    if (wasteCharacter != null) wasteCharacterList.add(wasteCharacter);
                }
                deriveWastes.setWasteCharacterList(wasteCharacterList);
            }
            if (newDeriveWastes.getWasteProtectList() != null) {
                List<WasteProtect> wasteProtectList = new ArrayList<>();
                for (WasteProtect wasteProtect : newDeriveWastes.getWasteProtectList()) {
                    if (wasteProtect != null) wasteProtectList.add(wasteProtect);
                }

                deriveWastes.setWasteProtectList(wasteProtectList);
            }
            deriveWastes.setEyeMeasures(newDeriveWastes.getEyeMeasures());
            deriveWastes.setSkinMeasures(newDeriveWastes.getSkinMeasures());
            deriveWastes.setSwallowMeasures(newDeriveWastes.getSwallowMeasures());
            deriveWastes.setSuctionMeasures(newDeriveWastes.getSuctionMeasures());
            deriveWastes.setPutOutFireMeasures(newDeriveWastes.getPutOutFireMeasures());
            deriveWastes.setLeakMeasures(newDeriveWastes.getLeakMeasures());
        }
        // 设置原材料的编号，随机
        if (newQuestionnaire.getRawWastesList().size() > 0) {
            for (RawWastes rawWastes : newQuestionnaire.getRawWastesList()) {
                if (rawWastes != null) {
                    rawWastes.setMaterialId(RandomUtil.getRandomFileName());
                }
            }
            questionnaire.setRawWastesList(newQuestionnaire.getRawWastesList());
        }
        if (newQuestionnaire.getWasteProcessList().size() > 0) {
            for (WasteProcess wasteProcess : newQuestionnaire.getWasteProcessList()) {
                if (wasteProcess != null) {
                    wasteProcess.setProcessId(RandomUtil.getRandomFileName());
                }
            }
            questionnaire.setWasteProcessList(newQuestionnaire.getWasteProcessList());
        }

        // 特别关注的物质列表
        List<WasteInclusionType> wasteInclusionTypeList = new ArrayList<>();
        if (newQuestionnaire.getWasteInclusionTypeList() != null && newQuestionnaire.getWasteInclusionTypeList().size() > 0) {
            for (WasteInclusionType wasteInclusionType : newQuestionnaire.getWasteInclusionTypeList()) {
                if (wasteInclusionType != null) wasteInclusionTypeList.add(wasteInclusionType);
            }
            // 更新
            questionnaire.setWasteInclusionTypeList(wasteInclusionTypeList);
        }

        // 遍历枚举数据，显示下拉框
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

        if (questionnaire.getDeriveWastesList().size() > 0) {

            mav.addObject("deriveWastesList", questionnaire.getDeriveWastesList());
        }
        mav.addObject("questionnaire", questionnaire);
        mav.setViewName("questionnaire3");
        return mav;
    }

    // TODO: 对于DeriveWastes参数绑定，浮点型数据不填则无法绑定，出现错误400，待完善

    @RequestMapping("forthQuestionnaire")
    public ModelAndView forthQuestionnaire(HttpSession session, Questionnaire newQuestionnaire) {
        ModelAndView mav = new ModelAndView();
        Questionnaire questionnaire = (Questionnaire) session.getAttribute("questionnaire");
        for (DeriveWastes deriveWastes : newQuestionnaire.getDeriveWastesList()) {
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
        }
        // 更新数据
        for (int i = 0; i < newQuestionnaire.getDeriveWastesList().size(); i++) {
            if (questionnaire.getDeriveWastesList().size() == 0) {
                questionnaire.setDeriveWastesList(newQuestionnaire.getDeriveWastesList());
                break;
            }
            DeriveWastes newDeriveWastes = newQuestionnaire.getDeriveWastesList().get(i);
            DeriveWastes deriveWastes = questionnaire.getDeriveWastesList().get(i);

            deriveWastes.setName(newDeriveWastes.getName());
            deriveWastes.setCode(newDeriveWastes.getCode());
            deriveWastes.setFormType(newDeriveWastes.getFormType());
            deriveWastes.setFormTypeDetail(newDeriveWastes.getFormTypeDetail());
            deriveWastes.setSmellType(newDeriveWastes.getSmellType());
            deriveWastes.setSmellTypeDetail(newDeriveWastes.getSmellTypeDetail());
            deriveWastes.setSolubility(newDeriveWastes.getSolubility());
            deriveWastes.setSolubilityDetail(newDeriveWastes.getSolubilityDetail());
            deriveWastes.setIsLowTemp(newDeriveWastes.getIsLowTemp());
            deriveWastes.setLowTemp(newDeriveWastes.getLowTemp());
            deriveWastes.setSolubleTemp(newDeriveWastes.getSolubleTemp());
            deriveWastes.setIsMixture(newDeriveWastes.getIsMixture());
            deriveWastes.setMixingElementList(newDeriveWastes.getMixingElementList());
            deriveWastes.setSensitiveElementList(newDeriveWastes.getSensitiveElementList());
        }

        mav.addObject("deriveWastesList", questionnaire.getDeriveWastesList());
        mav.addObject("questionnaire", questionnaire);
        mav.setViewName("questionnaire4");
        return mav;
    }

    @RequestMapping("listAllQuestionnaire")
    public ModelAndView listAllQuestionnaire(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        List<Questionnaire> questionnaireList = questionnaireService.list();
        List<Client> clientList = new ArrayList<>();
        for (Questionnaire questionnaire : questionnaireList) {
            Client client = clientService.getByClientId(questionnaire.getClientId());
            clientList.add(client);
        }
        mav.addObject("clientList", clientList);
        mav.addObject("questionnaireList", questionnaireList);
        mav.setViewName("assessmentAdmin");
        return mav;
    }

    @RequestMapping("signInQuestionnaire")
    public ModelAndView signInQuestionnaire(String questionnaireId) {
        ModelAndView mav = new ModelAndView();
        try {
            questionnaireService.signIn(questionnaireId);
            mav.addObject("message", "签收成功!");
            mav.setViewName("success");
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("message", "签收失败!");
            mav.setViewName("fail");
        }
        return mav;
    }

    @RequestMapping("backQuestionnaire")
    public ModelAndView backQuestionnaire(String questionnaireId) {
        ModelAndView mav = new ModelAndView();
        try {
            questionnaireService.back(questionnaireId);
            mav.addObject("message", "退回成功!");
            mav.setViewName("success");
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("message", "退回失败!");
            mav.setViewName("fail");
        }
        return mav;
    }

}
