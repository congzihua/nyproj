package com.founder.enp.iface;

import java.util.List;

import com.founder.enp.entity.LogEntity;
import com.founder.enp.entity.LogKeyWord;
import com.ibatis.dao.client.Dao;

public interface LogDao  extends Dao {
	
	public abstract int getLogCount(LogKeyWord keyword);
	public abstract List getLogList(LogKeyWord keyword);
	public abstract void delete(int logid);
	public abstract void recordLog(LogEntity log);

}
