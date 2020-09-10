package com.roc.sysmanager.base.dao;

import java.util.List;

import com.roc.syspe.entity.OpOrdertickets;
import com.roc.syspe.entity.OpOrderticketsKeyword;

public interface OpOrderticeetsDao {
	public List<OpOrdertickets> getOrderticketsList(OpOrderticketsKeyword keyword);
	public List<OpOrdertickets> getBaFlightInfoList(OpOrderticketsKeyword keyword);
	
	public List<OpOrdertickets> groupTiecketCount(OpOrderticketsKeyword keyword);
	
	public OpOrdertickets getbaFlightInfoForIn(OpOrderticketsKeyword keyword);
	
	public int insertOpOrderticket(OpOrdertickets ordertickets,com.roc.enp.entity.OpUseroper userOper);
	public boolean editOpOrderticket(OpOrdertickets ordertickets,com.roc.enp.entity.OpUseroper userOper);
	public boolean insertOpUseroperInfo(com.roc.enp.entity.OpUseroper opuseroper);
	
	public boolean tgOpOrderticket(OpOrdertickets ordertickets,com.roc.enp.entity.OpUseroper userOper);
	
	public boolean tpOrtdOpOrderticket(OpOrdertickets ordertickets,com.roc.enp.entity.OpUseroper userOper);
	
	List<OpOrdertickets>  zhidengjiticketsList(com.roc.syspe.entity.OpOrderticketsKeyword keyword);
	public boolean updateForDjp(OpOrdertickets ordertickets,com.roc.enp.entity.OpUseroper userOper);
	
	public boolean bentchUpFlightNo(OpOrdertickets op);
	/**
	 * 用户统计
	 * @param keyword
	 * @return
	 */
	public List<OpOrdertickets> userInfoCounts(OpOrderticketsKeyword keyword);
	public List<OpOrdertickets> userUnitInList(OpOrderticketsKeyword keyword);
	
	public List<OpOrdertickets> userOperLogList(OpOrderticketsKeyword keyword);
	public List<OpOrdertickets> customerLogList(OpOrderticketsKeyword keyword);
	
	public Integer userOperLogCount(OpOrderticketsKeyword keyword);
	
	public Integer CustomerLogCount(OpOrderticketsKeyword keyword);
	
	public List<OpOrdertickets> flightInfoSeatNumList(OpOrderticketsKeyword keyword);
	
	public  List<OpOrdertickets> getAllCountInfoForUnits(OpOrderticketsKeyword keyword);
	public Integer isHasSeat(OpOrderticketsKeyword keyword);
	public List<OpOrdertickets> queryByFlightInfoId(String flightInfoIds);
	
	public Integer updateStatusAtDJP(int id);
	
	public Integer selectStatusByCustomerId(int id,String flightInfoIds);
	
	public Integer mainPageForDJP(OpOrderticketsKeyword keyword);
	
	public List<OpOrdertickets> listForReserveDJP(OpOrderticketsKeyword keyword);
	
	public List<OpOrdertickets> listForChargeDJP(OpOrderticketsKeyword keyword);
	
	public List<OpOrdertickets> listForChargedDJP(OpOrderticketsKeyword keyword);
	
	public Integer authInfoIsHas(OpOrderticketsKeyword keyword);
	/**
	 * 获得订票信息的状态防止误操作
	 * @param id
	 * @return
	 */
	public String getOrderStatus(Integer id);
	
	public OpOrdertickets orderticketsBagNum(com.roc.syspe.entity.OpOrdertickets opOrdertickets);
	public boolean updateBagnum(com.roc.syspe.entity.OpOrdertickets opOrdertickets);
	/**
	 * 通过航班、状态和团队名称获得团体同一状态信息
	 * @param keyword
	 * @return
	 */
	public List<OpOrdertickets> teamSaltOrUpList(OpOrderticketsKeyword keyword);
	/**
	 *批量售票的实现； 
	 */
	boolean saltTeamTickets(List<OpOrdertickets> teamInfoList,com.roc.enp.entity.OpUseroper userOper);
	
	List<OpOrdertickets> teamDjpList(OpOrderticketsKeyword kw);
	
	public boolean updateForDjpTeam(List<OpOrdertickets> orderList,String[]seatNums,com.roc.enp.entity.OpUseroper userOper);
	
	List<OpOrdertickets> allInfoList(com.roc.syspe.entity.OpOrderticketsKeyword kw);
	
	List<OpOrdertickets> saltPointInfoCounts(com.roc.syspe.entity.OpOrderticketsKeyword kw);
	int getCountByFlightInfoIdSeatNum(com.roc.syspe.entity.OpOrderticketsKeyword kw);
	boolean updateStatusAtDJPForSeatNum(com.roc.syspe.entity.OpOrderticketsKeyword kw);
	/**
	 * 获得年统计数据
	 */
	List<OpOrdertickets> getFlightIds(com.roc.syspe.entity.OpOrderticketsKeyword kw);
	List<OpOrdertickets> getFlightInfoIdsByYearAndFlightID(com.roc.syspe.entity.OpOrderticketsKeyword kw);
	List<OpOrdertickets> getThreeCounts(com.roc.syspe.entity.OpOrderticketsKeyword kw);
	
	public List<OpOrdertickets> zhidengjiticketsListForException(OpOrderticketsKeyword kw);
	
	/**
	 * 登机扫描完成，进入隔离厅的成个信息列表
	 */
	public List<OpOrdertickets> listForInFly(OpOrderticketsKeyword keyword);
	/**
	 * 查看是否安检状态
	 * @param id
	 * @return
	 */
	public Integer selectStatusForOver(int id,String flightInfoIds) ;
	/**
	 * 更改状态为结束7
	 * @param id
	 * @return
	 */
	public Integer updateStatusOver(int id);
	public List<OpOrdertickets> queryGroupOrderTicketInfos(OpOrderticketsKeyword keyword);
	public OpOrdertickets getOrderInfoByParams(String flightInfoIds, String certNo,int status);
	public List<OpOrdertickets> teamDjpListByIdCard(OpOrderticketsKeyword keyWord);

}
