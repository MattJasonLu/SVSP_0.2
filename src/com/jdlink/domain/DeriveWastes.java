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

}
