package com.jdlink.domain;

/**
 * Created by matt on 2018/4/23.
 */
public enum OperationMode {
    Comprehensive("综合", 1),
    Collect("收集", 2),;

    private String name;
    private int index;
    OperationMode(String name, int index) {
        this.name = name;
        this.index = index;
    }

    // 普通方法
    public static OperationMode get(int index) {
        for (OperationMode c : OperationMode.values()) {
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
