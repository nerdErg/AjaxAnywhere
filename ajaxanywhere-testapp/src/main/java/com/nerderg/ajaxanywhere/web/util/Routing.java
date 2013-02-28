package com.nerderg.ajaxanywhere.web.util;

/**
 * Created with IntelliJ IDEA.
 * User: Angel
 * Date: 2/02/13
 * Time: 6:21 PM
 * To change this template use File | Settings | File Templates.
 */
public class Routing {

    public class Page {
        public static final String HOME = "home";
        public static final String EXAMPLES = "examples";
        public static final String DIALOG = "examples/dialog" ;
        public static final String EXAMPLE5 = "examples/example5";
    }

    public class Redirect {
        public static final String EXAMPLES = "redirect:/action/examples";
    }

    public class Forward {
        public static final String EXAMPLES = "forward:/action/examples";

        public static final String DIALOG = "forward:/action/examples/dialog";
    }
}
