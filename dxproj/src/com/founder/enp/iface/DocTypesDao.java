package com.founder.enp.iface;

import java.util.List;

import com.founder.enp.entity.DocNum;
import com.founder.enp.entity.DocTypes;
import com.founder.enp.entity.DocTypesKeyWord;
import com.ibatis.dao.client.Dao;

public interface DocTypesDao extends Dao {
	
	public abstract  int queryDocTypesCount(DocTypesKeyWord keyword);
	public abstract List listDocTypes(DocTypesKeyWord keyword);
	public abstract int add(DocTypes types);
	public abstract DocTypes getDocTypesInfo(int doctypesid);
	public abstract void delete(int doctypesid);
	public abstract void edit(DocTypes doctypes);
	public abstract void deldocnum(int doctypeid);
	public abstract List getAllDoctypes();
	public abstract DocNum getDocNum(int doctypeid);
	public abstract void insertDocNum(DocNum docNum);
	public abstract void updateDocNum(DocNum docNum);
	public abstract List getDocTypesFromDmp(int dmpid);
	public abstract Integer getDocIDFromDocTypeName(String typename);
	public abstract Integer checkGetDocNum(int doctypeid);
}
