package com.roc.sysmanager.base.impl;

import java.util.List;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;
import com.roc.enp.entity.OpUseroper;
import com.roc.sysmanager.base.dao.OpOrderticeetsDao;
import com.roc.sysmanager.base.service.ClienService;
import com.roc.sysmanager.dwr.SingleInstanceClientSer;
import com.roc.syspe.entity.OpOrdertickets;
import com.roc.syspe.entity.OpOrderticketsKeyword;

public class OpOrderticketsImpl extends SqlMapDaoTemplate implements OpOrderticeetsDao{

	public OpOrderticketsImpl(DaoManager daoManager) {
		super(daoManager);
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<OpOrdertickets> getOrderticketsList(
			OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return queryForList("orderticketsList", keyword);
	}

	@Override
	public List<OpOrdertickets> getBaFlightInfoList(
			OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return queryForList("baFlightInfoList", keyword);
	}

	@Override
	public List<OpOrdertickets> groupTiecketCount(OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return queryForList("groupTiecketCount", keyword);
	}

	@Override
	public OpOrdertickets getbaFlightInfoForIn(OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return (OpOrdertickets)queryForObject("getbaFlightInfoForIn", keyword);
	}

	@Override
	public boolean editOpOrderticket(OpOrdertickets ordertickets,com.roc.enp.entity.OpUseroper userOper) {
		try{
			this.daoManager.startTransaction();
			update("editOpOrderticket", ordertickets);
			insert("insertOpUseroperInfo",userOper);
			this.daoManager.commitTransaction();
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
			this.daoManager.endTransaction();
		}
	}

	@Override
	public int insertOpOrderticket(OpOrdertickets ordertickets,com.roc.enp.entity.OpUseroper userOper) {
		try{
			this.daoManager.startTransaction();
			Integer id = (Integer)insert("insertOpOrderticket",ordertickets);
			userOper.setOrderId(id);
			insert("insertOpUseroperInfo",userOper);
			this.daoManager.commitTransaction();
			return id;
		}catch(Exception e){
			
			e.printStackTrace();
			return 0;
		}finally{
			this.daoManager.endTransaction();
		}
		
	}

	@Override
	public boolean insertOpUseroperInfo(OpUseroper opuseroper) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean tgOpOrderticket(OpOrdertickets ordertickets,
			OpUseroper userOper) {
		try{
			this.daoManager.startTransaction();
			update("tgOpOrderticket", ordertickets);
			insert("insertOpUseroperInfo",userOper);
			this.daoManager.commitTransaction();
			return true;
		}catch(Exception e){
			
			e.printStackTrace();
			return false;
		}finally{
			this.daoManager.endTransaction();
		}
	}

	@Override
	public boolean tpOrtdOpOrderticket(OpOrdertickets ordertickets,
			OpUseroper userOper) {
		try{
			this.daoManager.startTransaction();
			update("tpOrtdOpOrderticket", ordertickets);
			insert("insertOpUseroperInfo",userOper);
			this.daoManager.commitTransaction();
			return true;
		}catch(Exception e){			
			e.printStackTrace();
			return false;
		}finally{
			this.daoManager.endTransaction();
		}
	}

	@Override
	public List<OpOrdertickets> zhidengjiticketsList(OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return queryForList("zhidengjiticketsList", keyword);
	}

	@Override
	public boolean updateForDjp(OpOrdertickets ordertickets, OpUseroper userOper) {
		// TODO Auto-generated method stub
		try{
			if(userOper!=null){
				this.daoManager.startTransaction();
				update("updateForDjp", ordertickets);
				insert("insertOpUseroperInfo",userOper);
				
				this.daoManager.commitTransaction();
			}else{
				update("updateForDjp", ordertickets);
			}
			return true;
		}catch(Exception e){			
			e.printStackTrace();
			return false;
		}finally{
			if(userOper!=null){
				this.daoManager.endTransaction();
			}
		}
	}

	@Override
	public boolean bentchUpFlightNo(OpOrdertickets op) {
		try{
			update("bentchUpFlightNo", op);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<OpOrdertickets> userInfoCounts(OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return queryForList("userInfoCounts", keyword);
	}

	@Override
	public List<OpOrdertickets> userUnitInList(OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return queryForList("userUnitInList", keyword);
	}

	@Override
	public Integer userOperLogCount(OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return (Integer)queryForObject("userOperLogCount", keyword);
	}
	
	@Override
	public Integer CustomerLogCount(OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return (Integer)queryForObject("customerLogCount", keyword);
	}

	@Override
	public List<OpOrdertickets> userOperLogList(OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return queryForList("userOperLogList", keyword);
	}

	@Override
	public List<OpOrdertickets> customerLogList(OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return queryForList("customerLogList", keyword);
	}
	
	@Override
	public List<OpOrdertickets> flightInfoSeatNumList(
			OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return queryForList("flightInfoSeatNumList", keyword);
	}
/**
 * 通过航程id和时间来统计信息
 */
	@Override
	public List<OpOrdertickets> getAllCountInfoForUnits(
			OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return queryForList("getAllCountInfoForUnits", keyword);
	}

	@Override
	public Integer isHasSeat(OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return (Integer)queryForObject("isHasSeat", keyword);
	}
public List<OpOrdertickets> queryByFlightInfoId(String flightInfoIds) {
		return queryForList("queryByFlightInfoId",flightInfoIds);
	}

	public Integer updateStatusAtDJP(int id) {
		return (Integer)update("updateStatusAtDJP", id);
	}
	/**
	 * 更改状态为结束7
	 * @param id
	 * @return
	 */
	public Integer updateStatusOver(int id) {
		return (Integer)update("updateStatusOver", id);
	}
	public Integer selectStatusByCustomerId(int id,String flightInfoIds) {
		OpOrderticketsKeyword keyword = new OpOrderticketsKeyword();
		keyword.setId(id);
		keyword.setSeleFlightInfos(flightInfoIds);
		return (Integer)queryForObject("selectStatusByCustomerId", keyword);
	}
	/**
	 * 查看是否安检状态
	 * @param id
	 * @return
	 */
	public Integer selectStatusForOver(int id,String flightInfoIds) {
		OpOrderticketsKeyword keyword = new OpOrderticketsKeyword();
		keyword.setId(id);
		keyword.setSeleFlightInfos(flightInfoIds);
		return (Integer)queryForObject("selectStatusForOver", keyword);
	}
	public Integer mainPageForDJP(OpOrderticketsKeyword keyword) {
		return (Integer)queryForObject("mainPageForDJP", keyword);
	}
	
	public List<OpOrdertickets> listForReserveDJP(OpOrderticketsKeyword keyword) {
		return queryForList("listForReserveDJP", keyword);
	} 
	
	public List<OpOrdertickets> listForChargeDJP(OpOrderticketsKeyword keyword) {
		return queryForList("listForChargeDJP", keyword);
	}

	public List<OpOrdertickets> listForChargedDJP(OpOrderticketsKeyword keyword) {
		return queryForList("listForChargedDJP", keyword);
	}
	/**
	 * 登机扫描完成，进入隔离厅的成个信息列表
	 */
	public List<OpOrdertickets> listForInFly(OpOrderticketsKeyword keyword) {
		return queryForList("listForInFly", keyword);
	}
	@Override
	public Integer authInfoIsHas(OpOrderticketsKeyword keyword) {
		// TODO Auto-generated method stub
		return (Integer)queryForObject("authInfoIsHas", keyword);
	}
/**
 * 获得订票信息的状态防止误操作
 */
	@Override
	public String getOrderStatus(Integer id) {
		// TODO Auto-generated method stub
		return queryForObject("getOrderStatus", id)==null?"":(String)queryForObject("getOrderStatus", id);
	}

@Override
public OpOrdertickets orderticketsBagNum(OpOrdertickets opOrdertickets) {
	// TODO Auto-generated method stub
	return (OpOrdertickets)queryForObject("orderticketsBagNum", opOrdertickets);
}

@Override
public boolean updateBagnum(OpOrdertickets opOrdertickets) {
	// TODO Auto-generated method stub
	boolean b = true;
	try{
		update("updateBagnum", opOrdertickets);
	}catch(Exception e){
		e.printStackTrace();
		b = false;
	}
	return b;
}

@Override
public List<OpOrdertickets> teamSaltOrUpList(OpOrderticketsKeyword keyword) {
	// TODO Auto-generated method stub
	return queryForList("teamSaltOrUpList", keyword);
}
/**
 * 团队集体售票
 */
@Override
public boolean saltTeamTickets(List<OpOrdertickets> teamInfoList,
		OpUseroper userOper) {
	// TODO Auto-generated method stub
	try{
		
			this.daoManager.startTransaction();
			for(OpOrdertickets op:teamInfoList){
				if(this.getOrderStatus(op.getId()).equals("0")||this.getOrderStatus(op.getId()).equals("1")){
					update("editOpOrderticket", op);
					userOper.setOrderId(op.getId());
					insert("insertOpUseroperInfo",userOper);
					
				}else{
					return false;
				}
				
			}
			this.daoManager.commitTransaction();
		
		return true;
	}catch(Exception e){			
		e.printStackTrace();
		return false;
	}finally{
		if(userOper!=null){
			this.daoManager.endTransaction();
		}
	}
}
/**
 * 获得订票信息的状态防止误操作
 * @param id
 * @return
 */
private String getOrderStatus(Integer id,String status){
	ClienService service =  SingleInstanceClientSer.getClientService().getService();
	StringBuffer nowStatus = new  StringBuffer("");
	nowStatus.append(service.getOrderStatus(id));
	return nowStatus.toString();
}

@Override
public List<OpOrdertickets> teamDjpList(OpOrderticketsKeyword kw) {
	// TODO Auto-generated method stub
	return queryForList("teamDjpList", kw);
}

	@Override
	public boolean updateForDjpTeam(List<OpOrdertickets> orderList,
			String[] seatNums, OpUseroper userOper) {
		// TODO Auto-generated method stub
		try{
				
				this.daoManager.startTransaction();
				
				for(OpOrdertickets op:orderList){
					
					update("updateForDjp", op);
					userOper.setOrderId(op.getId());
					insert("insertOpUseroperInfo",userOper);
				}
				
				this.daoManager.commitTransaction();
			
			return true;
		}catch(Exception e){			
			e.printStackTrace();
			return false;
		}finally{
			if(userOper!=null){
				this.daoManager.endTransaction();
			}
		}
	}

	@Override
	public List<OpOrdertickets> allInfoList(OpOrderticketsKeyword kw) {
		// TODO Auto-generated method stub
		return this.queryForList("allInfoList", kw);
	}

	@Override
	public List<OpOrdertickets> saltPointInfoCounts(OpOrderticketsKeyword kw) {
		// TODO Auto-generated method stub
		return this.queryForList("saltPointInfoCounts", kw);
	}

	@Override
	public int getCountByFlightInfoIdSeatNum(OpOrderticketsKeyword kw) {
		// TODO Auto-generated method stub
		return Integer.valueOf(this.queryForObject("getCountByFlightInfoIdSeatNum", kw).toString());
	}

	@Override
	public boolean updateStatusAtDJPForSeatNum(OpOrderticketsKeyword kw) {
		// TODO Auto-generated method stub
		return this.update("updateStatusAtDJPForSeatNum", kw)>0;
	}

	@Override
	public List<OpOrdertickets> getFlightIds(OpOrderticketsKeyword kw) {
		// TODO Auto-generated method stub
		return this.queryForList("getFlightIds", kw);
	}

	@Override
	public List<OpOrdertickets> getFlightInfoIdsByYearAndFlightID(
			OpOrderticketsKeyword kw) {
		// TODO Auto-generated method stub
		return this.queryForList("getFlightInfoIdsByYearAndFlightID", kw);
	}

	@Override
	public List<OpOrdertickets> getThreeCounts(OpOrderticketsKeyword kw) {
		// TODO Auto-generated method stub
		return this.queryForList("getThreeCounts", kw);
	}
	@Override
	public List<OpOrdertickets> zhidengjiticketsListForException(OpOrderticketsKeyword kw) {
		// TODO Auto-generated method stub
		return queryForList("zhidengjiticketsListForException", kw);
	}
}
