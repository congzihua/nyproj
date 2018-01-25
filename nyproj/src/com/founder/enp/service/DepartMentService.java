package com.founder.enp.service;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.founder.enp.entity.DepartMent;
import com.founder.enp.iface.DepartMentDao;
import com.founder.enp.persistence.DaoConfig;
import com.ibatis.dao.client.DaoManager;

public class DepartMentService {
	
	private static Log log = LogFactory.getLog(DepartMentService.class);
	private DaoManager daoMgr;
	private DepartMentDao dao;
	
	public DepartMentService()
	{
		daoMgr = null;
		dao = null;
		try {
			daoMgr = DaoConfig.getDaoManager();
			dao = (DepartMentDao) daoMgr.getDao(DepartMentDao.class);
		} catch (Exception ex) {
			log.error((new StringBuilder(
					"\u521B\u5EFAdaomanager\u51FA\u73B0\u5F02\u5E38")).append(
					ex.getMessage()).toString());
		}
	
	}
	/**
	 * 查询部门列表
	 * @param id
	 * @return
	 */
	public List queryDepartMent(int id) {
		List list = null;
		try {
			list = dao.queryDepartMent(id);
		} catch (Exception ex) {
			log.error((new StringBuilder(
					"\u67E5\u8BE2\u6743\u9650\u5E93\u51FA\u73B0\u5F02\u5E38"))
					.append(ex.getMessage()).toString());
			return null;
		}
		return list;
	}
	/**
	 * 增加部门信息
	 * @param dpm
	 * @return
	 */
	public boolean addDepartMent(DepartMent dpm)
	{
		try
		{
			dao.add(dpm);
			return true;
		}
		catch(Exception ex)
		{
			log.error("增加部门信息出错"+ex.getMessage());
			return false;
		}

	}
	/**
	 * 判断是否含有子部门
	 */
	public boolean isLeaf(int id)
	{
		try
		{
			int n = dao.isLeaf(id);
			if (n > 0)
			return true;
			else
			return false;
		}
		catch(Exception ex)
		{
			log.error("查询部门信息出错"+ex.getMessage());
			return false;
		}

	}
	public DepartMent queryDpmInfo(int id)
	{
		try
		{
			return dao.getDpmInfo(id);
		}
		catch(Exception ex)
		{
			log.error("查询部门信息出错"+ex.getMessage());
			return null;
		}

	}
	public boolean edit(DepartMent dpm)
	{
		try
		{
			dao.edit(dpm);
			return true;
		}
		catch(Exception ex)
		{
			log.error("修改部门信息出错"+ex.getMessage());
			return false;
		}
	}
	public int delete(int dmpid)
	{
		try
		{
			if (dao.isDel(dmpid))
			{
				dao.del(dmpid);
				return 1;
			}
			else
			{
				return 2;
			}
			
		}
		catch(Exception ex)
		{
			log.error("删除部门信息出错"+ex.getMessage());
			return 0;
		}
	}

}
