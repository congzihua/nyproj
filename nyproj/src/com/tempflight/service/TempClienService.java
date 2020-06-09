package com.tempflight.service;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.founder.enp.persistence.DaoConfig;
import com.founder.enp.service.DepartMentService;
import com.ibatis.dao.client.DaoManager;
import com.roc.syspe.entity.OpOrdertickets;
import com.tempflight.dao.TempOrderticeetsDao;
import com.tempflight.entity.TempFlightinfo;
import com.tempflight.entity.TempOrdertickets;
import com.tempflight.entity.TempOrderticketsKeyword;

public class TempClienService {
	private static Log log = LogFactory.getLog(DepartMentService.class);
	private DaoManager daoMgr;
	private TempOrderticeetsDao dao;	
	public TempClienService(){
		daoMgr = null;
		dao = null;
		try {
			daoMgr = DaoConfig.getDaoManager();
			dao = (TempOrderticeetsDao) daoMgr.getDao(TempOrderticeetsDao.class);
		} catch (Exception ex) {
			log.error((new StringBuilder(
					"\u521B\u5EFAdaomanager\u51FA\u73B0\u5F02\u5E38")).append(
					ex.getMessage()).toString());
		}
	}
	public List<TempFlightinfo> tempFlightInfoList(
			TempOrderticketsKeyword keyword) {
		return dao.tempFlightInfoList(keyword);
	}
	public TempFlightinfo tempFlightInfoById(Integer id) {
		return dao.tempFlightInfoById(id);
	}
	/**通过临时航班id查询订单列表**/
	public List<TempOrdertickets> queryTempOrdertickets(Integer flightinfoId) {
		return dao.queryTempOrdertickets(flightinfoId);
	}
	public Integer tfAuthInfoIsHasTicketInfo(TempOrderticketsKeyword tempOrderticketsKeyword) {
		return dao.tfAuthInfoIsHasTicketInfo(tempOrderticketsKeyword);
	}
	/**增加临时订票记录**/
	public int insertTempOrderticket(TempOrdertickets tempOrdertickets) {
		return dao.insertTempOrderticket(tempOrdertickets);
	}
	public TempOrdertickets queryTempOrderticketsById(Integer id) {
		return dao.queryTempOrderticketsById(id);
	}
	/**
	 * 编辑临时航班的订票信息
	 * @param tempOrdertickets
	 */
	public void editTempOrderticket(TempOrdertickets tempOrdertickets) {
		 dao.editTempOrderticket(tempOrdertickets);
	}
	/**通过id改变订单状态**/
	public boolean tpTemptdOpOrderticket(TempOrdertickets tempOrdertickets) {
		return dao.tpTemptdOpOrderticket(tempOrdertickets);
	}
	/**登机安检列表页面**/
	public List<TempOrdertickets> queryTempOrderticketsForDjp(Integer flightinfoId) {
		return dao.queryTempOrderticketsForDjp(flightinfoId);
	}
	public List<TempOrdertickets> tempFlightInfoSeatNumList(Integer flightinfoId) {
		return dao.tempFlightInfoSeatNumList(flightinfoId);
	}
	public int isHasSeatInTempFlight(TempOrderticketsKeyword kw) {
		return dao.isHasSeatInTempFlight(kw);
	}
	public boolean updateForTempDjp(TempOrdertickets order) {
		return dao.updateForTempDjp(order);
	}
	public void updateTempOrdersBagnum(TempOrdertickets order) {
		dao.updateTempOrdersBagnum(order);
	}
	/**查询该航班是否有该乘客**/
	public TempOrdertickets tfAuthInfoTicketInfo(TempOrderticketsKeyword kw) {
		return dao.tfAuthInfoTicketInfo(kw);
	}
	/**通过团体名称查询该航班的团单列表**/
	public List<TempOrdertickets> tempTeamDjpList(TempOrderticketsKeyword kw) {
		return dao.tempTeamDjpList(kw);
	}
	public boolean updateForDjpTeam(List<TempOrdertickets> orderList) {
		for (TempOrdertickets order:orderList)
			updateForTempDjp(order);
		return true;
	}
	public List<TempFlightinfo> tempFlightInfoListByDate(String flightDate) {
		return dao.tempFlightInfoListByDate(flightDate);
	}
	public List<TempOrdertickets> listTempForChargedDJP(int flightinfoId) {
		return dao.listTempForChargedDJP(flightinfoId);
	}
	public List<TempOrdertickets> listTempForChargedSafeCheck(int flightinfoId) {
		return dao.listTempForChargedSafeCheck(flightinfoId);
	}
	public List<TempFlightinfo> tempFlightInfoListByLimit( ){
		return dao.tempFlightInfoListByLimit();
	}
	public int insertTempFlightinfo(TempFlightinfo tempFlightinfo) {
		return dao.insertTempFlightinfo(tempFlightinfo);
	}
	public int editTempFlightinfo(TempFlightinfo tempFlightinfo) {
		return dao.editTempFlightinfo(tempFlightinfo);
	}
	public int deleteTempFlightinfoById(int id) {
		return dao.deleteTempFlightinfoById(id);
	}
	
}
