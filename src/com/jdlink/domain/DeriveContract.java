package com.jdlink.domain;

/**
 * Created by matt on 2018/5/17.
 */
public class DeriveContract extends Contract{
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
}
