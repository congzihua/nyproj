package com.roc.sysmanager.base.impl;

import java.util.List;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;
import com.roc.enp.entity.BaFlight;
import com.roc.enp.entity.BaFlightKeyWord;
import com.roc.enp.entity.BaTicketpoint;
import com.roc.enp.entity.BaTicketpointKeyword;
import com.roc.enp.entity.BaTicketprice;
import com.roc.enp.entity.BaTicketpriceKeyword;
import com.roc.sysmanager.base.dao.BaFlightDao;
import com.roc.syspe.entity.BaTicketsalloc;
import com.roc.syspe.entity.BaTicketsallocKeyword;

public class BaFlightImpl extends SqlMapDaoTemplate implements BaFlightDao {

	public BaFlightImpl(DaoManager daoManager) {
		super(daoManager);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Integer addBaFlight(BaFlight flight) {
		// TODO Auto-generated method stub
		return (Integer)insert("insertFlight", flight);
	}

	@Override
	public boolean deletFlight(BaFlight flight) {
		int i = 0;
		try{
			i = delete("deleteBaFlight", flight.getId());
		}catch(Exception e){
			e.printStackTrace();
		}
		return i>0?true:false;
	}

	@Override
	public boolean updateFlight(BaFlight flight) {
		// TODO Auto-generated method stub
		boolean b = true;
		try{
			update("editBaFlight", flight);
		}catch(Exception e){
			e.printStackTrace();
			b=false;
		}
		return b;
	}

	@Override
	public List<BaFlight> queryBaFlight(BaFlightKeyWord key) {
		// TODO Auto-generated method stub
		return queryForList("flightList",key);
	}

	@Override
	public boolean editDeleBaFlight(BaFlight flight) {
		boolean b = true;
		try{
			update("editDeleBaFlight", flight);
		}catch(Exception e){
			e.printStackTrace();
			b=false;
		}
		return b;
	}
/**
 * 订票点信息的后台管理的基础数据操作
 */
	@Override
	public List<BaTicketpoint> queryBaTicketpoint(BaTicketpointKeyword keyword) {
		// TODO Auto-generated method stub
		return queryForList("ticketPointList", keyword);
	}

@Override
public Integer addBaTicketpoint(BaTicketpoint tpoint) {
	// TODO Auto-generated method stub
	return (Integer)insert("insertTicketPoint", tpoint);
}

@Override
public boolean editDeleTickedpint(BaTicketpoint tpoint) {
	boolean b = false;
	try{
		update("editDeleTicketPoint", tpoint);
		b = true;
	}catch(Exception e){
		b = false;
		e.printStackTrace();
	}
	return b;
}

@Override
public boolean updateTicketpoint(BaTicketpoint tpoint) {
	boolean b = false;
	try{
		update("editTicketPoint", tpoint);
		b = true;
	}catch(Exception e){
		b = false;
		e.printStackTrace();
	}
	return b;
}




//**票价信息的管理
@Override
public Integer addBaTicketprice(BaTicketprice tp) {
	// TODO Auto-generated method stub
	return (Integer)insert("insertTicketprice", tp);
}

@Override
public boolean editDeleTicketprice(BaTicketprice tp) {
	// TODO Auto-generated method stub
	return update("editDeleTicketprice", tp)>0;
}

@Override
public List<BaTicketprice> queryBaTicketpriceList(BaTicketpriceKeyword keyword) {
	// TODO Auto-generated method stub
	return queryForList("ticketpriceList", keyword);
}

@Override
public boolean updateTicketprice(BaTicketprice tp) {
	// TODO Auto-generated method stub
	
	return update("editTicketprice", tp)>0;
}

}
