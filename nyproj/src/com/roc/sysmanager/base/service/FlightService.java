package com.roc.sysmanager.base.service;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.founder.enp.persistence.DaoConfig;
import com.founder.enp.service.DepartMentService;
import com.ibatis.dao.client.DaoManager;
import com.roc.enp.entity.BaFlight;
import com.roc.enp.entity.BaFlightKeyWord;
import com.roc.enp.entity.BaTicketpoint;
import com.roc.enp.entity.BaTicketpointKeyword;
import com.roc.enp.entity.BaTicketprice;
import com.roc.enp.entity.BaTicketpriceKeyword;
import com.roc.sysmanager.base.dao.BaFlightDao;

public class FlightService {
	private static Log log = LogFactory.getLog(DepartMentService.class);
	private DaoManager daoMgr;
	private BaFlightDao dao;
	
	public FlightService()
	{
		daoMgr = null;
		dao = null;
		try {
			daoMgr = DaoConfig.getDaoManager();
			dao = (BaFlightDao) daoMgr.getDao(BaFlightDao.class);
		} catch (Exception ex) {
			log.error((new StringBuilder(
					"\u521B\u5EFAdaomanager\u51FA\u73B0\u5F02\u5E38")).append(
					ex.getMessage()).toString());
		}
	}
		public Integer addBaFlight(BaFlight flight) {			
			return dao.addBaFlight(flight);
		}

		
		public boolean deletFlight(BaFlight flight) {			
			return dao.deletFlight(flight);
		}

		
		public boolean updateFlight(BaFlight flight) {			
			return dao.updateFlight(flight);
		}

		
		public List<BaFlight> queryBaFlight(BaFlightKeyWord key) {			
			return dao.queryBaFlight(key);
		}
		public boolean editDeleBaFlight(BaFlight flight) {
			
			return dao.editDeleBaFlight(flight);
		}
		/**
		 * 订票点列表查询 无分页查询
		 * @param keyword
		 * @return
		 */
		public List<BaTicketpoint> queryBaTicketpoint(BaTicketpointKeyword keyword) {
			return dao.queryBaTicketpoint(keyword);
		}
		
		public Integer addBaTicketpoint(BaTicketpoint tpoint) {
			// TODO Auto-generated method stub
			return dao.addBaTicketpoint(tpoint);
		}

		
		public boolean editDeleTickedpint(BaTicketpoint tpoint) {
			
			return dao.editDeleTickedpint(tpoint);
		}

		
		public boolean updateTicketpoint(BaTicketpoint tpoint) {
			
			return dao.updateTicketpoint(tpoint);
		}
		
		
		//**票价管理系统
		public Integer addBaTicketprice(BaTicketprice tp) {
			// TODO Auto-generated method stub
			return dao.addBaTicketprice(tp);
		}

		
		public boolean editDeleTicketprice(BaTicketprice tp) {
			// TODO Auto-generated method stub
			return dao.editDeleTicketprice(tp);
		}

		
		public List<BaTicketprice> queryBaTicketpriceList(BaTicketpriceKeyword keyword) {
			// TODO Auto-generated method stub
			return dao.queryBaTicketpriceList(keyword);
		}

		
		public boolean updateTicketprice(BaTicketprice tp) {
			// TODO Auto-generated method stub
			return dao.updateTicketprice(tp);
		}
}
