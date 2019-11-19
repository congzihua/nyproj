package com.roc.sysmanager.base.impl;

import java.util.List;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;
import com.roc.enp.entity.DutyTimeKeyword;
import com.roc.enp.entity.Dutytime;
import com.roc.sysmanager.base.dao.DutyTimeDao;

public class DutyTimeDaoImpl extends SqlMapDaoTemplate implements DutyTimeDao{
	public DutyTimeDaoImpl(DaoManager daoManager) {
		super(daoManager);
	}
	public void editDutyTime(Dutytime dt) {
		update("editDutytime", dt);
	}

	public List<Dutytime> getDutyTime(DutyTimeKeyword kw) {
		return queryForList("quyeryDutyTime",kw);
	}

}
