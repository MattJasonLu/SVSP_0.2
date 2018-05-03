package com.jdlink.domain;

/**
 * Created by matt on 2018/5/2.
 */
public class SensitiveElement {
    /**
     * 化学物质类型
     */
    private ChemicalType chemicalType;
    /**
     * 是否有机
     */
    private boolean isOrganic;

    public ChemicalType getChemicalType() {
        return chemicalType;
    }

    public void setChemicalType(ChemicalType chemicalType) {
        this.chemicalType = chemicalType;
    }

    public boolean isOrganic() {
        return isOrganic;
    }

    public void setOrganic(boolean organic) {
        isOrganic = organic;
    }
}
