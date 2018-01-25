package com.roc.sysmanager.base.dao;

import java.util.List;

import com.ibatis.dao.client.Dao;
import com.roc.enp.entity.BaFlight;
import com.roc.enp.entity.BaFlightKeyWord;
import com.roc.enp.entity.BaTicketpoint;
import com.roc.enp.entity.BaTicketpointKeyword;
import com.roc.enp.entity.BaTicketprice;
import com.roc.enp.entity.BaTicketpriceKeyword;

public interface BaFlightDao extends Dao{
	public Integer addBaFlight(BaFlight flight);
	public boolean updateFlight(BaFlight flight);
	public boolean editDeleBaFlight(BaFlight flight);
	public boolean deletFlight(BaFlight flight);
	public List<BaFlight> queryBaFlight(BaFlightKeyWord keyWord);
	//订票点后台管理
	public List<BaTicketpoint> queryBaTicketpoint(BaTicketpointKeyword keyword);
	public Integer addBaTicketpoint(BaTicketpoint tpoint);
	public boolean updateTicketpoint(BaTicketpoint tpoint);
	public boolean editDeleTickedpint(BaTicketpoint tpoint);
	
	//票价信息管理
	public List<BaTicketprice> queryBaTicketpriceList(BaTicketpriceKeyword keyword);
	public Integer addBaTicketprice(BaTicketprice tp);
	public boolean updateTicketprice(BaTicketprice tp);
	public boolean editDeleTicketprice(BaTicketprice tp);
	
}
