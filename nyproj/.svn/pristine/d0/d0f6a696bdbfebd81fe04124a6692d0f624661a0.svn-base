package com.founder.enp.sqlmapdao;

import java.util.List;


import com.founder.enp.entity.GpReleation;
import com.founder.enp.entity.UserGroup;
import com.founder.enp.iface.UserGroupDao;
import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;

public class SqlMapUserGroupDao extends SqlMapDaoTemplate implements UserGroupDao{
	
	public SqlMapUserGroupDao(DaoManager daoManager) {
		super(daoManager);
	}
	public  void add(UserGroup ug)
	{
		insert("addug",ug);
	}
    
	public  List queryDpmUg(int id)
	{
		return this.queryForList("querydmpUg", id);
	}
	public UserGroup queryUgInfo(int id)
	{
		 return (UserGroup)queryForObject("queryUgInfo", Integer.valueOf(id));
	}
	public void edit(UserGroup ug)
	{
		update("editug",ug);
	}
	public void updatePowers(GpReleation releation)
	{
	    this.update("updatePowers", releation);
	}
	public  int isHaveUser(int groupid)
	{
		return ((Integer)queryForObject("isHaveUser", groupid)).intValue();
	}
	public  void deleteUg(int groupid)
	{
		this.delete("deleteUserGroup", groupid);
	}
	public  void deleteGpReleation(int groupid)
	{
		this.delete("deleteGpReleation", groupid);
	}
	public  List queryPowersInfo(int groupid)
	{
		return this.queryForList("queryPowersInfo", groupid);
	}
	
	public  List seleQXSystem(int groupid)
	{
		return this.queryForList("seleQXSystem", groupid);
	}
}

