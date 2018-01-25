package com.founder.enp.iface;

import java.util.List;

import com.founder.enp.entity.DepartMent;
import com.ibatis.dao.client.Dao;


	
public interface DepartMentDao extends Dao
{
    public abstract List queryDepartMent(Integer id);
	public abstract boolean add(DepartMent dpm);
    public abstract int isLeaf(int id);
    public abstract DepartMent getDpmInfo(int id);
    public abstract void edit(DepartMent dpm);
    public abstract void del(int dmpid);
    public abstract boolean isDel(int dmpid);
}

