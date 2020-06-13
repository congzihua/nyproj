package com.tempflight.dao;

import java.util.List;

import com.roc.syspe.entity.OpOrdertickets;
import com.tempflight.entity.TempFlightinfo;
import com.tempflight.entity.TempOrdertickets;
import com.tempflight.entity.TempOrderticketsKeyword;

public interface TempOrderticeetsDao {
	public List<TempFlightinfo> tempFlightInfoList(TempOrderticketsKeyword keyword);
	/**通过id查询临时航班信息**/
	public TempFlightinfo tempFlightInfoById(Integer id);
	/**通过临时航班的id查询临时航班信息列表**/
	public List<TempOrdertickets> queryTempOrdertickets(Integer flightinfoId);
	/**验证临时航班是否有订票信息**/
	public Integer tfAuthInfoIsHasTicketInfo(TempOrderticketsKeyword tempOrderticketsKeyword);
	public int insertTempOrderticket(TempOrdertickets tempOrdertickets);
	public TempOrdertickets queryTempOrderticketsById(Integer id);
	public void editTempOrderticket(TempOrdertickets tempOrdertickets);
	/**通过id改变订单状态**/
	public boolean tpTemptdOpOrderticket(TempOrdertickets tempOrdertickets);
	/**登机安检列表页面**/
	public List<TempOrdertickets> queryTempOrderticketsForDjp(Integer flightinfoId);
	/**查询该航班的座位列表**/
	public List<TempOrdertickets> tempFlightInfoSeatNumList(Integer flightinfoId);
	public int isHasSeatInTempFlight(TempOrderticketsKeyword kw);
	public boolean updateForTempDjp(TempOrdertickets order);
	public void updateTempOrdersBagnum(TempOrdertickets order);
	/**查询该航班是否有该乘客**/
	public TempOrdertickets tfAuthInfoTicketInfo(TempOrderticketsKeyword kw);
	/**通过团体名称查询该航班的团单列表**/
	public List<TempOrdertickets> tempTeamDjpList(TempOrderticketsKeyword kw);
	public List<TempFlightinfo> tempFlightInfoListByDate(String flightDate);
	public List<TempOrdertickets> listTempForChargedDJP(int flightinfoId);
	public List<TempOrdertickets> listTempForChargedSafeCheck(int flightinfoId);
	public List<TempFlightinfo> tempFlightInfoListByLimit();
	public int insertTempFlightinfo(TempFlightinfo tempFlightinfo);
	public int editTempFlightinfo(TempFlightinfo tempFlightinfo);
	public int deleteTempFlightinfoById(int id);
	public List<TempFlightinfo> queryTempFlghtInfosByDates(TempOrderticketsKeyword kw);
	public Integer queryTempOrderCount(Integer tempFlightinfoId);
}
