package com.nerderg.ajaxanywhere.service;

import org.apache.commons.lang3.StringUtils;
import org.springframework.core.io.ClassPathResource;

import java.io.FileReader;
import java.util.*;

/**
 * @author Angel Ruiz
 * Date: 10/02/13
 */
public class DataService {

    private static String dataLocationPath = "data/";

    private static Map<String, String> continentsMap;
    private static Map<String, String> countryCodesContinentMap;
    private static Map<String, String> countryCodesCountryNameMap;
    private static Map<String, String> countryCodesCapitalNameMap;

    private static <K,V extends Comparable<? super V>>
    SortedSet<Map.Entry<K,V>> entriesSortedByValues(Map<K,V> map) {
        SortedSet<Map.Entry<K,V>> sortedEntries = new TreeSet<Map.Entry<K,V>>(
                new Comparator<Map.Entry<K,V>>() {
                    @Override public int compare(Map.Entry<K,V> e1, Map.Entry<K,V> e2) {
                        return e1.getValue().compareTo(e2.getValue());
                    }
                }
        );
        sortedEntries.addAll(map.entrySet());
        return sortedEntries;
    }

    static {
        continentsMap = load("continents.properties");
        countryCodesContinentMap = load("country-code-2-continent.properties");
        countryCodesCountryNameMap = load("country-code-2-country-name.properties");
        countryCodesCapitalNameMap = load("country-code-2-capital.properties");
    }

    /**
     * TODO
     * @param filename
     * @return
     */
    private static Map<String, String> load(String filename) {

        Map<String, String> myMap = new TreeMap<String, String>();
        try {
            ClassPathResource cpr = new ClassPathResource(dataLocationPath + filename);
            FileReader reader = new FileReader(cpr.getFile());
            Properties properties = new Properties();
            properties.load(reader);
            reader.close();
            for (Object key : properties.keySet()) {
                myMap.put(key.toString(), properties.get(key).toString());
            }
        } catch (Exception e){
            throw new RuntimeException(e);
        }

        return myMap;
    }

    /**
     * TODO
     * @return
     */
    public static SortedSet<Map.Entry<String,String>> getContinentsSet() {
        return entriesSortedByValues(continentsMap);
    }

    /**
     * TODO
     * @param continent
     * @return
     */
    public static SortedSet<Map.Entry<String,String>> getCountriesByContinent(String continent) {
        Map<String,String> result = new TreeMap<String, String>();
        for (String key: countryCodesContinentMap.keySet()) {
            String value = countryCodesContinentMap.get(key);
            if (StringUtils.isNotBlank(continent) && value.equals(continent)) {
                result.put(key, countryCodesCountryNameMap.get(key));
            } else if (StringUtils.isBlank(continent)) {
                result.put(key, countryCodesCountryNameMap.get(key));
            }
        }
        return entriesSortedByValues(result);
    }

    /**
     * TODO
     * @param countryCode
     * @return
     */
    public static String getCapitalByCountryCode(String countryCode) {
        return countryCodesCapitalNameMap.get(countryCode);
    }

    /**
     * TODO
     * @param countryCode
     * @param continent
     * @return
     */
    public static boolean isCountryFromContinent(String countryCode, String continent) {
        boolean result = false;
        if (StringUtils.isNotBlank(countryCode) && StringUtils.isNotBlank(continent)) {
            result = countryCodesContinentMap.get(countryCode).equals(continent);
        }
        return result;
    }

    /**
     *
     * @param countryCode
     * @return
     */
    public static String getCountryName (String countryCode) {
       return countryCodesCountryNameMap.get(countryCode);
    }
}
