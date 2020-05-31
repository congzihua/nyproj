package com.tempflight.service;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.founder.enp.persistence.DaoConfig;
import com.founder.enp.service.DepartMentService;
import com.ibatis.dao.client.DaoManager;
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
}
