package com.founder.enp.sqlmapdao;

import com.founder.enp.entity.Parameter;
import com.founder.enp.iface.ParameterDao;
import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;

public class SqlMapParameterDao extends SqlMapDaoTemplate implements ParameterDao{
	
	public SqlMapParameterDao(DaoManager daoManager) {
		super(daoManager);
	}
	
	public void update(Parameter parameter)
	{
		this.update("updateParameter",parameter);
	}
	public Parameter listParameter()
	{
		System.out.println("=====");
		Parameter par = (Parameter)this.queryForObject("listParameter",1);
		return par;
	}

}
