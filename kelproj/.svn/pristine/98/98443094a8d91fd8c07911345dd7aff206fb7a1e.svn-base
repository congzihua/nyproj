
/**
 * Copyright (c) 2002,北大方正数字科技项目开发部
 * All rights reserved.
 *
 *摘要： 
 *    定义用户组的DAO实现
 *
 * 当前版本：1.0
 * 作者：ligy
 * 完成日期：2009-7-4
 */
package com.founder.enp.sqlmapdao;

import java.util.List;

import com.founder.enp.entity.LogEntity;
import com.founder.enp.entity.LogKeyWord;
import com.founder.enp.iface.LogDao;
import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;

/**
 */

public class SqlMapLogDao extends SqlMapDaoTemplate implements
		LogDao {

	public SqlMapLogDao(DaoManager daoManager) {
		super(daoManager);
	}
	public int getLogCount(LogKeyWord keyword)
	{
		return (Integer)this.queryForObject("getLogCount", keyword);
	}
	public List getLogList(LogKeyWord keyword)
	{
		return this.queryForList("getLogList", keyword);
	}
	public  void delete(int logid)
	{
		this.delete("deletelog",logid);
	}
	public  void recordLog(LogEntity log)
	{
		this.insert("recordLog", log);
	}
	
}
