package com.roc.sysmanager.base.dao;

import java.util.List;

import com.ibatis.dao.client.Dao;
import com.roc.enp.entity.FlightInfo;
import com.roc.enp.entity.FlightInfoKeyword;

public interface FlightInfoDao extends Dao{

	public List<FlightInfo> flightInfoList(FlightInfoKeyword keyword);

	public int getFlightInfoCount(FlightInfoKeyword keyword);
	
	public Integer addFlightInfo(FlightInfo flightinfo);
	
	public FlightInfo selectById(int id);
	
	public Integer updateFlightInfo(FlightInfo flightinfo);
	
	public Integer deleteFlightInfo(int id);
	
	public Integer batchAddFlightInfo(List<FlightInfo> fiList);
	
	public List<FlightInfo> queryAllForSingle();
	
	public List<FlightInfo> queryByFlightDate(String flightDate);
}
