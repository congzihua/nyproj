package com.roc.sysmanager.base.service;

import java.util.List;

import com.founder.enp.persistence.DaoConfig;
import com.ibatis.dao.client.DaoManager;
import com.roc.enp.entity.FlightInfo;
import com.roc.enp.entity.FlightInfoKeyword;
import com.roc.sysmanager.base.dao.BaFlightDao;
import com.roc.sysmanager.base.dao.FlightInfoDao;


public class FlightInfoService {

	private FlightInfoDao fidao;
	private DaoManager daoMgr;
	
	
	public FlightInfoService(){
	
		daoMgr = null;
		fidao = null;
		try {
			daoMgr = DaoConfig.getDaoManager();
			fidao = (FlightInfoDao) daoMgr.getDao(FlightInfoDao.class);
		} catch (Exception ex) {
			
		}
	}
	
		
	
	public List<FlightInfo> queryFlightInfo(FlightInfoKeyword keyword) {			
		return fidao.flightInfoList(keyword);
	}
	
	public int getFlightInfoCount(FlightInfoKeyword keyword) {			
		return fidao.getFlightInfoCount(keyword);
	}
	
	public Integer addFlightInfo(FlightInfo flightinfo){
		return fidao.addFlightInfo(flightinfo);
	}
	
	public FlightInfo queryFlightInfoById(int id){
		return fidao.selectById(id);
	}
	
	public Integer changeFlightInfo(FlightInfo flightinfo){
		return fidao.updateFlightInfo(flightinfo);
	}
	
	public Integer deleteFlightInfo(int id){
		return fidao.deleteFlightInfo(id);
	}
	
	public Integer batchAddFlightInfo(List<FlightInfo> fiList){
		return fidao.batchAddFlightInfo(fiList);
	}
	
	public List<FlightInfo> queryAllForSingle(){
		return fidao.queryAllForSingle();
	}
	
	public List<FlightInfo> queryByFlightDate(String flightDate){
		return fidao.queryByFlightDate(flightDate);
	}
}
