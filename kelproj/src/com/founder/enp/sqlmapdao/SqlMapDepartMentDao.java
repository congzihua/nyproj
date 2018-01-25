
/**
 * 
 *
 *摘要： 
 *    定义用户组的DAO实现
 *
 * 当前版本：1.0
 * 

 */
package com.founder.enp.sqlmapdao;

import java.util.List;

import com.founder.enp.entity.DepartMent;
import com.founder.enp.iface.DepartMentDao;
import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;

/**
 */

public class SqlMapDepartMentDao extends SqlMapDaoTemplate implements
		DepartMentDao {

	public SqlMapDepartMentDao(DaoManager daoManager) {
		super(daoManager);
	}

	public List queryDepartMent(Integer id) {
		return queryForList("getDepartmentList", id);

	}

	public boolean add(DepartMent dpm) {
		insert("addDpm", dpm);
		return true;
	}
	public int isLeaf(int id)
	{
		 return ((Integer)queryForObject("getDepartMentCount", id)).intValue();
	}
	public  DepartMent getDpmInfo(int id)
	{
		 return (DepartMent)queryForObject("queryDpmInfo", Integer.valueOf(id));
	}
    public  void edit(DepartMent dpm)
    {
    	 update("editdpm",dpm);
    }
    public void del(int dmpid)
    {
    	this.delete("deleteDmp",dmpid);
    }
    public boolean isDel(int dmpid)
    {
    	int a =((Integer)queryForObject("isHaveZ", dmpid)).intValue();
     	int b =((Integer)queryForObject("isHaveGoup", dmpid)).intValue();

        if ((a+b) > 0)
    	  return false;
        else
        	return true;
    }
}
