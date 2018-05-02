package com.jdlink.domain;

/**
 * Created by matt on 2018/4/23.
 */
public enum OperationType {
    WasteAndClinical("利用处置危险废物及医疗废物", 1),
    CollectOnly("只从事收集活动", 2),
    WasteOnly("只利用处置危险废物", 3),
    ClinicalOnly("只处置医疗废物", 4),
    ;

    private String name;
    private int index;
    OperationType(String name, int index) {
        this.name = name;
        this.index = index;
    }

    // 普通方法
    public static OperationType get(int index) {
        for (OperationType c : OperationType.values()) {
            if (c.getIndex() == index) {
                return c;
            }
        }
        return null;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }
}
