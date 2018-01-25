package com.founder.enp.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.founder.enp.entity.Parameter;
import com.founder.enp.iface.ParameterDao;
import com.founder.enp.persistence.DaoConfig;
import com.ibatis.dao.client.DaoManager;

public class ParameterService {
	
	private static Log log = LogFactory.getLog(DepartMentService.class);
	private DaoManager daoMgr;
	private ParameterDao dao;
	public ParameterService()
	{
		daoMgr = null;
		dao = null;
		try {
			daoMgr = DaoConfig.getDaoManager();
			dao = (ParameterDao) daoMgr.getDao(ParameterDao.class);
		} catch (Exception ex) {
			log.error((new StringBuilder(
					"\u521B\u5EFAdaomanager\u51FA\u73B0\u5F02\u5E38")).append(
					ex.getMessage()).toString());
		}
	}
	public Parameter listParameter()
	{
		try
		{
			return dao.listParameter();
		}
		catch(Exception ex)
		{
			log.error(ex.getMessage());
			return null;
		}
	}
	public boolean update(Parameter parameter)
	{
		try
		{
			 dao.update(parameter);
			 return true;
		}
		catch(Exception ex)
		{
			log.error(ex.getMessage());
			return false;
		}
	}

}
