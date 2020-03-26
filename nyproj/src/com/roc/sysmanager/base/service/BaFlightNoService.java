package com.roc.sysmanager.base.service;

import java.util.List;

import com.founder.enp.persistence.DaoConfig;
import com.ibatis.dao.client.DaoManager;
import com.roc.enp.entity.BaFlightNo;
import com.roc.sysmanager.base.dao.BaFlightDao;
import com.roc.sysmanager.base.dao.BaFlightNoDao;
import com.roc.sysmanager.base.dao.FlightInfoDao;

public class BaFlightNoService {
	private BaFlightNoDao baFlightNoDao;
	private DaoManager daoMgr;
	public BaFlightNoService(){
		
		daoMgr = null;
		baFlightNoDao = null;
		try {
			daoMgr = DaoConfig.getDaoManager();
			baFlightNoDao = (BaFlightNoDao) daoMgr.getDao(BaFlightNoDao.class);
		} catch (Exception ex) {
			
		}
	}
	
	public List<BaFlightNo> validateIsGenFlightNo(BaFlightNo baFlightNo) {
		return baFlightNoDao.validateIsGenFlightNo(baFlightNo);
	}
	public List<BaFlightNo> queryFlightInfoByDateAndFlightNo(BaFlightNo baFlightNo) {
		return baFlightNoDao.queryFlightInfoByDateAndFlightNo(baFlightNo);
	}
	public Integer insertBaFlightNo(BaFlightNo baFlightNo) {
		return baFlightNoDao.insertBaFlightNo(baFlightNo);
	}
}
