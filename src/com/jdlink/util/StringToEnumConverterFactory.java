package com.jdlink.util;

import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.converter.ConverterFactory;

/**
 * Created by matt on 2018/4/24.
 */
final class StringToEnumConverterFactory implements
        ConverterFactory<String, Enum> {

    public <T extends Enum> Converter<String, T> getConverter(
            Class<T> targetType) {
        System.out.println("done");
        return new StringToEnum(targetType);
    }

    private class StringToEnum<T extends Enum> implements Converter<String, T> {

        private final Class<T> enumType;

        public StringToEnum(Class<T> enumType) {
            this.enumType = enumType;
        }

        public T convert(String source) {
            if (source.length() == 0) {
                return null;
            }

            return (T) Enum.valueOf(this.enumType, source.trim());
        }
    }

}
