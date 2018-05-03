package com.jdlink.domain;

/**
 * Created by matt on 2018/5/2.
 * 混合物成分
 */
public class MixingElement {
    /**
     * 最低预估含量(%)
     */
    private float minimum;
    /**
     * 平均预估含量(%)
     */
    private float average;
    /**
     * 最高预估含量(%)
     */
    private float maximum;

    public float getMinimum() {
        return minimum;
    }

    public void setMinimum(float minimum) {
        this.minimum = minimum;
    }

    public float getAverage() {
        return average;
    }

    public void setAverage(float average) {
        this.average = average;
    }

    public float getMaximum() {
        return maximum;
    }

    public void setMaximum(float maximum) {
        this.maximum = maximum;
    }
}