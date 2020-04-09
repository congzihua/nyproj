package com.flyticket.system.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class ArgsUnit {
	
	private static String startAddress = null;
	private static String dataOutDir = null;
	private static int opTicketIdInitVal =  0 ;
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
	public static String getDataOutDir() {
		String uri = "";
		ArgsUnit unit = new ArgsUnit();
		uri =unit.getClass().getClassLoader().getResource("").getPath();
	    if(dataOutDir == null){
			Properties properties = new Properties();
		    try {
				properties.load(new FileInputStream(uri+"configmap.properties"));
				dataOutDir = properties.getProperty("dataOutDir");
		    } catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
	    }
		return dataOutDir;
	}

	public static int getOpTicketIdInitVal() {
		String uri = "";
		ArgsUnit unit = new ArgsUnit();
		uri =unit.getClass().getClassLoader().getResource("").getPath();
	    if(opTicketIdInitVal == 0){
			Properties properties = new Properties();
		    try {
				properties.load(new FileInputStream(uri+"configmap.properties"));
				String idStart = properties.getProperty("TICKET_ID_START");
				opTicketIdInitVal = Integer.valueOf(idStart);
		    } catch (Exception e) {
		    	opTicketIdInitVal = 10000;
				e.printStackTrace();
			}
	    }
		return opTicketIdInitVal;
	}
}
