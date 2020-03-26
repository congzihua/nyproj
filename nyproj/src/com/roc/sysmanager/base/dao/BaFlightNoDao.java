package com.roc.sysmanager.base.dao;

import java.util.List;

import com.ibatis.dao.client.Dao;
import com.roc.enp.entity.BaFlightNo;

public interface BaFlightNoDao extends Dao{
	public List<BaFlightNo> validateIsGenFlightNo(BaFlightNo baFlightNo);
	public List<BaFlightNo> queryFlightInfoByDateAndFlightNo(BaFlightNo baFlightNo);
	public Integer insertBaFlightNo(BaFlightNo baFlightNo);
}
