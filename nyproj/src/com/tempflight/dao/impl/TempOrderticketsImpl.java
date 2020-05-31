package com.tempflight.dao.impl;

import java.util.List;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;
import com.tempflight.dao.TempOrderticeetsDao;
import com.tempflight.entity.TempFlightinfo;
import com.tempflight.entity.TempOrdertickets;
import com.tempflight.entity.TempOrderticketsKeyword;

public class TempOrderticketsImpl extends SqlMapDaoTemplate implements TempOrderticeetsDao{
	public TempOrderticketsImpl(DaoManager daoManager) {
		super(daoManager);
	}
	@Override
	public List<TempFlightinfo> tempFlightInfoList(
			TempOrderticketsKeyword keyword) {
		return queryForList("tempFlightInfoList", keyword);
	}
	@Override
	public TempFlightinfo tempFlightInfoById(Integer id) {
		return (TempFlightinfo)queryForObject("tempFlightInfoById", id);
	}
	/**通过临时航班的id查询临时航班信息列表**/
	public List<TempOrdertickets> queryTempOrdertickets(Integer flightinfoId) {
		return queryForList("queryTempOrdertickets", flightinfoId);
	}
	/**验证临时航班是否有订票信息**/
	public Integer tfAuthInfoIsHasTicketInfo(TempOrderticketsKeyword tempOrderticketsKeyword) {
		return (Integer)queryForObject("tfAuthInfoIsHasTicketInfo", tempOrderticketsKeyword);
	}
	@Override
	public int insertTempOrderticket(TempOrdertickets tempOrdertickets) {
		return (Integer)insert("insertTempOrderticket",tempOrdertickets);
	}
	@Override
	public TempOrdertickets queryTempOrderticketsById(Integer id) {
		return (TempOrdertickets)queryForObject("queryTempOrderticketsById", id);
	}
	@Override
	public void editTempOrderticket(TempOrdertickets tempOrdertickets) {
		update("editTempOrderticket", tempOrdertickets);
		return;
	}
	@Override
	public boolean tpTemptdOpOrderticket(TempOrdertickets tempOrdertickets) {
		
		return update("tpTemptdOpOrderticket", tempOrdertickets) > 0;
	}
}
