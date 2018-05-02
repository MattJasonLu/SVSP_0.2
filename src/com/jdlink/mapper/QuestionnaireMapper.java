package com.jdlink.mapper;

import com.jdlink.domain.Questionnaire;

import java.util.List;

/**
 * Created by matt on 2018/4/28.
 */
public interface QuestionnaireMapper {

    List<Questionnaire> list();
    List<Questionnaire> get(String keyword);
    List<Questionnaire> getByClientId(String clientId);
    void add(Questionnaire questionnaire);
    void delete(String questionnaireId);
    void update(Questionnaire questionnaire);

}
