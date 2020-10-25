package com.roc.sysmanager.dwr;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.flyticket.system.util.ArgsUnit;
import com.founder.enp.entity.User;
import com.founder.enp.service.UserService;
import com.roc.enp.entity.BaFlight;
import com.roc.enp.entity.BaTicketpoint;
import com.roc.enp.entity.BaTicketprice;
import com.roc.enp.entity.BaTicketpriceKeyword;
import com.roc.enp.entity.BlackUserKeyword;
import com.roc.enp.entity.BlacklistUser;
import com.roc.enp.entity.OpUseroper;
import com.roc.sysmanager.base.action.ExcelUtil;
import com.roc.sysmanager.base.service.BaTicketsallocService;
import com.roc.sysmanager.base.service.BlacklistUserService;
import com.roc.sysmanager.base.service.ClienService;
import com.roc.sysmanager.base.service.FlightService;
import com.roc.syspe.entity.BaTicketsalloc;
import com.roc.syspe.entity.BaTicketsallocKeyword;
import com.roc.syspe.entity.OpOrdertickets;
import com.roc.syspe.entity.OpOrderticketsKeyword;

public class SysmanagerDWR {
	public boolean addFlight(String flight,String englishname){
		BaFlight bf = new BaFlight();
		bf.setFlight(flight);
		bf.setEnglishname(englishname);
		
		FlightService service = new FlightService();
		return service.addBaFlight(bf)>0;
	}
	public boolean editFlight(Integer id,String flight,String englishname){
		BaFlight bf = new BaFlight();
		bf.setFlight(flight);
		bf.setEnglishname(englishname);
		bf.setId(id);
		FlightService service = new FlightService();
		return service.updateFlight(bf);
	}
	//--------------------------
	//订票点信息维护
	public boolean addTicketpoint(String name,String telephone){
		BaTicketpoint bt = new BaTicketpoint();
		bt.setName(name);
		bt.setTelephone(telephone);
		FlightService service = new FlightService();
		return service.addBaTicketpoint(bt)>0;
	}
	public boolean editTicketpoint(Integer id,String name,String telephone){
		BaTicketpoint bt = new BaTicketpoint();
		bt.setName(name);
		bt.setTelephone(telephone);
		bt.setId(id);
		FlightService service = new FlightService();
		
		return service.updateTicketpoint(bt);
	}
	
	//--------------------------
	//各航线票价信息维护
	public boolean addTicketprice(Integer flightId,String discountType,Double realAmount){
		BaTicketprice bt = new BaTicketprice();
		bt.setDiscountType(discountType);
		bt.setFlightId(flightId);
		bt.setRealAmount(realAmount);
		FlightService service = new FlightService();
		return service.addBaTicketprice(bt)>0;
	}
	public boolean editTicketprice(Integer id,String discountType,Double realAmount){
		BaTicketprice bt = new BaTicketprice();
		bt.setId(id);
		bt.setDiscountType(discountType);		
		bt.setRealAmount(realAmount);
		FlightService service = new FlightService();
		
		return service.updateTicketprice(bt);
	}
	//--------------------------
	//各订票点票额信息维护
	public int addTicketsalloc(Integer flightId,Integer ticketpointId,String orderdate,String ordertime,Integer amount) throws ParseException{
		BaTicketsalloc bt = new BaTicketsalloc();
		bt.setAmount(amount);
		bt.setFlightId(flightId);
		bt.setTicketpointId(ticketpointId);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date = format.parse(orderdate);
		BaTicketsallocKeyword kw = new BaTicketsallocKeyword();
		kw.setFlightId(flightId);
		kw.setTicketpointId(ticketpointId);
		kw.setOrderdate(orderdate);
		kw.setOrdertime(ordertime);
		bt.setOrderdate(date);
		bt.setOrdertime(ordertime);
		bt.setLockednum(0);
		
		BaTicketsallocService service = new BaTicketsallocService();
		if(service.getTSCount(kw)>1){
			return 0;
		}
		int i = 0;
		boolean b = service.addBaTicketsalloc(bt);
		if(b){
			i = 1;
		}else{
			i= 2;
		}
		return i;
		
	}
	//	--------------------------
	//票额分配
	public String searchForFenPei(int flightId,String orderdate,String ordertime){
		BaTicketsallocKeyword bt=new BaTicketsallocKeyword();
		bt.setFlightId(flightId);
		bt.setOrderdate(orderdate);
		bt.setOrdertime(ordertime);
		BaTicketsallocService service=new BaTicketsallocService();
		List<BaTicketsalloc> list=service.piaoEFenPei(bt);
		if(list==null||list.size()==0){
			return "nodata";
		}
		Iterator<BaTicketsalloc> iter=list.iterator();
		StringBuffer sb=new StringBuffer();
		int sum = 0;
		while (iter.hasNext()) {
			BaTicketsalloc element = (BaTicketsalloc) iter.next();
			String name=element.getName();
			int amount=element.getAmount();
			sum +=amount;
			sb.append(name);
			sb.append(",");
			sb.append(amount);
			sb.append(",");			
			sb.append(element.getId());//要修改的id
			sb.append("-");
		}
		
		return sb.toString().substring(0, sb.toString().length()-1);
	}
	
	//--------------------------
	//票额锁定修改
	public boolean ticketsallocLocket(Integer id,Integer lockednum) throws ParseException{
		BaTicketsalloc bt = new BaTicketsalloc();
		bt.setId(id);
		bt.setLockednum(lockednum);
		BaTicketsallocService service = new BaTicketsallocService();
		return service.updateBaTicketsalloc(bt);		
	}
	//--------------------------
	//改签
	public int ticketsDateUpdate(Integer id,Integer flightId,Integer orderTicketPointId,Integer userId,String upDate,String flyTime,String status,String origStatus) throws ParseException{
		
		ClienService cService = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setSeleDate(upDate);
		//kw.setSeleFlightId(Integer.valueOf(flightId));
		kw.setFlyTime(flyTime);
		//查看是否存在航班信息
		//当日航班信息列表
		List<OpOrdertickets> ol1 = cService.getBaFlightInfoList(kw);
		if(ol1== null ||  ol1.size() == 0){
			return 1;//当日无航班信息
		}
		boolean isHasFlight = false;
		int newFlightInfoId = 0;
		String flightInfoIds = "";
		for (OpOrdertickets flightInfo:ol1) {
			Integer curFlightId = flightInfo.getFlightId();
			flightInfoIds += ","+flightInfo.getId();
			if (flightId.equals(curFlightId)) {
				isHasFlight = true;
				newFlightInfoId = flightInfo.getId();
			}
		}
		if (!isHasFlight)
			return 1;//当日无航班信息
		flightInfoIds = flightInfoIds.substring(1);
		OpOrderticketsKeyword opOrderticketKw = new OpOrderticketsKeyword();
		opOrderticketKw.setId(Integer.valueOf(id));
		//查询原始订单信息
		OpOrdertickets orderInfo = cService.getOrderticketsList(opOrderticketKw).get(0);
		
		String certNo = orderInfo.getCertNo();
		String certType = orderInfo.getCertType();
		int orderNum = isAlreadyOrderTickets(flightInfoIds, certType, certNo);
		if(orderNum > 0){
			return 10;//该日已经有订票信息，确认改签日期
		}
		com.roc.syspe.entity.OpOrderticketsKeyword okw = new com.roc.syspe.entity.OpOrderticketsKeyword();
		okw.setTicketPointId(orderTicketPointId);
		okw.setSeleFlightInfos(flightInfoIds);//航班信息的id
		okw.setId(id);
		List<OpOrdertickets>  orderList= cService.groupTiecketCount(okw);
		OpOrdertickets countOrder = null;
		if(orderList!=null && orderList.size()>0){
			countOrder = orderList.get(0);
		}
		BaTicketsallocKeyword keyword = new BaTicketsallocKeyword();
		keyword.setFlightId(flightId);
		keyword.setOrderdate(upDate);
		keyword.setTicketpointId(orderTicketPointId);
		keyword.setOrdertime(flyTime);
		BaTicketsallocService ser = new BaTicketsallocService();
		List<BaTicketsalloc> bl = ser.getForSeleCountList(keyword);
		BaTicketsalloc bt = null;
		if(bl!=null && bl.size()>0){
			bt = bl.get(0);
		}else{
			return 2;//选择日期该票点没有票额分配
		}
		int bCount = bt.getAmount()-(bt.getLockednum()==null?0:bt.getLockednum())-(countOrder!=null &&countOrder.getCounts()!=null?countOrder.getCounts():0)-1;//看是不是负数，负数则不能改签
		if(bCount<0){
			return 3;//该票点票额不足
		}
		OpUseroper userOper = new OpUseroper();
		userOper.setOrderId(id);
		userOper.setUserId(userId);
		userOper.setType(5);//改签
		OpOrdertickets ordertickets = new OpOrdertickets();
		ordertickets.setId(id);
		ordertickets.setFlightinfoId(newFlightInfoId);
		ordertickets.setTicketpointId(orderTicketPointId);
		ordertickets.setStatus(status);
		ordertickets.setSeatNum("");
		boolean isGoOn = this.getOrderStatus(id, origStatus);
		if(!isGoOn){
			return 6;//状态已经改变
		}
		boolean b =cService.tgOpOrderticket(ordertickets, userOper);
		if(b)
			return 5;//改签成功
		else
			return 55;//改签失败
	}
	//--------------------------
	//退票/退订
	public boolean ticketsInforeturn(Integer id,Integer userId,Integer status) throws ParseException{
		ClienService service = new ClienService();
		OpOrdertickets order = new OpOrdertickets();
		order.setId(id);
		order.setStatus(String.valueOf(status));//退票
		OpUseroper useroper = new OpUseroper();
		useroper.setOrderId(id);
		useroper.setUserId(userId);
		useroper.setType(status);
		return service.tpOrtdOpOrderticket(order,useroper);
	}
	//--------------------------
	//退订
	public boolean ticketsInfoTuiding(Integer id,Integer userId) throws ParseException{
		ClienService service = new ClienService();
		OpOrdertickets order = new OpOrdertickets();
		order.setId(id);
		order.setStatus("8");//退订
		OpUseroper useroper = new OpUseroper();
		useroper.setOrderId(id);
		useroper.setUserId(userId);
		useroper.setType(8);
		return service.tpOrtdOpOrderticket(order,useroper);
	}
	//--------------------------
	//换登机牌
	public String djpOrXlqSave(Integer id,Integer userId,Integer type,String seatNum,String gate,String gateTime,Integer luggSum,Double weightSum,String flightinfoIds,String flightNo,String flightDate,String vipText,String flightTo,String name,String certNo,String origStatus) throws ParseException{
		ClienService service = new ClienService();
		if(seatNum!=null && seatNum.trim().length()>0){
			OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
			kw.setId(id);
			kw.setSeatNum(seatNum.trim());
			
			kw.setSeleFlightInfos(flightinfoIds);
			if(service.isHasSeat(kw)>=1){
				return "0";
			}
		}
		OpOrdertickets order = new OpOrdertickets();
		order.setId(id);
		order.setStatus(String.valueOf(type));//退订
		order.setSeatNum(seatNum);
		order.setGate(gate);
		order.setGateTime(gateTime);
		order.setWeightSum(weightSum);
		order.setLuggSum(luggSum);
		OpUseroper useroper = new OpUseroper();
		useroper.setOrderId(id);
		useroper.setUserId(userId);
		useroper.setType(type);
		if(!this.getOrderStatus(id, origStatus)){
			return "5";//登机牌状态与元状态不匹配
		}
		String startAddress = ArgsUnit.getStartAddress();
		ArgsUnit.setGateDeafult(gate);
		return service.updateForDjp(order,useroper)?flightNo+"^"+flightDate+"^"+vipText+"^"+seatNum+"^"+flightTo+"^"+(startAddress.contains("北京")?"北京南郊":startAddress)+"^"+gate+"^"+gateTime+"^"+name+"^"+certNo:"1";
		
	}
	//换登机牌团队
	public String djpOrXlqSaveTeam(String ids,Integer userId,Integer type,String seatNums,String gate,String gateTime,Integer luggSum,Double weightSum,String flightinfoIds,String origStatus) throws ParseException{
		ClienService service = new ClienService();
		String[] seatArray = seatNums.split(",");
		String[]idArray = ids.split(",");
		
		if(seatArray.length>0)
			for(int i = 0; i < seatArray.length; i++)
				if(seatArray[i]!=null && seatArray[i].trim().length()>0){
					OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
					kw.setId(0);//此处为团队去重复，
					kw.setSeatNum(seatArray[i].trim());
					kw.setIds(ids);
					kw.setSeleFlightInfos(flightinfoIds);
					if(service.isHasSeat(kw)>=1){
						return "0";
					}
				}
		List<OpOrdertickets> orderList = new ArrayList<OpOrdertickets>();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		OpOrdertickets ol1 = null;
		int k = 0;
		String returnSeatArray ="";
		for(int i =0;i <idArray.length;i++){
			
			kw.setId(Integer.valueOf(idArray[i]));
			ol1 =  service.getOrderticketsList(kw).get(0);
			if(!this.getOrderStatus(Integer.valueOf(idArray[i]), origStatus)){
				return "5";//登机牌状态与元状态不匹配
			}
			OpOrdertickets order = new OpOrdertickets();
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
			order.setStatus(String.valueOf(type));			
			order.setGate(gate);
			order.setGateTime(gateTime);
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
		OpUseroper useroper = new OpUseroper();		
		useroper.setUserId(userId);
		useroper.setType(type);
		boolean b= service.updateForDjpTeam(orderList, null, useroper);
		ArgsUnit.setGateDeafult(gate);
		return b?returnSeatArray:"1";
		
	}
	
	//--------------------------
	//出行李签的保存信息方法
	public String xlqSave(Integer id,Integer userId,Integer type,String seatNum,String gate,String gateTime,Integer luggSum,Double weightSum,String flightinfoIds,String flightTo,String workerNo,String flightno,String flydate,String name,Integer prinNum) throws ParseException{
		ClienService service = new ClienService();
		if(seatNum!=null && seatNum.trim().length()>0){
			OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
			kw.setId(id);
			kw.setSeatNum(seatNum.trim());
			
			kw.setSeleFlightInfos(flightinfoIds);
			if(service.isHasSeat(kw)>=1){
				return "0";
			}
		}
		OpOrdertickets order = new OpOrdertickets();
		order.setId(id);
		order.setStatus(String.valueOf(type));//退订
		order.setSeatNum(seatNum!=null?seatNum.trim():seatNum);
		order.setGate(gate);
		order.setGateTime(gateTime);
		order.setWeightSum(weightSum);
		order.setLuggSum(luggSum);
		OpUseroper useroper = new OpUseroper();
		useroper.setOrderId(id);
		useroper.setUserId(userId);
		useroper.setType(5);
		boolean b = service.updateForDjp(order,null);
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
	//出行李签团队
	public String xlqSaveTeam(String ids,Integer userId,Integer type,String seatNums,String gate,String gateTime,Integer luggSum,Double weightSum,String flightinfoIds,String origStatus,Integer prinNum) throws ParseException{
		ClienService service =  SingleInstanceClientSer.getClientService().getService();
		String[] seatArray = seatNums.split(",");
		String[]idArray = ids.split(",");
		
		if(seatArray.length>0)
			for(int i = 0; i < seatArray.length; i++)
				if(seatArray[i]!=null && seatArray[i].trim().length()>0){
					OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
					kw.setId(0);//此处为团队去重复，
					kw.setSeatNum(seatArray[i].trim());
					kw.setIds(ids);
					kw.setSeleFlightInfos(flightinfoIds);
					if(service.isHasSeat(kw)>=1){
						return "0";
					}
				}
		List<OpOrdertickets> orderList = new ArrayList<OpOrdertickets>();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		OpOrdertickets ol1 = null;
		int k = 0;
		String returnSeatArray ="";
		for(int i =0;i <idArray.length;i++){
			
			kw.setId(Integer.valueOf(idArray[i]));
			ol1 =  service.getOrderticketsList(kw).get(0);
			OpOrdertickets order = new OpOrdertickets();
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
			order.setStatus(String.valueOf(type));			
			order.setGate(gate);
			order.setGateTime(gateTime);
			order.setWeightSum(weightSum);
			order.setLuggSum(luggSum);			
			
			orderList.add(order);
		}
		OpUseroper useroper = new OpUseroper();		
		useroper.setUserId(userId);
		useroper.setType(type);
		boolean b= service.updateForDjpTeam(orderList, null, useroper);
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
	//--------------------------
	//批量跟新航班号
	public boolean bentchUpdateFlightNo(String flightinfoIds,String flightNo) throws ParseException{
		String[] fIds = flightinfoIds.split(",");
		ClienService service = new ClienService();
		OpOrdertickets op = new OpOrdertickets();
		boolean isSucess = false;
		for (String flightinfoId:fIds) {
		    op.setFlightinfoId(Integer.valueOf(flightinfoId));
		    op.setFlightNo(flightNo);
		    isSucess = service.bentchUpFlightNo(op);
		}
	    return isSucess;
	}
	public int printTickets(Integer id,String opername){
		ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setId(id);
		List <OpOrdertickets> o = service.getOrderticketsList(kw);
		OpOrdertickets order =  o==null||o.size()==0?null:service.getOrderticketsList(kw).get(0);
		
		if(order != null){
			FlightService s = new FlightService();
			BaTicketpriceKeyword k = new BaTicketpriceKeyword();
			k.setId(order.getPriceId());
			if(order.getPriceId()!=null){
				List<BaTicketprice> l1 = s.queryBaTicketpriceList(k);
				order.setTicketprice(l1!=null&&l1.size()>0?l1.get(0).getRealAmount():0);				
			}else{
				order.setTicketprice(0D);
			}	
			try{
				ExcelUtil.proceed(order,opername);
				return 1;
			}catch(Exception e){
				e.printStackTrace();
				return 0;
			}
		}else{
			
			return 0;
		}
	}
	public  int validate(Integer flightId,String flightinfoIds,
			String orderdate,Integer ticketpointId,String flyTime,
			String certType,String certNo){
		BlacklistUserService servcie = new BlacklistUserService();
		BlackUserKeyword keyword = new BlackUserKeyword();
		keyword.setCertType(certType);
		keyword.setIdcard(certNo);
		BlacklistUser bLUser = servcie.getUserBlacklistInfoByIdCardAndCertType(keyword);
		if (bLUser != null && bLUser.getIdcard()!= null) {
			return 4;
		}
		int isOrder = isAlreadyOrderTickets(flightinfoIds, certType, certNo);
		if(isOrder > 0){
			return 3;//该用户已经订过票
		}
		int ticketCount = isHasTickets(flightId, flightinfoIds, orderdate, ticketpointId, flyTime);
		if(!(ticketCount>0)){
			return 2;//票点票额已经不足，请核查			
		}
		return 1;//正常可以保存订票信息
	}
	//查看售票点是否有票额 或  当日是否有此人已经订售票或出登机牌
	private static int isHasTickets(Integer flightId,String flightinfoIds,String orderdate,Integer ticketpointId,String flyTime){
		ClienService cService = new ClienService();
		com.roc.syspe.entity.OpOrderticketsKeyword okw = new com.roc.syspe.entity.OpOrderticketsKeyword();
		okw.setTicketPointId(ticketpointId);
		okw.setSeleFlightInfos(flightinfoIds);//航班信息的id
		
		List<OpOrdertickets>  orderList= cService.groupTiecketCount(okw);
		OpOrdertickets countOrder = null;
		if(orderList!=null && orderList.size()>0){
			countOrder = orderList.get(0);
		}
		BaTicketsallocKeyword keyword = new BaTicketsallocKeyword();
		keyword.setFlightId(flightId);
		keyword.setOrderdate(orderdate);
		keyword.setTicketpointId(ticketpointId);
		keyword.setOrdertime(flyTime);
		BaTicketsallocService ser = new BaTicketsallocService();
		List<BaTicketsalloc> bl = ser.getForSeleCountList(keyword);
		BaTicketsalloc bt = null;		
		if(bl!=null && bl.size()>0){
			bt = bl.get(0);
		}else{
			return 0;//选择日期该票点没有票额分配
		}
		int bCount = bt.getAmount()-(bt.getLockednum()==null?0:bt.getLockednum())-(countOrder!=null &&countOrder.getCounts()!=null?countOrder.getCounts():0)-1;//看是不是负数，负数则不能改签
		if(bCount<0){
			return 0;//该票点票额不足
		}
		return 1;
		
	}
	private static Integer isAlreadyOrderTickets(String flightinfoIds,String certType,String certNo){
		ClienService cService = new ClienService();
		com.roc.syspe.entity.OpOrderticketsKeyword okw = new com.roc.syspe.entity.OpOrderticketsKeyword();
		okw.setCertNo(certNo);
		okw.setCertType(certType);
		okw.setSeleFlightInfos(flightinfoIds);
		Integer count = cService.authInfoIsHas(okw);
		return count;
		
	}
	/**
	 * 获得订票信息的状态防止误操作
	 * @param id
	 * @return
	 */
	public boolean getOrderStatus(Integer id,String status){
		ClienService service =  SingleInstanceClientSer.getClientService().getService();
		StringBuffer nowStatus = new  StringBuffer("");
		nowStatus.append(service.getOrderStatus(id));
		boolean b = false;
		if(nowStatus!=null&&nowStatus.toString().equals(status)){
			b = true;	
		}
        return b;
    }
	
	public String printUpdate(Integer id,String bagNum){
		ClienService service =  SingleInstanceClientSer.getClientService().getService();
		OpOrdertickets opOrdertickets = new OpOrdertickets();
		opOrdertickets.setId(id);
		OpOrdertickets bagNumOb = service.orderticketsBagNum(opOrdertickets);
		
		opOrdertickets.setBagNum((bagNumOb.getBagNum()==null||bagNumOb.getBagNum().trim().equals("")?bagNum:(bagNumOb.getBagNum().trim()+";"+bagNum)));
		service.updateBagnum(opOrdertickets);
		return "1";
	}
	public String printUpdateTeam(String ids,String bagNum){
		ClienService service =  SingleInstanceClientSer.getClientService().getService();
		for(int i = 0; i< ids.split(",").length;i++){
			OpOrdertickets opOrdertickets = new OpOrdertickets();
			opOrdertickets.setId(Integer.valueOf(ids.split(",")[i]));
			OpOrdertickets bagNumOb = service.orderticketsBagNum(opOrdertickets);
			
			opOrdertickets.setBagNum((bagNumOb.getBagNum()==null||bagNumOb.getBagNum().trim().equals("")?bagNum:(bagNumOb.getBagNum().trim()+";"+bagNum)));
			service.updateBagnum(opOrdertickets);
		}
		return "1";
	}
	//--------------------------
	//团队改签
	public int teamDateUpdate(String ids,Integer flightIds,Integer orderTicketPointId,Integer userId,String upDate,String flyTime,String origStatus) throws ParseException{
		
//		ClienService cService = new ClienService();
//		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
//		kw.setSeleDate(upDate);
//		kw.setSeleFlightId(Integer.valueOf(flightId));
//		kw.setFlyTime(flyTime);
//		//查看是否存在航班信息
//		OpOrdertickets order = new OpOrdertickets();
//		List<OpOrdertickets> ol1 = cService.getBaFlightInfoList(kw);
//		if(ol1!=null && ol1.size()>0){
//			order = ol1.get(0);
//		}else{
//			return 1;//当日无航班信息
//		}
//		com.roc.syspe.entity.OpOrderticketsKeyword okw = new com.roc.syspe.entity.OpOrderticketsKeyword();
//		okw.setTicketPointId(orderTicketPointId);
//		okw.setSeleFlightInfo(order.getId());//航班信息的id
//		okw.setId(id);
//		List<OpOrdertickets>  orderList= cService.groupTiecketCount(okw);
//		OpOrdertickets countOrder = null;
//		if(orderList!=null && orderList.size()>0){
//			countOrder = orderList.get(0);
//		}
//		BaTicketsallocKeyword keyword = new BaTicketsallocKeyword();
//		keyword.setFlightId(flightId);
//		keyword.setOrderdate(upDate);
//		keyword.setTicketpointId(orderTicketPointId);
//		keyword.setOrdertime(flyTime);
//		BaTicketsallocService ser = new BaTicketsallocService();
//		List<BaTicketsalloc> bl = ser.getForSeleCountList(keyword);
//		BaTicketsalloc bt = null;
//		if(bl!=null && bl.size()>0){
//			bt = bl.get(0);
//		}else{
//			return 2;//选择日期该票点没有票额分配
//		}
//		int bCount = bt.getAmount()-(bt.getLockednum()==null?0:bt.getLockednum())-(countOrder!=null &&countOrder.getCounts()!=null?countOrder.getCounts():0)-1;//看是不是负数，负数则不能改签
//		if(bCount<0){
//			return 3;//该票点票额不足
//		}
//		OpUseroper userOper = new OpUseroper();
//		userOper.setOrderId(id);
//		userOper.setUserId(userId);
//		userOper.setType(5);//改签
//		OpOrdertickets ordertickets = new OpOrdertickets();
//		ordertickets.setId(id);
//		ordertickets.setFlightinfoId(order.getId());
//		ordertickets.setTicketpointId(orderTicketPointId);
//		ordertickets.setStatus(status);
//		ordertickets.setSeatNum("");
//		boolean isGoOn = this.getOrderStatus(id, origStatus);
//		if(!isGoOn){
//			return 6;//状态已经改变
//		}
//		boolean b =cService.tgOpOrderticket(ordertickets, userOper);
//		if(b)
//			return 5;//改签成功
//		else
//			return 55;//改签失败
		return 0;
	}
	public boolean updatePassword(Integer userId,String newPassoword){
		UserService service = new UserService();
		User user = new User();
		user.setUserid(userId);
		user.setPassword(newPassoword);		
		return service.changeUserPwd(user);
	}
	/**验证用户身份是否可以进行换登/售票机牌**/
	public String getOrderIdAndType(String flightInfoIds,String certNo,int status) {
		ClienService service = new ClienService();
		OpOrdertickets ticket = service.getOrderInfoByParams(flightInfoIds,certNo,status);
		String orderIdAndTeamFlag = null;
		
		if (ticket != null && ticket.getId() != null) {
			String teamName = ticket.getTeamName();
			int flightInfoId = ticket.getFlightinfoId();
			orderIdAndTeamFlag = ticket.getId()+";"+(ticket.getTeamflag() == null?"0":ticket.getTeamflag())
					+";"+ticket.getStatus()+";"+flightInfoId+";"+teamName;
		}
		
		return orderIdAndTeamFlag;
	}
}
