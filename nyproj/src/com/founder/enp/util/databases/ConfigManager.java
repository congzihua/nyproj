package com.founder.enp.util.databases;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.founder.enp.util.XMLProperties;

public class ConfigManager
{

    private static XMLProperties properties = null;
    private static Log log = LogFactory.getLog(ConfigManager.class);
    private static String gwlzHome = null;
    private static String configFilePath = null;

    public ConfigManager()
    {
    }

    public static String getHome()
    {
        if(gwlzHome == null)
        	gwlzHome = System.getProperty("GWLZROOT");
        return gwlzHome;
    }

    public static String getGwlzRoot()
    {
        return getHome();
    }
    private static String getConfigFilePath()
    {  
    	
        if(configFilePath == null)
        {
            StringBuffer ret = new StringBuffer(256);
            ret.append(getHome());
            ret.append("/WEB-INF/GwlzConfig.xml");
            configFilePath = ret.toString();
        }
        return configFilePath;
    }

    private static synchronized void loadProperties()
    {
        try
        {
            String path = getConfigFilePath();
            properties = new XMLProperties(path);
        }
        catch(Exception ex)
        {
            log.error(ex.getMessage());
        }
    }

    public static String getConfigProperty(String name)
    {
        if(properties == null)
            loadProperties();
        return properties.getProperty(name);
    }

    public static void setConfigProperty(String name, String value)
    {
        if(properties == null)
            loadProperties();
        properties.setProperty(name, value);
    }

    public static void deleteConfigProperty(String name)
    {
        loadProperties();
        properties.deleteProperty(name);
    }

}
