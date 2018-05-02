package com.jdlink.service.impl;

import com.jdlink.domain.Questionnaire;
import com.jdlink.mapper.QuestionnaireMapper;
import com.jdlink.service.QuestionnaireService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by matt on 2018/4/28.
 */
@Service
public class QuestionnaireServiceImpl implements QuestionnaireService {
    @Autowired
    QuestionnaireMapper questionnaireMapper;

    @Override
    public List<Questionnaire> list() {
        return questionnaireMapper.list();
    }

    @Override
    public List<Questionnaire> get(String keyword) {
        return questionnaireMapper.get(keyword);
    }

    @Override
    public List<Questionnaire> getByClientId(String clientId) {
        return questionnaireMapper.getByClientId(clientId);
    }

    @Override
    public void add(Questionnaire questionnaire) {
        questionnaireMapper.add(questionnaire);
    }

    @Override
    public void delete(String questionnaireId) {
        questionnaireMapper.delete(questionnaireId);
    }

    @Override
    public void update(Questionnaire questionnaire) {
        questionnaireMapper.update(questionnaire);
    }
}
