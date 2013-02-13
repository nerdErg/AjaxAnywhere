package com.nerderg.ajaxanywhere.web.form;

import com.nerderg.ajaxanywhere.service.DataService;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.SortedSet;

/**
 * @author Angel Ruiz
 * Date: 9/02/13
 */
public class CountryForm implements Serializable {

    private String continentCode;

    private String countryCode;

    private SortedSet<Map.Entry<String,String>> continentsSet;

    private SortedSet<Map.Entry<String,String>> countriesSet;

    private String capital;

    private String countryName;

    public CountryForm() {
        continentsSet = DataService.getContinentsSet();
    }

    public String getContinentCode() {
        return continentCode;
    }

    public void setContinentCode(String continentCode) {
        this.continentCode = continentCode;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    public SortedSet<Map.Entry<String, String>> getContinentsSet() {
        return continentsSet;
    }

    public void setContinentsSet(SortedSet<Map.Entry<String, String>> continentsSet) {
        this.continentsSet = continentsSet;
    }

    public SortedSet<Map.Entry<String, String>> getCountriesSet() {
        return countriesSet;
    }

    public void setCountriesSet(SortedSet<Map.Entry<String, String>> countriesSet) {
        this.countriesSet = countriesSet;
    }

    public String getCapital() {
        return capital;
    }

    public void setCapital(String capital) {
        this.capital = capital;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }
}
