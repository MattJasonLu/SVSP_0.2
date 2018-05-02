package com.jdlink.domain;

/**
 * Created by matt on 2018/4/23.
 */
public enum ApplicationStatus {
    Declared("已申报", 1),
    Undeclared("未申报", 2),;

    private String name;
    private int index;
    ApplicationStatus(String name, int index) {
        this.name = name;
        this.index = index;
    }

    // 普通方法
    public static ApplicationStatus get(int index) {
        for (ApplicationStatus c : ApplicationStatus.values()) {
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
