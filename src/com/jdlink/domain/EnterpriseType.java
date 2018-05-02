package com.jdlink.domain;

/**
 * Created by matt on 2018/4/23.
 * 企业类型
 */
public enum EnterpriseType {
    StateOwnedEnterprises("国有企业", 1),
    CollectiveEnterprise("集体企业", 2),
    JointStockByStateOwnedEnterprises("国有企业改组的股份合作企业", 3),
    JointStockByCollectiveEnterprise("集体企业改组的股份合作企业", 4),
;
    private String name;
    private int index;
    EnterpriseType(String name, int index) {
        this.name = name;
        this.index = index;
    }

    // 普通方法
    public static EnterpriseType get(int index) {
        for (EnterpriseType c : EnterpriseType.values()) {
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
