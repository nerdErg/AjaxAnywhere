package com.nerderg.ajaxanywhere.listener;

import org.slf4j.bridge.SLF4JBridgeHandler;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.logging.Level;
import java.util.logging.LogManager;
import java.util.logging.Logger;

/**
 * @author Angel Ruiz
 * Date: 13/02/13
 */
public class JulToSlf4jBridgeListener implements ServletContextListener {

    public void contextInitialized(ServletContextEvent sce) {
        LogManager.getLogManager().reset();
        SLF4JBridgeHandler.install();
        Logger.getLogger("global").setLevel(Level.FINEST);
    }

    public void contextDestroyed(ServletContextEvent sce) {
        // Do nothing
    }
}
