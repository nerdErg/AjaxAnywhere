package com.nerderg.ajaxanywhere.web.controller;

import com.nerderg.ajaxanywhere.service.DataService;
import com.nerderg.ajaxanywhere.web.form.CountryForm;
import com.nerderg.ajaxanywhere.web.util.Routing;
import com.nerderg.ajaxanywhere.web.util.WebUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.StringWriter;

/**
 * @author Angel Ruiz (aruizca@gmail.com)
 */
@Controller
public class ExamplesController {

    @Autowired
    ServletContext servletContext;

    @RequestMapping("/examples")
    public String load(@ModelAttribute("countryForm") CountryForm countryForm) {
        setupForm(countryForm);
        return Routing.Page.EXAMPLES;
    }

    /**
     * TODO
     * @param countryForm
     */
    private void setupForm(CountryForm countryForm) {
        if (StringUtils.isNotBlank(countryForm.getContinentCode())) {
            countryForm.setCountriesSet(DataService.getCountriesByContinent(countryForm.getContinentCode()));
        }

        if (!DataService.isCountryFromContinent(countryForm.getCountryCode(), countryForm.getContinentCode())) {
            countryForm.setCountryCode(null);
        }

        if (StringUtils.isNotBlank(countryForm.getCountryCode())) {
                countryForm.setCapital(DataService.getCapitalByCountryCode(countryForm.getCountryCode()));
        } else {
            countryForm.setCapital(null);
        }
    }

    @RequestMapping("/examples/dialog")
    public String dialogLoad(@ModelAttribute("countryForm") CountryForm countryForm,
                             HttpServletRequest request) {

        countryForm.setCountriesSet(DataService.getCountriesByContinent(countryForm.getContinentCode()));

        return Routing.Page.DIALOG;
    }

    @RequestMapping("/examples/dialog/submit")
    public String dialogSubmit(@ModelAttribute("countryForm") CountryForm countryForm,
                               HttpServletRequest request) {

        return Routing.Forward.DIALOG;
    }

    @RequestMapping(value = "/examples/1", method = RequestMethod.GET)
    public String example1(@ModelAttribute("countryForm") CountryForm countryForm,
                           @RequestParam(required = false) String countryCode) {
        if (StringUtils.isNotBlank(countryCode)) {
            countryForm.setCountryCode(countryCode);
            countryForm.setCountryName(DataService.getCountryName(countryCode));
        }
        return Routing.Page.EXAMPLE1;
    }

    @RequestMapping(value = "/examples/1", method = RequestMethod.POST)
    public String example1Submit(@ModelAttribute("countryForm") CountryForm countryForm,
                                 HttpServletRequest request) {

        if (StringUtils.isNotBlank(countryForm.getCountryCode())) {
            countryForm.setCapital(DataService.getCapitalByCountryCode(countryForm.getCountryCode()));
        }

        // We don't need to send back the whole page. A fragment with the zone is enough
        return Routing.Page.EXAMPLE1;
    }

    @RequestMapping(value = {"/examples/2", "/examples/3"}, method = RequestMethod.POST, params = "refreshTextButton")
    public String refreshText(@RequestParam("someText")String someText,
                           HttpServletRequest request,
                           @RequestParam(required = false) String submitButton) {

        request.setAttribute("someText", someText);

        return Routing.Forward.EXAMPLES;
    }

    @RequestMapping(value = "/examples/2", method = RequestMethod.POST, params = "showCodeButton")
    public String example1ShowCode(@RequestParam("someText")String someText,
                                      HttpServletRequest request,
                                      @RequestParam(required = false) String submitButton) {

        String pageLocation = "/WEB-INF/jsp/examples/example2.jsp";
        request.setAttribute("code", WebUtil.getPageSourceCode(servletContext, pageLocation));

        return Routing.Forward.EXAMPLES;
    }

    @RequestMapping(value = "/examples/3", method = RequestMethod.POST, params = "showCodeButton")
    public String example2ShowCode(@RequestParam("someText")String someText,
                                   HttpServletRequest request,
                                   @RequestParam(required = false) String submitButton) {

        String pageLocation = "/WEB-INF/jsp/examples/example3.jsp";
        request.setAttribute("code", WebUtil.getPageSourceCode(servletContext, pageLocation));

        return Routing.Forward.EXAMPLES;
    }

    @RequestMapping(value = "/examples/4", method = RequestMethod.POST)
    public String example4(@ModelAttribute("countryForm") CountryForm countryForm,
                           HttpServletRequest request) {

        if (StringUtils.isNotBlank(request.getParameter("showCodeButton"))) {
            String pageLocation = "/WEB-INF/jsp/examples/example4.jsp";
            request.setAttribute("code", WebUtil.getPageSourceCode(servletContext, pageLocation));
        }

        return Routing.Forward.EXAMPLES;
    }

    @RequestMapping(value = "/examples/5", method = RequestMethod.GET)
    public String example5ShowCode(HttpServletRequest request,
                                   @RequestParam(required = false) String data) {

        String pageLocation = "/WEB-INF/jsp/examples/example5.jsp";
        request.setAttribute("code", WebUtil.getPageSourceCode(servletContext, pageLocation));

        String view = Routing.Forward.EXAMPLES;

        if (StringUtils.equals(data, "redirect")) {
            view = Routing.Redirect.EXAMPLES;
        }

        return view;
    }
}
