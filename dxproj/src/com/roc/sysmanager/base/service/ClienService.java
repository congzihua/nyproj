package com.roc.sysmanager.base.service;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.founder.enp.persistence.DaoConfig;
import com.founder.enp.service.DepartMentService;
import com.ibatis.dao.client.DaoManager;
import com.roc.enp.entity.OpUseroper;
import com.roc.sysmanager.base.dao.BaTicketsallocDao;
import com.roc.sysmanager.base.dao.OpOrderticeetsDao;
import com.roc.syspe.entity.OpOrdertickets;
import com.roc.syspe.entity.OpOrderticketsKeyword;

public class ClienService {
	private static Log log = LogFactory.getLog(DepartMentService.class);
	private DaoManager daoMgr;
	private OpOrderticeetsDao dao;	
	public ClienService(){
		daoMgr = null;
		dao = null;
		try {
			daoMgr = DaoConfig.getDaoManager();
			dao = (OpOrderticeetsDao) daoMgr.getDao(OpOrderticeetsDao.class);
		} catch (Exception ex) {
			log.error((new StringBuilder(
					"\u521B\u5EFAdaomanager\u51FA\u73B0\u5F02\u5E38")).append(
					ex.getMessage()).toString());
		}
	}
	public List<OpOrdertickets> getOrderticketsList(
			OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return dao.getOrderticketsList(keyword);
	}	
	public List<OpOrdertickets> getBaFlightInfoList(
			OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return dao.getBaFlightInfoList(keyword);
	}
	public List<OpOrdertickets> groupTiecketCount(OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return dao.groupTiecketCount(keyword);
	}
	public OpOrdertickets getbaFlightInfoForIn(OpOrderticketsKeyword keyword) {
		return dao.getbaFlightInfoForIn(keyword);
	}
	
	public boolean editOpOrderticket(OpOrdertickets ordertickets,com.roc.enp.entity.OpUseroper userOper) {
		return dao.editOpOrderticket(ordertickets,userOper);
	}

	
	public int insertOpOrderticket(OpOrdertickets ordertickets,com.roc.enp.entity.OpUseroper userOper) {
		return dao.insertOpOrderticket(ordertickets,userOper);	
		
	}
	public boolean tgOpOrderticket(OpOrdertickets ordertickets,
			OpUseroper userOper) {
		
		return dao.tgOpOrderticket(ordertickets, userOper);
	}
	public boolean tpOrtdOpOrderticket(OpOrdertickets ordertickets,
			OpUseroper userOper) {
		return dao.tpOrtdOpOrderticket(ordertickets, userOper);
	}
	public List<OpOrdertickets> zhidengjiticketsList(OpOrderticketsKeyword keyword) {
		
		return dao.zhidengjiticketsList(keyword);
	}
	public boolean updateForDjp(OpOrdertickets ordertickets, OpUseroper userOper) {
		
		return dao.updateForDjp(ordertickets, userOper);
	}
	public boolean bentchUpFlightNo(OpOrdertickets op) {
		return dao.bentchUpFlightNo(op);
	}
	public List<OpOrdertickets> userInfoCounts(OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return dao.userInfoCounts(keyword);
	}

	
	public List<OpOrdertickets> userUnitInList(OpOrderticketsKeyword keyword) {
		return dao.userUnitInList(keyword);
	}
	public Integer userOperLogCount(OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return dao.userOperLogCount(keyword);
	}

	public Integer CustomerLogCount(OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return dao.CustomerLogCount(keyword);
	}
	
	public List<OpOrdertickets> userOperLogList(OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return dao.userOperLogList(keyword);
	}
	public List<OpOrdertickets> customerLogList(OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return dao.customerLogList(keyword);
	}
	public List<OpOrdertickets> flightInfoSeatNumList(OpOrderticketsKeyword keyword) {
		return dao.flightInfoSeatNumList(keyword);
	}
	public List<OpOrdertickets> getAllCountInfoForUnits(
			OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return dao.getAllCountInfoForUnits(keyword);
	}

	
	public Integer isHasSeat(OpOrderticketsKeyword keyword) {	
		return dao.isHasSeat(keyword);
	}
	public List<OpOrdertickets> queryByFlightInfoId(int id){
		return dao.queryByFlightInfoId(id);
	}
	
	public Integer updateStatusAtDJP(int id){
		return dao.updateStatusAtDJP(id);
	}
	
	public Integer queryStatusByCustomerId(int id,int flightInfoId){
		return dao.selectStatusByCustomerId(id,flightInfoId);
	}
	
	public boolean mainPageForDJP(OpOrderticketsKeyword keyword){
		return dao.mainPageForDJP(keyword)>0;
	}
	
	public List<OpOrdertickets> listForReserveDJP(OpOrderticketsKeyword keyword){
		return dao.listForReserveDJP(keyword);
	}
	
	public List<OpOrdertickets> listForChargeDJP(OpOrderticketsKeyword keyword){
		return dao.listForChargeDJP(keyword);
	}
	
	public List<OpOrdertickets> listForChargedDJP(OpOrderticketsKeyword keyword){
		return dao.listForChargedDJP(keyword);
	}
	/**
	 * 登机扫描完成，进入隔离厅的乘客信息列表
	 */
	public List<OpOrdertickets> listForInFly(OpOrderticketsKeyword keyword){
		return dao.listForInFly(keyword);
	}
	/**
	 * 是否有当班信息
	 * @param keyword
	 * @return
	 */
	public Integer authInfoIsHas(OpOrderticketsKeyword keyword) {
		return dao.authInfoIsHas(keyword);
	}
	/**
	 * 获得订票状态，防止发生误操作
	 */
	public String getOrderStatus(Integer id) {
		return dao.getOrderStatus(id);
	}
	
	public OpOrdertickets orderticketsBagNum(OpOrdertickets opOrdertickets) {
		// TODO Auto-generated method stub
		return dao.orderticketsBagNum(opOrdertickets);
	}

	
	public boolean updateBagnum(OpOrdertickets opOrdertickets) {
		return dao.updateBagnum(opOrdertickets);
	}
	/**
	 * 通过航班、状态和团队名称获得团体同一状态信息
	 * @param keyword
	 * @return
	 */
	public List<OpOrdertickets> teamSaltOrUpList(OpOrderticketsKeyword keyword) {
		
		return dao.teamSaltOrUpList(keyword);
	}
	public boolean saltTeamTickets(List<OpOrdertickets> teamInfoList,
			OpUseroper userOper) {
		return dao.saltTeamTickets(teamInfoList, userOper);
	}
	public List<OpOrdertickets> teamDjpList(OpOrderticketsKeyword kw) {
		return dao.teamDjpList(kw);
	}
	public boolean updateForDjpTeam(List<OpOrdertickets> orderList,
			String[] seatNums, OpUseroper userOper) {
		return dao.updateForDjpTeam(orderList, seatNums, userOper);
	}
	public List<OpOrdertickets> allInfoList(OpOrderticketsKeyword kw) {
		List<OpOrdertickets> tickets =  dao.allInfoList(kw);
		if (tickets == null || tickets.size() == 0)
			return tickets;
		for (OpOrdertickets t:tickets) {
			String bagNum = t.getBagNum();
			int luggSum = 0;
			if (bagNum != null && bagNum.trim().length() > 0) {
				String[] bagNums = bagNum.split(";");
				luggSum = bagNums.length;
				bagNum = "";
				for (int i = 0;i < bagNums.length;i++) {
					String bm = bagNums[i];
					if (i > 0){
						bagNum += "<br/>";
					}
					bagNum += bm;
				}
			}
			t.setLuggSum(luggSum);
			t.setBagNums(bagNum);
		}
		return tickets;
	}
	public List<OpOrdertickets> saltPointInfoCounts(com.roc.syspe.entity.OpOrderticketsKeyword kw){
		
		return dao.saltPointInfoCounts(kw);
	}
	public int getCountByFlightInfoIdSeatNum(OpOrderticketsKeyword kw) {
		return dao.getCountByFlightInfoIdSeatNum(kw);
	}
	public boolean updateStatusAtDJPForSeatNum(OpOrderticketsKeyword kw) {
		return dao.updateStatusAtDJPForSeatNum(kw);
	}
	/**
	 * 1、获得航程的id 2、通过航程和年份得到航班信息id列表 3、获得航班统计结果 
	 * @param kw
	 * @return
	 */
	public List<OpOrdertickets> getFlightIds(OpOrderticketsKeyword kw) {
		return dao.getFlightIds(kw);
	}

	
	public List<OpOrdertickets> getFlightInfoIdsByYearAndFlightID(
			OpOrderticketsKeyword kw) {
		return dao.getFlightInfoIdsByYearAndFlightID(kw);
	}

	
	public List<OpOrdertickets> getThreeCounts(OpOrderticketsKeyword kw) {
		return dao.getThreeCounts(kw);
	}
	public List<OpOrdertickets> zhidengjiticketsListForException(OpOrderticketsKeyword kw){
		return dao.zhidengjiticketsListForException(kw);
	}
	/**
	 * 查看是否安检状态
	 * @param id
	 * @return
	 */
	public Integer selectStatusForOver(int id,Integer flightInfoId){
		return dao.selectStatusForOver(id,flightInfoId);
	}
	/**
	 * 更改状态为结束7
	 * @param id
	 * @return
	 */
	public Integer updateStatusOver(int id){
		return dao.updateStatusOver(id);
	}
}
