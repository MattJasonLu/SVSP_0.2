package com.jdlink.domain;

import java.util.Date;

/**
 * Created by matt on 2018/5/17.
 */
public class LogisticsContract extends Contract{
    /**
     * 开户行账号
     */
    private String bankAccount;
    /**
     * 代理人
     */
    private String agentName;
    /**
     * 开票税率1
     */
    private TaxRate firstTaxRate;
    /**
     * 开票税率2
     */
    private TaxRate secondTaxRate;
    /**
     * 资质
     */
    private String qualification;
    /**
     * 资质开始时间
     */
    private Date qualificationBeginDate;
    /**
     * 资质结束时间
     */
    private Date qualificationEndDate;

    public String getBankAccount() {
        return bankAccount;
    }

    public void setBankAccount(String bankAccount) {
        this.bankAccount = bankAccount;
    }

    public String getAgentName() {
        return agentName;
    }

    public void setAgentName(String agentName) {
        this.agentName = agentName;
    }

    public TaxRate getFirstTaxRate() {
        return firstTaxRate;
    }

    public void setFirstTaxRate(TaxRate firstTaxRate) {
        this.firstTaxRate = firstTaxRate;
    }

    public TaxRate getSecondTaxRate() {
        return secondTaxRate;
    }

    public void setSecondTaxRate(TaxRate secondTaxRate) {
        this.secondTaxRate = secondTaxRate;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public Date getQualificationBeginDate() {
        return qualificationBeginDate;
    }

    public void setQualificationBeginDate(Date qualificationBeginDate) {
        this.qualificationBeginDate = qualificationBeginDate;
    }

    public Date getQualificationEndDate() {
        return qualificationEndDate;
    }

    public void setQualificationEndDate(Date qualificationEndDate) {
        this.qualificationEndDate = qualificationEndDate;
    }
}
