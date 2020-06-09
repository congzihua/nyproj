package com.tempflight.dao.impl;

import java.util.List;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;
import com.roc.syspe.entity.OpOrdertickets;
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
	@Override
	public List<TempOrdertickets> queryTempOrderticketsForDjp(Integer flightinfoId) {
		return queryForList("queryTempOrderticketsForDjp", flightinfoId);
	}
	/**查询该航班的座位列表**/
	public List<TempOrdertickets> tempFlightInfoSeatNumList(Integer flightinfoId) {
		return queryForList("tempFlightInfoSeatNumList", flightinfoId);
	}
	@Override
	public int isHasSeatInTempFlight(TempOrderticketsKeyword kw) {
		return (Integer)queryForObject("isHasSeatInTempFlight", kw);
	}
	@Override
	public boolean updateForTempDjp(TempOrdertickets order) {
		return update("updateForTempDjp", order) > 0;
	}
	public void updateTempOrdersBagnum(TempOrdertickets order) {
		update("updateTempOrdersBagnum",order);
	}
	/**查询该航班是否有该乘客**/
	public TempOrdertickets tfAuthInfoTicketInfo(TempOrderticketsKeyword kw) {
		return (TempOrdertickets)queryForObject("tfAuthInfoTicketInfo", kw);
	}
	/**通过团体名称查询该航班的团单列表**/
	public List<TempOrdertickets> tempTeamDjpList(TempOrderticketsKeyword kw) {
		return queryForList("tempTeamDjpList", kw);
	}
	@Override
	public List<TempFlightinfo> tempFlightInfoListByDate(String flightDate) {
		return queryForList("tempFlightInfoListByDate", flightDate);
	}
	@Override
	public List<TempOrdertickets> listTempForChargedDJP(int flightinfoId) {
		return queryForList("listTempForChargedDJP", flightinfoId);
	}
	@Override
	public List<TempOrdertickets> listTempForChargedSafeCheck(int flightinfoId) {
		return queryForList("listTempForChargedSafeCheck", flightinfoId);
	}
	@Override
	public List<TempFlightinfo> tempFlightInfoListByLimit() {
		return queryForList("tempFlightInfoListByLimit",null);
	}
	@Override
	public int insertTempFlightinfo(TempFlightinfo tempFlightinfo) {
		return (int)insert("insertTempFlightinfo", tempFlightinfo);
	}
	@Override
	public int editTempFlightinfo(TempFlightinfo tempFlightinfo) {
		return update("editTempFlightinfo", tempFlightinfo);
	}
	@Override
	public int deleteTempFlightinfoById(int id) {
		return update("deleteTempFlightinfoById", id);
	}
}
