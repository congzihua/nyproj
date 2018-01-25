package com.roc.sysmanager.base.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;
import com.roc.enp.entity.FlightInfo;
import com.roc.sysmanager.base.dao.BaTicketsallocDao;
import com.roc.syspe.entity.BaTicketsalloc;
import com.roc.syspe.entity.BaTicketsallocKeyword;
import com.roc.syspe.entity.Bagnum;

public class BaTicketsallocImpl extends SqlMapDaoTemplate implements BaTicketsallocDao {

	public BaTicketsallocImpl(DaoManager daoManager) {
		super(daoManager);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void addBaTicketsalloc(BaTicketsalloc baTicketsalloc) {
		insert("insertTicketsalloc",baTicketsalloc);		
	}

	@Override
	public boolean bentchAddBaTicketsalloc(String startDate,String endDate,String[] weeks,BaTicketsalloc baTicketsalloc) {
		// TODO Auto-generated method stub
		SimpleDateFormat formate = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date beginDate = null;
		java.util.Date eDate = null,date = null;
		long  days = 0;
		boolean b = false;
		BaTicketsallocKeyword keyword = new BaTicketsallocKeyword();
		try
		{
			beginDate = formate.parse(startDate);
			eDate= formate.parse(endDate); 
			days=(eDate.getTime() - beginDate.getTime())/(24*60*60*1000); 
			
		} catch (ParseException e)
		{
			// TODO 自动生成 catch 块
			e.printStackTrace();
			b = false;
		} 
		
//		while(cale1.getTimeInMillis()< cale2.getTimeInMillis()){
//			int we=cale1.get(Calendar.DAY_OF_WEEK);
//			for(String w:weekArr){
//					if(we==Integer.parseInt(w)){
//						int count=0;
//						String cale1_s=sdf.format(cale1.getTime());
//						for(FlightInfo fi:oldList){
//							String flydate_s=sdf.format(fi.getFlight_date());
//							if(flightId==fi.getFlight_id()&&flyTime.equals(fi.getFly_time())&&cale1_s.equals(flydate_s)){
//								count++;
//								break;
//							}
//						}
//						if(count==0){
//							FlightInfo flightinfo= new FlightInfo();
//							flightinfo.setDelete_Flag("0");
//							flightinfo.setFlight_id(flightId);
//							flightinfo.setFly_time(flyTime);
//							flightinfo.setFlight_name(flightName);
//							flightinfo.setFlight_date(cale1.getTime());
//							flightinfo.setCreatedate(new Date());
//							fiList.add(flightinfo);
//						}
//				}
//				
//			}
//			cale1.add(Calendar.DAY_OF_YEAR, 1);
//		}
		
		
		
		try{
			this.startBatch();
			keyword.setFlightId(baTicketsalloc.getFlightId());
			keyword.setTicketpointId(baTicketsalloc.getTicketpointId());
			keyword.setOrdertime(baTicketsalloc.getOrdertime());
			int cun = 0;
			for(long i = 0;i <= days;i++){
				date = new Date(beginDate.getTime() +i * 24 * 60 * 60 * 1000);
				Calendar cale1=Calendar.getInstance();
				cale1.setTime(date);
				int we=cale1.get(Calendar.DAY_OF_WEEK);
				if(weeks!=null && weeks.length > 0){
					for(String w:weeks){
						if(we==Integer.parseInt(w)){
							keyword.setOrderdate(formate.format(date));
							cun = this.getTSCount(keyword);
							
							if(cun<1){
								baTicketsalloc.setOrderdate(date);
								insert("insertTicketsalloc",baTicketsalloc);
							}
						}
					}
				}else{
					keyword.setOrderdate(formate.format(date));
					cun = this.getTSCount(keyword);					
					if(cun<1){
						baTicketsalloc.setOrderdate(date);
						insert("insertTicketsalloc",baTicketsalloc);
					}					
				}
			}
			this.executeBatch();
			b = true;
		}catch (Exception e){
			e.printStackTrace();
			
		}
		return b;
	}

	@Override
	public boolean editDeleBaTicketsalloc(BaTicketsalloc baTicketsalloc) {
		// TODO Auto-generated method stub
		return update("editDeleTicketsalloc", baTicketsalloc)>0;
	}

	@Override
	public List<BaTicketsalloc> getBaTicketsalloc(BaTicketsallocKeyword keyword) {
		// TODO Auto-generated method stub
		return queryForList("ticketsallocList", keyword);
	}

	@Override
	public boolean updateBaTicketsalloc(BaTicketsalloc baTicketsalloc) {
		// TODO Auto-generated method stub
		return update("editTicketsalloc",baTicketsalloc)>0;
	}
	public static void main(String[]args){
		 Date beforeDate = new Date(new Date().getTime() - 2 * 24 * 60 * 60 * 1000);    
   
		 System.out.println(beforeDate);

	}

	@Override
	public int getBaTicketsallocCount(BaTicketsallocKeyword keyword) {
		// TODO Auto-generated method stub
		return (Integer)queryForObject("getBaTicketsallocCount", keyword);
	}

	@Override
	public int getTSCount(BaTicketsallocKeyword keyword) {
		// TODO Auto-generated method stub
		return (Integer)queryForObject("getTSCount",keyword);
	}

	@Override
	public List<BaTicketsalloc> getForSeleCountList(
			BaTicketsallocKeyword keyword) {
		// TODO Auto-generated method stub
		return queryForList("forSeleCountList", keyword);
	}

	@Override
	public List<BaTicketsalloc> piaoEFenPei(BaTicketsallocKeyword keyword) {
		return queryForList("piaoEFenPei", keyword);
	}

	@Override
	public boolean editTicketsallocAmount(String[] ids,String[] amounts,BaTicketsalloc ticketsalloc) {
		this.startBatch();
		
		try{
			for(int i = 0; i < ids.length;i++){
				ticketsalloc.setId(Integer.valueOf(ids[i]));
				ticketsalloc.setAmount(Integer.valueOf(amounts[i]));
				update("editTicketsallocAmount", ticketsalloc);				
			}
		this.executeBatch();
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean editBagnum(Bagnum bagnum) {
		// TODO Auto-generated method stub
		boolean b = true;
		try{
			update("editBagnum", bagnum);			
		}catch(Exception e){
			e.printStackTrace();
			 b = false;
		}
		return b;
	}

	@Override
	public List<Bagnum> getBagnumList(Bagnum bagnum) {
		// TODO Auto-generated method stub
		return queryForList("getBagnumList", bagnum);
	}

	@Override
	public boolean insertBagnum(Bagnum bagnum) {
		// TODO Auto-generated method stub
		boolean b = true;
		try{
			insert("insertBagnum", bagnum);			
		}catch(Exception e){
			e.printStackTrace();
			 b = false;
		}
		return b;
	}
	
}
