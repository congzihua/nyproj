/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.founder.enp.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.alibaba.fastjson.JSON;
import com.flyticket.system.util.ArgsUnit;
import com.roc.enp.entity.OpUseroper;
import com.roc.sysmanager.base.service.ClienService;
import com.roc.syspe.entity.OpOrdertickets;
import com.roc.syspe.entity.OpOrderticketsKeyword;

import sun.security.provider.certpath.CollectionCertStore;

/**
 * MyEclipse Struts Creation date: 07-20-2009
 * 
 * XDoclet definition:
 * 
 * @struts.action
 */
public class DocAction extends DispatchAction {
	//通过身份证获得当日航班的信息列表
	public ActionForward getUserFlightInfos(ActionMapping mapping, ActionForm form,
					HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
			String idCard =  request.getParameter("idcard");
			PrintWriter out = response.getWriter();
			List<OpOrdertickets> ol  = new ArrayList<>();
			if (StringUtils.isEmpty(idCard)) {
				out.print(JSON.toJSONString(ol));
				return null;
			}
			ClienService service = new ClienService();
			OpOrderticketsKeyword keyWord = new OpOrderticketsKeyword();
			
			keyWord.setCertNo(idCard);
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			keyWord.setStartDate(format.format(new Date()));
			ol = service.teamDjpListByIdCard(keyWord);
			ol = ol == null ?new ArrayList():ol;
			String json = JSON.toJSONString(ol);
			out.print(json);
			return null;
	}
	
	//换登机牌-如果未选择座位则进行座位选择，并返回最新的数据
	public ActionForward toQueryPrintInfoById(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		List<OpOrdertickets> ol  = new ArrayList<>();
		ClienService service = new ClienService();
		String idsParam = request.getParameter("ids");
		PrintWriter out = response.getWriter();
		if (StringUtils.isEmpty(idsParam)) {
			log.error("id is null or none numeric");
			out.print(JSON.toJSONString(ol));
			return null;
		}
		
		OpOrderticketsKeyword keyWord = new OpOrderticketsKeyword();
		
		keyWord.setIds(idsParam);
		ol = service.teamDjpListByIdCard(keyWord);
		ol = ol == null ?new ArrayList():ol;
		
		if (ol.size()  == 0) {
			out.print("");
			return null;
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		SimpleDateFormat formatHourMinute = new SimpleDateFormat("HH:mm");
		for (OpOrdertickets order:ol) {
			if (StringUtils.isNotEmpty(order.getSeatNum())) {
				//already has seat,none need chose.
				continue;
			}
			Date flightDate = order.getFlightDate();
			String orderdate = format.format(flightDate);
			String flyTime = order.getFlyTime();
			OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
			kw.setSeleDate(orderdate);
			kw.setFlyTime(flyTime);
			//查看是否存在航班信息
			List<OpOrdertickets> ol1 = service.getBaFlightInfoList(kw);
			List<String> flightIds = new ArrayList<String>();;
			ol1.forEach(o -> {
				flightIds.add(o.getFlightinfoId()+"");
			});
			String seleFlightInfos = StringUtils.join(flightIds, ",");
			kw = new OpOrderticketsKeyword();
			kw.setSeleFlightInfos(seleFlightInfos);
			List<String> seats = service.getFlightSeats(kw);
			seats  = seats == null?new ArrayList<String>():seats;
			order.setStatus("3");
			order.setSeatNum(getSeatNum(seats));
			order.setGate(ArgsUnit.gateDeafult());
			Date flyDate = null;
			try {
				flyDate = format2.parse(orderdate+" "+flyTime);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			Calendar cal = Calendar.getInstance();
			cal.setTime(flyDate);
			cal.add(Calendar.MINUTE, -30);
			order.setGateTime(formatHourMinute.format(cal.getTime()));
			service.updateForDjp(order,null);
		}
		
		String json = JSON.toJSONString(ol);
		out.print(json);
		return null;
	}
	private String getSeatNum (List<String> seats) {
		if (seats == null)
			seats = new ArrayList<>();
		int k = 5;
		for(int i = 5;i < 18;i++){
			k++;
			String seatNumA = k+"A";
			if (!seats.contains(seatNumA)) {
				return seatNumA;
			}
			String seatNumB = k+"B";
			if (!seats.contains(seatNumB)) {
				return seatNumB;
			}
			String seatNumC = k+"C";
			if (!seats.contains(seatNumC)) {
				return seatNumC;
			}
			//9D不能选 是安保座位
			
			String seatNumD = k+"D";
			if (!seatNumD.equals("9D") && !seats.contains(seatNumD)) {
				return seatNumD;
			}
			String seatNumE = k+"E";
			if (!seats.contains(seatNumE)) {
				return seatNumE;
			}
			String seatNumF = k+"F";
			if (!seats.contains(seatNumF)) {
				return seatNumF;
			}
		}
		return null;
	}
	
}