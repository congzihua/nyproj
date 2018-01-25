package com.flyticket.system.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import com.founder.enp.util.databases.ConfigManager;

public class ArgsUnit {
	
	private static String startAddress = null;
	
	public static String getStartAddress(String uri) {
	    if(startAddress == null){
			Properties properties = new Properties();
		    try {
				properties.load(new FileInputStream(uri+"WEB-INF/classes/configmap.properties"));
				startAddress = properties.getProperty("startaddress");
		    } catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
		return startAddress;
	}

	public static String getStartAddress() {
		String uri = "";
		ArgsUnit unit = new ArgsUnit();
		uri =unit.getClass().getClassLoader().getResource("").getPath();
	    if(startAddress == null){
			Properties properties = new Properties();
		    try {
				properties.load(new FileInputStream(uri+"configmap.properties"));
				startAddress = properties.getProperty("startaddress");
		    } catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
		return startAddress;
	}
	public static void main(String[] args) {
		String uri = "";
		ArgsUnit unit = new ArgsUnit();
		uri =unit.getClass().getClassLoader().getResource("").getPath();
		System.out.println(uri);
	}
	
	
}
