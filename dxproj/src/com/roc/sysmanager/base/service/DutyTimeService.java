package com.roc.sysmanager.base.service;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.founder.enp.persistence.DaoConfig;
import com.ibatis.dao.client.DaoManager;
import com.roc.enp.entity.DutyTimeKeyword;
import com.roc.enp.entity.Dutytime;
import com.roc.sysmanager.base.dao.DutyTimeDao;

public class DutyTimeService {
	private static Log log = LogFactory.getLog(DutyTimeService.class);
	private DaoManager daoMgr;
	private DutyTimeDao dao;
	public DutyTimeService() {
		daoMgr = null;
		dao = null;
		daoMgr = DaoConfig.getDaoManager();
		dao = (DutyTimeDao) daoMgr.getDao(DutyTimeDao.class);
	}
	public void editDutyTime(Dutytime dt) {
		dao.editDutyTime(dt);
	}

	public List<Dutytime> getDutyTime(DutyTimeKeyword kw) {
		return dao.getDutyTime(kw);
	}
}
