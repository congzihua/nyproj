package com.tempflight.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.roc.enp.entity.FlightInfo;
import com.roc.sysmanager.base.service.ClienService;
import com.roc.sysmanager.base.service.FlightInfoService;
import com.roc.syspe.entity.OpOrdertickets;
import com.tempflight.entity.TempFlightinfo;
import com.tempflight.entity.TempOrdertickets;
import com.tempflight.entity.TempOrderticketsKeyword;
import com.tempflight.service.TempClienService;

public class TfCommandCenter extends DispatchAction{

	public ActionForward toMainPage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String flightDate =request.getParameter("orderdate");
		request.setAttribute("odate", flightDate);
		TempClienService service = new TempClienService();
		//查看是否存在航班信息
		List<TempFlightinfo> flightInfos = service.tempFlightInfoListByDate(flightDate);
		if(flightInfos ==null || flightInfos.size() == 0){
			request.setAttribute("message", "1");
			return mapping.findForward("noFlightData");
		}
		Set<String> flyTimes = new HashSet<String>();
		for (TempFlightinfo fInfo : flightInfos) {//按照时间进行分组
			flyTimes.add(fInfo.getFlyTime());
		}
		request.setAttribute("howMany", flyTimes.size());
		request.setAttribute("flightInfos", flightInfos);
		return mapping.findForward("mainPage");
		
	}
	
	public ActionForward toMainPageContain(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		int shouPiao=0;
		int huanPai=0;
		int safeCheckSum = 0;
		int jinCang=0;
		int jianShu=0;
		int zongZhong=0;
		HashMap<String, Object> frameMap=new HashMap<String, Object>();
		String flightinfoId =request.getParameter("flightinfoId");
		request.setAttribute("flightinfoId", flightinfoId);
		TempClienService service = new TempClienService();
		//查看是否存在航班信息
		TempFlightinfo fi = service.tempFlightInfoById(Integer.valueOf(flightinfoId));
		List<TempOrdertickets> pplist=service.queryTempOrdertickets(fi.getId());
		Iterator<TempOrdertickets> iter1= pplist.iterator();
		Set<String> teamSet = new HashSet<String>();
		while (iter1.hasNext()) {
			TempOrdertickets opo = (TempOrdertickets) iter1.next();
			
			if("2".equals(opo.getStatus())){
				shouPiao +=1;
			}else if("3".equals(opo.getStatus())){
				huanPai+=1;
			}else if ("4".equals(opo.getStatus())) {
				safeCheckSum +=1;
			}else if ("7".equals(opo.getStatus())) {
				jinCang+=1;
			}
			boolean isTeam = opo.getTeamflag()!= null && opo.getTeamflag().equals("1");
			int luggNum = opo.getLuggSum()==null?0:opo.getLuggSum();
			String v = opo.getTeamName()+"-"+luggNum;
			if (isTeam && teamSet.contains(v)) {
		    	continue;
		    }
		    if (isTeam) {
		    	teamSet.add(v);
		    }
		    jianShu+=opo.getLuggSum()==null?0:opo.getLuggSum();
			zongZhong+=opo.getWeightSum()==null?0:opo.getWeightSum();
		}
		frameMap.put("shouPiao", shouPiao);
		frameMap.put("huanPai", huanPai);
		frameMap.put("jinCang", jinCang);
		frameMap.put("jianShu", jianShu);
		frameMap.put("zongZhong", zongZhong);
		frameMap.put("safeCheckSum", safeCheckSum);
		frameMap.put("pplist", pplist);
		request.setAttribute("frameMap", frameMap);
		request.setAttribute("flightinfo", fi);
		request.setAttribute("action", request.getParameter("posNum"));
		return mapping.findForward("mainPageContain");
	}
}
