package com.tempflight.dwr;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.roc.sysmanager.dwr.BagnumUtil;
import com.tempflight.entity.TempFlightinfo;
import com.tempflight.entity.TempOrdertickets;
import com.tempflight.entity.TempOrderticketsKeyword;
import com.tempflight.service.TempClienService;

public class TfSysmanagerDWR {
	public  int validate(Integer flightinfoId,
			String certType,String certNo){
		int isOrder = isAlreadyOrderTickets(flightinfoId, certType, certNo);
		if(isOrder > 0){
			return 3;//该用户已经订过票
		}
		
		return 1;//正常可以保存订票信息
	}
	private static Integer isAlreadyOrderTickets(Integer flightinfoId,String certType,String certNo){
		TempClienService cService = new TempClienService();
		TempOrderticketsKeyword okw = new TempOrderticketsKeyword();
		okw.setCertNo(certNo);
		okw.setCertType(certType);
		okw.setSeleFlightInfo(flightinfoId);
		Integer count = cService.tfAuthInfoIsHasTicketInfo(okw);
		return count;
		
	}
	/**判断订单状态是否相符**/
	public boolean getOrderStatus(Integer id,String status){
		TempClienService service =  new TempClienService();
		TempOrdertickets orderInfo = service.queryTempOrderticketsById(id);
		boolean b = false;
		if (orderInfo != null && orderInfo.getStatus() != null) {
			b = orderInfo.getStatus().equals(status);
		}
        return b;
    }
	//退票/退订
	public boolean ticketsInforeturn(Integer id,Integer status) throws ParseException{
		TempClienService service = new TempClienService();
		TempOrdertickets order = new TempOrdertickets();
		order.setId(id);
		order.setStatus(String.valueOf(status));//退票
		return service.tpTemptdOpOrderticket(order);
	}
	//换登机牌
	public String djpOrXlqSave(Integer id,String seatNum,Integer luggSum,Double weightSum,Integer fightinfoId) throws ParseException{
		TempClienService service = new TempClienService();
		if(seatNum!=null && seatNum.trim().length()>0){
			TempOrderticketsKeyword kw = new TempOrderticketsKeyword();
			kw.setId(id);
			kw.setSeatNum(seatNum.trim());
			kw.setSeleFlightInfo(fightinfoId);
			if(service.isHasSeatInTempFlight(kw)>=1){
				return "0";
			}
		}
		TempOrdertickets order = new TempOrdertickets();
		order.setId(id);
		order.setSeatNum(seatNum);
		order.setWeightSum(weightSum);
		order.setLuggSum(luggSum);
		order.setStatus("3");
		return service.updateForTempDjp(order)?"":"1";
	}
	 //换登机牌团队
  	public String djpOrXlqSaveTeam(String ids,String seatNums,Integer luggSum,Double weightSum,int flightinfoId) throws ParseException{
  		TempClienService service = new TempClienService();
  		String[] seatArray = seatNums == null ?new String[] {}:seatNums.split(",");
  		String[]idArray = ids.split(",");
  		
  		if(seatArray.length>0)
  			for(int i = 0; i < seatArray.length; i++) {
  				if(seatArray[i]!=null && seatArray[i].trim().length()>0){
  					TempOrderticketsKeyword kw = new TempOrderticketsKeyword();
  					kw.setId(0);
  					kw.setSeatNum(seatArray[i]);
  					kw.setSeleFlightInfo(flightinfoId);
  					kw.setIds(ids);
  					if(service.isHasSeatInTempFlight(kw)>=1){
  						return "0";
  					}
  				}
  			}
  		
  		List<TempOrdertickets> orderList = new ArrayList<TempOrdertickets>();
  		TempOrdertickets ol1 = null;
  		int k = 0;
  		String returnSeatArray ="";
  		for(int i =0;i <idArray.length;i++){
  			ol1 =  service.queryTempOrderticketsById(Integer.valueOf(idArray[i]));
  			TempOrdertickets order = new TempOrdertickets();
  			if("身份证".equals(ol1.getCertType())||"户口薄".equals(ol1.getCertType())){
  				String certNo = ol1.getCertNo();
  				if(certNo.length()>=18){
  					SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
  					String f = format.format(new java.util.Date());
  					int f1 = (Integer.valueOf(f.substring(0,4))-2);					
  					f= f1+f.substring(4);
  					if(Long.valueOf(f)>Long.valueOf(certNo.substring(6,14))){
  						//判断年龄是不是已经超过2岁，2岁不进行分配座位，只出登机牌
  						if(seatArray.length>0&& k<seatArray.length&&(seatArray[k]!=null && seatArray[k].trim().length()>0)){
  							order.setSeatNum(seatArray[k]);
  							k++;
  						}else{
  							order.setSeatNum(ol1.getSeatNum());
  						}
  					}
  				}
  				
  			}else{
  				if(seatArray.length>0&& k<seatArray.length&&(seatArray[k]!=null && seatArray[k].trim().length()>0)){
  					order.setSeatNum(seatArray[k]);
  					k++;
  				}else{
  					order.setSeatNum(ol1.getSeatNum());
  				}
  			}
  			returnSeatArray +=order.getSeatNum()!=null?(order.getSeatNum().trim()+","):",";
  			order.setId(Integer.valueOf(idArray[i]));
  			order.setStatus(String.valueOf(3));			
  			if (luggSum != null && luggSum == -1) {
				order.setWeightSum(ol1.getWeightSum());
				order.setLuggSum(ol1.getLuggSum());	
				luggSum = -1;
			}else {
				order.setWeightSum(weightSum);
				order.setLuggSum(luggSum);
			}
  			orderList.add(order);
  		}
  		
  		boolean b= service.updateForDjpTeam(orderList);
  		return b?returnSeatArray:"1";
  		
  	}
	//出行李签的保存信息方法
    public String xlqSave(Integer id,String seatNum,Integer luggSum,Double weightSum,Integer flightinfoId,Integer prinNum) throws ParseException{
    	TempClienService service = new TempClienService();
		if(seatNum!=null && seatNum.trim().length()>0){
			TempOrderticketsKeyword kw = new TempOrderticketsKeyword();
			kw.setId(id);
			kw.setSeatNum(seatNum.trim());
			kw.setSeleFlightInfo(flightinfoId);
			if(service.isHasSeatInTempFlight(kw)>=1){
				return "0";
			}
		}
		TempOrdertickets order = new TempOrdertickets();
		order.setId(id);
		order.setSeatNum(seatNum);
		order.setWeightSum(weightSum);
		order.setLuggSum(luggSum);
		order.setStatus("3");
		boolean b = service.updateForTempDjp(order);
		if(b){
			String r = "";
			BagnumUtil bagUtil =  BagnumUtil.getBagnumUtil();
			for(int i=0;i< prinNum;i++){
				r += bagUtil.getTFBagnum()+";";
			}
			return r.substring(0,r.length()-1);
		}else{
				return "0";
		}
	}
    public String printUpdate(Integer id,String bagNum){
		TempClienService service =  new TempClienService();
		TempOrdertickets bagNumOb = new TempOrdertickets();
		bagNumOb.setId(id);
		bagNumOb.setBagNum((bagNumOb.getBagNum()==null||bagNumOb.getBagNum().trim().equals("")?bagNum:(bagNumOb.getBagNum().trim()+";"+bagNum)));
		service.updateTempOrdersBagnum(bagNumOb);
		return "1";
	}
 
    //出行李签团队
    public String xlqSaveTeam(String ids,String seatNums,Integer luggSum,Double weightSum,int flightinfoId,Integer prinNum) throws ParseException{
    	TempClienService service = new TempClienService();
		String[] seatArray = seatNums == null ?new String[] {}:seatNums.split(",");
		String[]idArray = ids.split(",");
			
		if(seatArray.length>0)
			for(int i = 0; i < seatArray.length; i++){
  				if(seatArray[i]!=null && seatArray[i].trim().length()>0){
  					TempOrderticketsKeyword kw = new TempOrderticketsKeyword();
  					kw.setId(0);
  					kw.setSeatNum(seatArray[i]);
  					kw.setSeleFlightInfo(flightinfoId);
  					kw.setIds(ids);
  					if(service.isHasSeatInTempFlight(kw)>=1){
  						return "0";
  					}
  				}
  			}
		
		List<TempOrdertickets> orderList = new ArrayList<TempOrdertickets>();
  		TempOrdertickets ol1 = null;
		int k = 0;
		String returnSeatArray ="";
		for(int i =0;i <idArray.length;i++){
			ol1 =  service.queryTempOrderticketsById(Integer.valueOf(idArray[i]));
  			TempOrdertickets order = new TempOrdertickets();
			if("身份证".equals(ol1.getCertType())||"户口薄".equals(ol1.getCertType())){
				String certNo = ol1.getCertNo();
				if(certNo.length()>=18){
					SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
					String f = format.format(new java.util.Date());
					int f1 = (Integer.valueOf(f.substring(0,4))-2);					
					f= f1+f.substring(4);
					if(Long.valueOf(f)>Long.valueOf(certNo.substring(6,14))){
						//判断年龄是不是已经超过2岁，2岁不进行分配座位，只出登机牌
						if(seatArray.length>0&& k<seatArray.length&&(seatArray[k]!=null && seatArray[k].trim().length()>0)){
							order.setSeatNum(seatArray[k]);
							k++;
						}else{
							order.setSeatNum(ol1.getSeatNum());
						}
					}
			}else{
				if(seatArray.length>0&& k<seatArray.length&&(seatArray[k]!=null && seatArray[k].trim().length()>0)){
					order.setSeatNum(seatArray[k]);
					k++;
				}else{
					order.setSeatNum(ol1.getSeatNum());
				}
			}
					
		}else{
			if(seatArray.length>0&& k<seatArray.length&&(seatArray[k]!=null && seatArray[k].trim().length()>0)){
				order.setSeatNum(seatArray[k]);
				k++;
			}else{
				order.setSeatNum(ol1.getSeatNum());
			}
		}
			returnSeatArray +=order.getSeatNum()!=null?(order.getSeatNum().trim()+","):",";
			order.setId(Integer.valueOf(idArray[i]));
			order.setStatus(3+"");			
			order.setWeightSum(weightSum);
			order.setLuggSum(luggSum);			
			orderList.add(order);
		}
		boolean b= service.updateForDjpTeam(orderList);
		if(b){
			String r = "";
			BagnumUtil bagUtil =  BagnumUtil.getBagnumUtil();
			for(int i=0;i< prinNum;i++){
				r += bagUtil.getBagnum()+";";
			}
			return r.substring(0,r.length()-1);
		}else{
			return "0";
		}
    }
    /**验证用户身份是否可以进行换登/售票机牌**/
	public String getOrderIdAndType(Integer flightInfoId,String certNo,int status) {
		TempClienService service = new TempClienService();
		TempOrderticketsKeyword kw = new TempOrderticketsKeyword();
		kw.setSeleFlightInfo(flightInfoId);
		kw.setCertNo(certNo);
		kw.setCertType("身份证");
		TempOrdertickets ticket = service.tfAuthInfoTicketInfo(kw);
		String orderIdAndTeamFlag = null;
		if (ticket != null && ticket.getId() != null && (ticket.getStatus().equals("2") || ticket.getStatus().equals("3") || ticket.getStatus().equals("4"))) {
			String teamName = ticket.getTeamName();
			orderIdAndTeamFlag = ticket.getId()+";"+(ticket.getTeamflag() == null?"0":ticket.getTeamflag())
					+";"+ticket.getStatus()+";"+flightInfoId+";"+teamName;
		}
		
		return orderIdAndTeamFlag;
	}
	public String printUpdateTeam(String ids,String bagNum){
		TempClienService service =  new TempClienService();
		TempOrdertickets bagNumOb = new TempOrdertickets();
		for(int i = 0; i< ids.split(",").length;i++){
			bagNumOb.setId(Integer.valueOf(ids.split(",")[i]));
			bagNumOb.setBagNum((bagNumOb.getBagNum()==null||bagNumOb.getBagNum().trim().equals("")?bagNum:(bagNumOb.getBagNum().trim()+";"+bagNum)));
			service.updateTempOrdersBagnum(bagNumOb);
		}
		return "1";
	}
	public int updateOrAddTempFlightinfo(Integer id,String origin,String flightInfo,String flightNo,String gateNo,String flightDate,String flyTime) {
		TempFlightinfo bean = new TempFlightinfo();
		bean.setId(id);
		bean.setCreateTime(new Date());
		bean.setDeleteFlag(0);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			bean.setFlightDate(format.parse(flightDate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		bean.setFlightInfo(flightInfo);
		bean.setFlightNo(flightNo);
		bean.setFlyTime(flyTime);
		bean.setGateNo(gateNo);
		bean.setOrigin(origin);
		TempClienService sercie = new TempClienService();
		int rel = -1;
		TempOrderticketsKeyword keyword = new TempOrderticketsKeyword();
		keyword.setSeleDate(flightDate);
		keyword.setFlyTime(flyTime);
		//查看是否存在航班信息
		List<TempFlightinfo> flightInfos = sercie.tempFlightInfoList(keyword);
		if (id == null || id == 0) {
			if (flightInfos !=null && flightInfos.size() >0) {
				rel = -3;
			}else
				rel = sercie.insertTempFlightinfo(bean);
		}else {
			if(flightInfos != null && flightInfos.size() > 0) {
				for (TempFlightinfo tempBean :flightInfos) {
					Integer tId = tempBean.getId();
					int delFlag = tempBean.getDeleteFlag();
					if (!id.equals(tId) && delFlag == 0) {
						rel = -2;
					}
				}
			}
			if (rel != -2)
				rel =  sercie.editTempFlightinfo(bean);
		}
		return rel;
	}
}
