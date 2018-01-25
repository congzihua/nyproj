package com.founder.enp.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.founder.enp.entity.Authorization;
import com.founder.enp.entity.LogEntity;
import com.founder.enp.entity.LogKeyWord;
import com.founder.enp.iface.LogDao;
import com.founder.enp.persistence.DaoConfig;
import com.ibatis.dao.client.DaoManager;

public class LogService {
	private static Log log = LogFactory.getLog(LogService.class);

	private static DaoManager daoMgr = null;

	private static LogDao dao = null;

	static {
		try {
			daoMgr = DaoConfig.getDaoManager();
			dao = (LogDao) daoMgr.getDao(LogDao.class);

		} catch (Exception ex) {
			log.error("创建daomanager出现异常" + ex.getMessage());
		}
	}
	public static int getLogCount(LogKeyWord keyword)
	{
		try
		{
			return dao.getLogCount(keyword);
			
		}
		catch(Exception ex)
		{
			log.error("查询日志异常"+ex.getMessage());
			return -1;
		}
	}
	public static void recordLog(LogEntity logEntity, HttpServletRequest request)
	{
		//通过session得到用户Authorization auth = new Authorization();
		Authorization authorization = (Authorization)request.getSession().getAttribute("authorization");
		logEntity.setIp(authorization.getIp());
		logEntity.setAccount(authorization.getAccount());
		logEntity.setLogtime(authorization.getRtime());
		try
		{
			dao.recordLog(logEntity);
		}
		catch(Exception ex)
		{
			log.error("记录日志出现异常"+ex.getMessage());
		}
	}
	public static List getLogList(LogKeyWord keyword)
	{
		try
		{
			return dao.getLogList(keyword);
			
		}
		catch(Exception ex)
		{
			log.error("查询日志异常"+ex.getMessage());
			return null;
		}
	}
	public static boolean delete(String idString)
	{
		try
		{
			daoMgr.startTransaction();
			java.util.StringTokenizer token = new java.util.StringTokenizer(idString,";");
			while (token.hasMoreTokens())
			{
				dao.delete(Integer.parseInt(token.nextToken()));
			}
			
			daoMgr.commitTransaction();
			return true;
		}
		catch(Exception ex)
		{
			log.error("删除日志失败"+ex.getMessage());
			return false;
		}
		finally
		{
			daoMgr.endTransaction();
		}
	}

}
