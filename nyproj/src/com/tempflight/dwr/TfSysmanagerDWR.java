package com.tempflight.dwr;

import java.text.ParseException;

import com.roc.enp.entity.OpUseroper;
import com.roc.sysmanager.base.service.ClienService;
import com.roc.syspe.entity.OpOrdertickets;
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
}
