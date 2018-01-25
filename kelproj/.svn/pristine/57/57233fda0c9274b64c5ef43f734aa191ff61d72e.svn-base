package com.roc.sysmanager.base.dao;

import java.util.List;

import com.roc.sysmanager.base.service.BaTicketsallocService;
import com.roc.syspe.entity.BaTicketsalloc;
import com.roc.syspe.entity.BaTicketsallocKeyword;
import com.roc.syspe.entity.Bagnum;


public interface BaTicketsallocDao {
	public List<BaTicketsalloc> getBaTicketsalloc(BaTicketsallocKeyword keyword);
	public int getBaTicketsallocCount(BaTicketsallocKeyword keyword);
	public void addBaTicketsalloc(BaTicketsalloc baTicketsalloc);
	public boolean updateBaTicketsalloc(BaTicketsalloc baTicketsalloc);
	public boolean editDeleBaTicketsalloc(BaTicketsalloc baTicketsalloc);
	public boolean bentchAddBaTicketsalloc(String startDate,String endDate,String[] weeks,BaTicketsalloc baTicketsalloc);
	
	public int getTSCount(BaTicketsallocKeyword keyword);
	
	List<BaTicketsalloc> getForSeleCountList(BaTicketsallocKeyword keyword);
	
	List<BaTicketsalloc> piaoEFenPei(BaTicketsallocKeyword keyword);
	
	boolean editTicketsallocAmount(String[] ids,String[] amounts,BaTicketsalloc ticketsalloc);
	
	public List<Bagnum> getBagnumList(Bagnum bagnum);
	public boolean insertBagnum(Bagnum bagnum);
	public boolean editBagnum(Bagnum bagnum);
}
