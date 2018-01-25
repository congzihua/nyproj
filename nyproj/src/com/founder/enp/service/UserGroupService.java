package com.founder.enp.service;

import java.util.Iterator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.founder.enp.entity.GpReleation;
import com.founder.enp.entity.UserGroup;
import com.founder.enp.iface.UserGroupDao;
import com.founder.enp.persistence.DaoConfig;
import com.ibatis.dao.client.DaoManager;

public class UserGroupService {
	
	private static Log log = LogFactory.getLog(DepartMentService.class);
	private DaoManager daoMgr;
	private UserGroupDao dao;
	public UserGroupService()
	{
		daoMgr = null;
		dao = null;
		try {
			daoMgr = DaoConfig.getDaoManager();
			dao = (UserGroupDao) daoMgr.getDao(UserGroupDao.class);
		} catch (Exception ex) {
			log.error((new StringBuilder(
					"\u521B\u5EFAdaomanager\u51FA\u73B0\u5F02\u5E38")).append(
					ex.getMessage()).toString());
		}
	}
	/**
	 * 增加用户组信息
	 * @param dpm
	 * @return
	 */
	public boolean addUserGroup(UserGroup ug)
	{
		try
		{
			dao.add(ug);
			return true;
		}
		catch(Exception ex)
		{
			log.error("增加部门信息出错"+ex.getMessage());
			return false;
		}

	}
	public List queryDpmUg(int id)
	{
		try
		{
			return dao.queryDpmUg(id);
		}
		catch(Exception ex)
		{
			log.error("查询部门下用户组信息出错"+ex.getMessage());
			return null;
		}
	}
	public UserGroup queryUgInfo(int id)
	{
		try
		{
			return dao.queryUgInfo(id);
		}
		catch(Exception ex)
		{
			log.error("查询用户组信息出错"+ex.getMessage());
			return null;
		}
	}
	public UserGroup queryPowersInfo(int id)
	{
		try
		{
			String powers = ";";
			List list = dao.queryPowersInfo(id);
			Iterator iter = list.iterator();
			while (iter.hasNext())
			{
				GpReleation releation = (GpReleation)iter.next();
				powers+=releation.getPowerid()+";";
			}
			UserGroup group = new UserGroup();
			group = dao.queryUgInfo(id);
			group.setId(id);
			group.setPowers(powers);
			return group;
		}
		catch(Exception ex)
		{
			log.error("查询用户组权限信息出错"+ex.getMessage());
			return null;
		}
	}
	public boolean editUg(UserGroup ug)
	{
		try
		{
			dao.edit(ug);
			return true;
		}
		catch(Exception ex)
		{
			log.error("更新用户组信息出错"+ex.getMessage());
			return false;
		}
	}
	public boolean updatePowers(UserGroup ug)
	{
		try
		{
			daoMgr.startTransaction();
			String powers = ug.getPowers();
			dao.deleteGpReleation(ug.getId());
			java.util.StringTokenizer token = new java.util.StringTokenizer(powers,";");
			 GpReleation releation = new GpReleation();
			 releation.setGroupid(ug.getId());
			while (token.hasMoreTokens())
			{
			   releation.setPowerid(Integer.parseInt(token.nextToken()));
			   dao.updatePowers(releation);
			}
			
			daoMgr.commitTransaction();
			return true;
		}
		catch(Exception ex)
		{
			log.error("更新用户组权限出错"+ex.getMessage());
			return false;
		}
		finally
		{
			daoMgr.endTransaction();
		}
	}
	public int delUserGroup(String strGroupID)
	{
		try
		{
			java.util.StringTokenizer token = new java.util.StringTokenizer(strGroupID,";");
			while (token.hasMoreTokens())
			{
				if (dao.isHaveUser(Integer.parseInt(token.nextToken())) > 0)
				{
					return 2;
				}
				
			}
			daoMgr.startTransaction();
			token = new java.util.StringTokenizer(strGroupID,";");
			while (token.hasMoreTokens())
			{
				 dao.deleteUg(Integer.parseInt(token.nextToken()));
			}
			daoMgr.commitTransaction();
		    return 1;
			
		}
		catch(Exception ex)
		{
			log.error("删除用户组权限出错"+ex.getMessage());
		    return 0;
		}
		finally
		{
			daoMgr.endTransaction();
		}
	}

	public  List seleQXSystem(int userid){
		return dao.seleQXSystem(userid);
	}
}
