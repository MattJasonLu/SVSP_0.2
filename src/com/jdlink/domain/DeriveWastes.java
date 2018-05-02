package com.jdlink.domain;

import java.util.List;

/**
 * Created by matt on 2018/5/2.
 */
public class DeriveWastes {
    /**
     * 序号
     */
    private String id;
    /**
     * 危废名称
     */
    private String name;
    /**
     * 危废代码
     */
    private String code;
    /**
     * 物质形态
     */
    private FormType formType;
    /**
     * 物质形态说明
     */
    private String formTypeDetail;
    /**
     * 物质气味
     */
    private SmellType smellType;
    /**
     * 物质气味说明
     */
    private String smellTypeDetail;
    /**
     * 可溶性
     */
    private Solubility solubility;
    /**
     * 可溶性说明
     */
    private String solubilityDetail;
    /**
     * 是否为低温
     */
    private boolean isLowTemp;
    /**
     * 低温度
     */
    private float lowTemp;
    /**
     * 可溶温度
     */
    private float solubleTemp;
    /**
     * 是否为混合多项物
     */
    private boolean isMixture;
    /**
     * 混合物成分列表
     */
    private List<MixingElement> mixingElementList;
    /**
     * 敏感成分列表
     */
    private List<SensitiveElement> sensitiveElementList;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public FormType getFormType() {
        return formType;
    }

    public void setFormType(FormType formType) {
        this.formType = formType;
    }

    public String getFormTypeDetail() {
        return formTypeDetail;
    }

    public void setFormTypeDetail(String formTypeDetail) {
        this.formTypeDetail = formTypeDetail;
    }

    public SmellType getSmellType() {
        return smellType;
    }

    public void setSmellType(SmellType smellType) {
        this.smellType = smellType;
    }

    public String getSmellTypeDetail() {
        return smellTypeDetail;
    }

    public void setSmellTypeDetail(String smellTypeDetail) {
        this.smellTypeDetail = smellTypeDetail;
    }

    public Solubility getSolubility() {
        return solubility;
    }

    public void setSolubility(Solubility solubility) {
        this.solubility = solubility;
    }

    public String getSolubilityDetail() {
        return solubilityDetail;
    }

    public void setSolubilityDetail(String solubilityDetail) {
        this.solubilityDetail = solubilityDetail;
    }

    public boolean isLowTemp() {
        return isLowTemp;
    }

    public void setLowTemp(boolean lowTemp) {
        isLowTemp = lowTemp;
    }

    public float getLowTemp() {
        return lowTemp;
    }

    public void setLowTemp(float lowTemp) {
        this.lowTemp = lowTemp;
    }

    public float getSolubleTemp() {
        return solubleTemp;
    }

    public void setSolubleTemp(float solubleTemp) {
        this.solubleTemp = solubleTemp;
    }

    public boolean isMixture() {
        return isMixture;
    }

    public void setMixture(boolean mixture) {
        isMixture = mixture;
    }

    public List<MixingElement> getMixingElementList() {
        return mixingElementList;
    }

    public void setMixingElementList(List<MixingElement> mixingElementList) {
        this.mixingElementList = mixingElementList;
    }

    public List<SensitiveElement> getSensitiveElementList() {
        return sensitiveElementList;
    }

    public void setSensitiveElementList(List<SensitiveElement> sensitiveElementList) {
        this.sensitiveElementList = sensitiveElementList;
    }

    @Override
    public String toString() {
        return "DeriveWastes{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", code='" + code + '\'' +
                ", formType=" + formType +
                ", formTypeDetail='" + formTypeDetail + '\'' +
                ", smellType=" + smellType +
                ", smellTypeDetail='" + smellTypeDetail + '\'' +
                ", solubility=" + solubility +
                ", solubilityDetail='" + solubilityDetail + '\'' +
                ", isLowTemp=" + isLowTemp +
                ", lowTemp=" + lowTemp +
                ", solubleTemp=" + solubleTemp +
                ", isMixture=" + isMixture +
                ", mixingElementList=" + mixingElementList +
                ", sensitiveElementList=" + sensitiveElementList +
                '}';
    }
}
