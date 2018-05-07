package com.jdlink.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by matt on 2018/4/28.
 * 调查问卷
 */
public class Questionnaire {
    /**
     * 调查问卷编号
     */
    private String questionnaireId;
    /**
     * 客户编号
     */
    private String clientId;
    /**
     * 评估表编号
     */
    private String evaluationnaireId;
    /**
     * 填写人
     */
    private String author;
    /**
     * 原始危废
     */
    private List<RawWastes> rawWastesList = new ArrayList<>();
    /**
     * 特别关注的物质
     */
    private List<WasteInclusionType> wasteInclusionTypeList;
    /**
     * 处理流程
     */
    private List<WasteProcess> wasteProcessList = new ArrayList<>();
    /**
     * 次生危废
     */
    private List<DeriveWastes> deriveWastesList = new ArrayList<>();
    /**
     * 填写时间
     */
    private Date time;

    public String getQuestionnaireId() {
        return questionnaireId;
    }

    public void setQuestionnaireId(String questionnaireId) {
        this.questionnaireId = questionnaireId;
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public String getEvaluationnaireId() {
        return evaluationnaireId;
    }

    public void setEvaluationnaireId(String evaluationnaireId) {
        this.evaluationnaireId = evaluationnaireId;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public List<RawWastes> getRawWastesList() {
        return rawWastesList;
    }

    public void setRawWastesList(List<RawWastes> rawWastesList) {
        this.rawWastesList = rawWastesList;
    }

    public void addRawWastes(RawWastes rawWastes) {
        rawWastesList.add(rawWastes);
    }

    public List<WasteProcess> getWasteProcessList() {
        return wasteProcessList;
    }

    public void setWasteProcessList(List<WasteProcess> wasteProcessList) {
        this.wasteProcessList = wasteProcessList;
    }

    public void addWasteProcess(WasteProcess wasteProcess) {
        wasteProcessList.add(wasteProcess);
    }

    public List<DeriveWastes> getDeriveWastesList() {
        return deriveWastesList;
    }

    public void setDeriveWastesList(List<DeriveWastes> deriveWastesList) {
        this.deriveWastesList = deriveWastesList;
    }

    public void addDeriveWastesList(DeriveWastes deriveWastes) {
        deriveWastesList.add(deriveWastes);
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public List<WasteInclusionType> getWasteInclusionTypeList() {
        return wasteInclusionTypeList;
    }

    public void setWasteInclusionTypeList(List<WasteInclusionType> wasteInclusionTypeList) {
        this.wasteInclusionTypeList = wasteInclusionTypeList;
    }

    @Override
    public String toString() {
        return "Questionnaire{" +
                "questionnaireId='" + questionnaireId + '\'' +
                ", clientId='" + clientId + '\'' +
                ", evaluationnaireId='" + evaluationnaireId + '\'' +
                ", author='" + author + '\'' +
                ", rawWastesList=" + rawWastesList +
                ", wasteInclusionTypeList=" + wasteInclusionTypeList +
                ", wasteProcessList=" + wasteProcessList +
                ", deriveWastesList=" + deriveWastesList +
                ", time=" + time +
                '}';
    }
}
