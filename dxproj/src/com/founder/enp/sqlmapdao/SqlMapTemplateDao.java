package com.founder.enp.sqlmapdao;


import java.util.List;

import com.founder.enp.entity.Template;
import com.founder.enp.entity.TemplateKeyWord;
import com.founder.enp.iface.TemplateDao;
import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;


public class SqlMapTemplateDao extends SqlMapDaoTemplate implements
TemplateDao 
{
	public SqlMapTemplateDao(DaoManager daoManager) {
		super(daoManager);
	}
	
	public void add(Template template)
	{
		this.insert("add", template);
	}
	public int queryTemplateCount(TemplateKeyWord keyword)
	{
		return ((Integer)queryForObject("queryTemplateCount", keyword)).intValue();
	}
	public List listTemplate(TemplateKeyWord keyword)
	{
		return this.queryForList("listTemplate", keyword);
	}
	public  Template selectTemplate(int templateid)
	{
		return (Template)this.queryForObject("selectTemplate", templateid);
	}
	public void update(Template template)
	{
		this.update("updateTemplate",template);
	}
	public  int checkName(String name)
	{
		return (Integer)this.queryForObject("checkName",name);
	}
	public  void delete(int templateid)
	{
		this.delete("deletetemplate",templateid);
	}
	public int isDel(int templateid)
	{
		return (Integer)this.queryForObject("isDelTemplate", templateid);
	}
	public  List getAllTemplate()
	{
		return this.queryForList("getAllTemplate", 1);
	}


}
