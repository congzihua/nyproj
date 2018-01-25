package com.founder.enp.sqlmapdao;


import java.util.List;

import com.founder.enp.entity.DocNum;
import com.founder.enp.entity.DocTypes;
import com.founder.enp.entity.DocTypesKeyWord;
import com.founder.enp.iface.DocTypesDao;
import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;


public class SqlMapDocTypesDao extends SqlMapDaoTemplate implements DocTypesDao 
{
	public SqlMapDocTypesDao(DaoManager daoManager) {
		super(daoManager);
	}
	
	
	public int queryDocTypesCount(DocTypesKeyWord keyword)
	{
		return (Integer)this.queryForObject("queryDocTypesCount", keyword);
	}
	public  List listDocTypes(DocTypesKeyWord keyword)
	{
		return this.queryForList("listDocTypes", keyword);
	}
	public  int add(DocTypes types)
	{
		return (Integer)this.insert("addDocTypes", types);
	}
	public DocTypes getDocTypesInfo(int doctypesid)
	{
		return (DocTypes)this.queryForObject("getDocTypesInfo", doctypesid);
	}
	public  void delete(int doctypesid)
	{
		this.delete("deleteDocTypes",doctypesid);
	}
	public  void edit(DocTypes doctypes)
	{
		this.update("editDoctypes", doctypes);
	}
	public  void deldocnum(int doctypeid)
	{
		this.delete("deldocnum",doctypeid);
	}
	public  List getAllDoctypes()
	{
		return this.queryForList("getAllDoctypes", 1);
	}
	public  DocNum getDocNum(int doctypeid)
	{
		return (DocNum)this.queryForObject("getDocNum", doctypeid);
	}
	public  void insertDocNum(DocNum docNum)
	{
		this.insert("insertDocNum", docNum);
	}
	
	public  void updateDocNum(DocNum docNum)
	{
		this.update("updateDocNum", docNum);
	}
	public  List getDocTypesFromDmp(int dmpid)
	{
		return this.queryForList("getDocTypesFromDmp", dmpid);
	}
	public  Integer getDocIDFromDocTypeName(String typename)
	{
		return (Integer)this.queryForObject("getDocIDFromDocTypeName", typename);
	}
	public  Integer checkGetDocNum(int doctypeid)
	{
		return (Integer)this.queryForObject("checkGetDocNum", doctypeid);
	}
}
