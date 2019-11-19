package com.roc.sysmanager.base.dao;

import java.util.List;

import com.ibatis.dao.client.Dao;
import com.roc.enp.entity.DutyTimeKeyword;
import com.roc.enp.entity.Dutytime;

public interface DutyTimeDao extends Dao{
    public void editDutyTime(Dutytime dt);
	public List<Dutytime> getDutyTime(DutyTimeKeyword kw);
}
