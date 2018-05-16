package com.jdlink.domain;

/**
 * Created by matt on 2018/5/16.
 */
public enum CheckState {
    Examining("审批中", 1),
    ToSubmit("待提交", 2),
    Finished("已完成", 3),
    ;

    private String name;
    private int index;
    CheckState(String name, int index) {
        this.name = name;
        this.index = index;
    }

    // 普通方法
    public static CheckState get(int index) {
        for (CheckState c : CheckState.values()) {
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
