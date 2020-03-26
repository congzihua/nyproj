package com.roc.sysmanager.base.impl;

import java.util.List;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;
import com.roc.enp.entity.BaFlightNo;
import com.roc.sysmanager.base.dao.BaFlightNoDao;

public class BaFlightNoDaoImpl extends SqlMapDaoTemplate implements BaFlightNoDao{
	public BaFlightNoDaoImpl(DaoManager daoManager) {
		super(daoManager);
	}
	@Override
	public List<BaFlightNo> validateIsGenFlightNo(BaFlightNo baFlightNo) {
		return queryForList("validateIsGenFlightNo",baFlightNo);
	}

	@Override
	public List<BaFlightNo> queryFlightInfoByDateAndFlightNo(BaFlightNo baFlightNo) {
		return queryForList("queryFlightInfoByDateAndFlightNo",baFlightNo);
	}

	@Override
	public Integer insertBaFlightNo(BaFlightNo baFlightNo) {
		return (Integer)insert("insertBaFlightNo", baFlightNo);
	}

}
