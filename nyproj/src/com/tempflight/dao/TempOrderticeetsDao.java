package com.tempflight.dao;

import java.util.List;

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
}
