package com.jdlink.controller;

import com.jdlink.domain.*;
import com.jdlink.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by matt on 2018/5/17.
 */
@Controller
public class SupplierController {
    @Autowired
    SupplierService supplierService;

    @RequestMapping("listSupplier")
    public ModelAndView listSupplier() {
        ModelAndView mav = new ModelAndView();
        List<Supplier> supplierList = supplierService.list();
        mav.addObject("supplierList", supplierList);
        mav.setViewName("supplier");
        return mav;
    }

    @RequestMapping("showSupplier")
    public ModelAndView showSupplier(String supplierId) {
        ModelAndView mav = new ModelAndView();
        if (supplierId != null) {
            Supplier supplier = supplierService.getBySupplierId(supplierId);
            mav.addObject("supplier", supplier);
        }
        // 获取枚举列表
        // 企业类型
        List<String> enterpriseTypeStrList = new ArrayList<>();
        for (EnterpriseType enterpriseType : EnterpriseType.values()) {
            enterpriseTypeStrList.add(enterpriseType.getName());
        }
        // 经营方式
        List<String> operationModeStrList = new ArrayList<>();
        for (OperationMode operationMode : OperationMode.values()) {
            operationModeStrList.add(operationMode.getName());
        }
        // 经营单位类别
        List<String> operationTypeStrList = new ArrayList<>();
        for (OperationType operationType : OperationType.values()) {
            operationTypeStrList.add(operationType.getName());
        }
        // 应急预案
        List<String> contingencyPlanStrList = new ArrayList<>();
        for (ContingencyPlan contingencyPlan : ContingencyPlan.values()) {
            contingencyPlanStrList.add(contingencyPlan.getName());
        }
        // 危废记录
        List<String> operationRecordStrList = new ArrayList<>();
        for (OperationRecord operationRecord : OperationRecord.values()) {
            operationRecordStrList.add(operationRecord.getName());
        }
        // 申报状态
        List<String> applicationStatusStrList = new ArrayList<>();
        for (ApplicationStatus applicationStatus : ApplicationStatus.values()) {
            applicationStatusStrList.add(applicationStatus.getName());
        }
        // 供应商类型
        List<String> supplierTypeStrList = new ArrayList<>();
        for (SupplierType supplierType : SupplierType.values()) {
            supplierTypeStrList.add(supplierType.getName());
        }

        mav.addObject("operationModeStrList", operationModeStrList);
        mav.addObject("enterpriseTypeStrList", enterpriseTypeStrList);
        mav.addObject("operationTypeStrList", operationTypeStrList);
        mav.addObject("contingencyPlanStrList", contingencyPlanStrList);
        mav.addObject("operationRecordStrList", operationRecordStrList);
        mav.addObject("applicationStatusStrList", applicationStatusStrList);
        mav.addObject("supplierTypeStrList", supplierTypeStrList);
        mav.setViewName("showSupplier");
        return mav;
    }

    @RequestMapping("addSupplier")
    public ModelAndView addSupplier(Supplier supplier) {
        ModelAndView mav = new ModelAndView();
        supplier.setCheckState(CheckState.Examining);
        supplierService.add(supplier);

        return listSupplier();
    }

    @RequestMapping("deleteSupplier")
    public ModelAndView deleteSupplier(String supplierId) {
        ModelAndView mav = new ModelAndView();

        supplierService.delete(supplierId);

        return listSupplier();
    }

    @RequestMapping("updateSupplier")
    public ModelAndView updateSupplier(Supplier supplier) {
        ModelAndView mav = new ModelAndView();

        supplierService.update(supplier);

        return listSupplier();
    }

    @RequestMapping("getSupplier")
    public ModelAndView getSupplier(String keyword) {
        ModelAndView mav = new ModelAndView();

        return mav;
    }
}
