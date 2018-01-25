package com.roc.sysmanager.base.service;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.founder.enp.persistence.DaoConfig;
import com.founder.enp.service.DepartMentService;
import com.ibatis.dao.client.DaoManager;
import com.roc.sysmanager.base.dao.BaTicketsallocDao;
import com.roc.syspe.entity.BaTicketsalloc;
import com.roc.syspe.entity.BaTicketsallocKeyword;
import com.roc.syspe.entity.Bagnum;

public class BaTicketsallocService {
	private static Log log = LogFactory.getLog(DepartMentService.class);
	private DaoManager daoMgr;
	private BaTicketsallocDao dao;	
	public BaTicketsallocService()
	{
		daoMgr = null;
		dao = null;
		try {
			daoMgr = DaoConfig.getDaoManager();
			dao = (BaTicketsallocDao) daoMgr.getDao(BaTicketsallocDao.class);
		} catch (Exception ex) {
			log.error((new StringBuilder(
					"\u521B\u5EFAdaomanager\u51FA\u73B0\u5F02\u5E38")).append(
					ex.getMessage()).toString());
		}
	}
	
	
	public boolean bentchAddBaTicketsalloc(String startDate,String endDate,String[] weeks,BaTicketsalloc baTicketsalloc) {
		
		return dao.bentchAddBaTicketsalloc(startDate, endDate,weeks, baTicketsalloc);
	}

	
	public boolean editDeleBaTicketsalloc(BaTicketsalloc baTicketsalloc) {
		// TODO Auto-generated method stub
		return dao.editDeleBaTicketsalloc(baTicketsalloc);
	}

	
	public List<BaTicketsalloc> getBaTicketsalloc(BaTicketsallocKeyword keyword) {
		// TODO Auto-generated method stub
		return dao.getBaTicketsalloc(keyword);
	}
	public int getBaTicketsallocCount(BaTicketsallocKeyword keyword) {
		return dao.getBaTicketsallocCount(keyword);
	}

	
	public boolean updateBaTicketsalloc(BaTicketsalloc baTicketsalloc) {
		// TODO Auto-generated method stub
		return dao.updateBaTicketsalloc(baTicketsalloc);
	}
	public boolean addBaTicketsalloc(BaTicketsalloc baTicketsalloc){
		try{
			dao.addBaTicketsalloc(baTicketsalloc);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
	public int getTSCount(BaTicketsallocKeyword keyword) {
		return dao.getTSCount(keyword);
	}
	/**
	 * 获得个订票点票额分配及锁定数据
	 * @param keyword
	 * @return
	 */
	public List<BaTicketsalloc> getForSeleCountList(BaTicketsallocKeyword keyword) {
		return dao.getForSeleCountList(keyword);
	}
	
	public List<BaTicketsalloc> piaoEFenPei(BaTicketsallocKeyword keyword){
		return dao.piaoEFenPei(keyword);
	}
	/**
	 * 票额调配
	 * @param ids 分配票额信息的ids
	 * @param amounts
	 * @param ticketsalloc
	 * @return
	 */
	public boolean editTicketsallocAmount(String[] ids,String[] amounts,BaTicketsalloc ticketsalloc) {
		return dao.editTicketsallocAmount(ids, amounts, ticketsalloc);
	}
	
	public boolean editBagnum(Bagnum bagnum) {
		
		return dao.editBagnum(bagnum);
	}

	
	public List<Bagnum> getBagnumList(Bagnum bagnum) {
		
		return dao.getBagnumList(bagnum);
	}

	
	public boolean insertBagnum(Bagnum bagnum) {
		return dao.insertBagnum(bagnum);
	}
}
