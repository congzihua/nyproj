package com.roc.sysmanager.base.action;

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

public class CommandCenter extends DispatchAction{

	public ActionForward toMainPage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String flightDate =request.getParameter("orderdate");
		request.setAttribute("odate", flightDate);
		List<FlightInfo> fiList=new FlightInfoService().queryByFlightDate(flightDate);
		if(fiList==null||fiList.size()==0){
			request.setAttribute("message", "1");
			return mapping.findForward("noFlightData");
		}
		Set<String> flyTimes = new HashSet<String>();
		for (FlightInfo fInfo : fiList) {//按照时间进行分组
			flyTimes.add(fInfo.getFly_time());
		}
		request.setAttribute("howMany", flyTimes.size());
		return mapping.findForward("mainPage");
		
	}
	
	public ActionForward toMainPageContain0(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		int shouPiao=0;
		int huanPai=0;
		int safeCheckSum = 0;
		int jinCang=0;
		int jianShu=0;
		int zongZhong=0;
		HashMap<String, Object> frameMap=new HashMap<String, Object>();
		String flightDate =request.getParameter("orderdate");
		request.setAttribute("odate", flightDate);
		List<FlightInfo> fiList=new FlightInfoService().queryByFlightDate(flightDate);
		FlightInfo fi = fiList.get(0);
		String ft = fi.getFly_time();
		String flightInfoIds = "";
		for (FlightInfo fInfo : fiList) {
			if (fInfo.getFly_time().equalsIgnoreCase(ft)) {
				flightInfoIds += ","+fInfo.getId();
			}
		}
		flightInfoIds = flightInfoIds.substring(1);
		List<OpOrdertickets> pplist=new ClienService().queryByFlightInfoId(flightInfoIds);
		Iterator<OpOrdertickets> iter1=pplist.iterator();
		Set<String> teamSet = new HashSet<String>();
		while (iter1.hasNext()) {
			OpOrdertickets opo = (OpOrdertickets) iter1.next();
			boolean isTeam = opo.getTeamflag()!= null && opo.getTeamflag().equals("1");
			if("2".equals(opo.getStatus())){
				shouPiao +=1;
			}else if("3".equals(opo.getStatus())){
				huanPai+=1;
			}else if ("4".equals(opo.getStatus())) {
				safeCheckSum +=1;
			}else if ("7".equals(opo.getStatus())) {
				jinCang+=1;
			}
		   
		    int luggNum = opo.getLuggSum()==null?0:opo.getLuggSum();
		    String v = opo.getTeamName()+"-"+luggNum;
		    if (isTeam && teamSet.contains(v)) {
		    	continue;
		    }
		    if (isTeam) {
		    	teamSet.add(v);
		    }
			jianShu+= luggNum;
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
		request.setAttribute("action", "0");
		return mapping.findForward("mainPageContain");
	}
	
	public ActionForward toMainPageContain00(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		int shouPiao=0;
		int huanPai=0;
		int jinCang=0;
		int jianShu=0;
		int zongZhong=0;
		HashMap<String, Object> frameMap=new HashMap<String, Object>();
		String flightDate =request.getParameter("orderdate");
		request.setAttribute("odate", flightDate);
		List<FlightInfo> fiList=new FlightInfoService().queryByFlightDate(flightDate);
		String flightInfoIds = getFlightIds(fiList, 1);
		List<OpOrdertickets> pplist=new ClienService().queryByFlightInfoId(flightInfoIds);
		Iterator<OpOrdertickets> iter1=pplist.iterator();
		while (iter1.hasNext()) {
			OpOrdertickets opo = (OpOrdertickets) iter1.next();
			jianShu+=opo.getLuggSum()==null?0:opo.getLuggSum();
			zongZhong+=opo.getWeightSum()==null?0:opo.getWeightSum();
			if("2".equals(opo.getStatus())){
				shouPiao+=1;
			}else if("3".equals(opo.getStatus())){
				huanPai+=1;
			}else if ("4".equals(opo.getStatus())) {
				jinCang+=1;
			}
		}
		frameMap.put("shouPiao", shouPiao);
		frameMap.put("huanPai", huanPai);
		frameMap.put("jinCang", jinCang);
		frameMap.put("jianShu", jianShu);
		frameMap.put("zongZhong", zongZhong);
		List<OpOrdertickets> mplist=new ArrayList<OpOrdertickets>();
		Iterator<OpOrdertickets> iter2=pplist.iterator();
		while (iter2.hasNext()) {
			OpOrdertickets ele = (OpOrdertickets) iter2.next();
			if("2".equals(ele.getStatus())){
				mplist.add(ele);
			}
		}
		frameMap.put("pplist", mplist);
		request.setAttribute("frameMap", frameMap);
		request.setAttribute("action", "1");
		return mapping.findForward("mainPageContain");
	}
	
	public ActionForward toMainPageContain01(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		int shouPiao=0;
		int huanPai=0;
		int jinCang=0;
		int jianShu=0;
		int zongZhong=0;
		HashMap<String, Object> frameMap=new HashMap<String, Object>();
		String flightDate =request.getParameter("orderdate");
		request.setAttribute("odate", flightDate);
		List<FlightInfo> fiList=new FlightInfoService().queryByFlightDate(flightDate);
		String flightInfoIds = getFlightIds(fiList, 1);
		List<OpOrdertickets> pplist=new ClienService().queryByFlightInfoId(flightInfoIds);
		Iterator<OpOrdertickets> iter1=pplist.iterator();
		Set<String> teamSet = new HashSet<String>();
		while (iter1.hasNext()) {
			OpOrdertickets opo = (OpOrdertickets) iter1.next();
			jianShu+=opo.getLuggSum()==null?0:opo.getLuggSum();
			zongZhong+=opo.getWeightSum()==null?0:opo.getWeightSum();
			if("2".equals(opo.getStatus())){
				shouPiao+=1;
			}else if("3".equals(opo.getStatus())){
				huanPai+=1;
			}else if ("4".equals(opo.getStatus())) {
				jinCang+=1;
			}
		}
		frameMap.put("shouPiao", shouPiao);
		frameMap.put("huanPai", huanPai);
		frameMap.put("jinCang", jinCang);
		frameMap.put("jianShu", jianShu);
		frameMap.put("zongZhong", zongZhong);
		List<OpOrdertickets> mplist=new ArrayList<OpOrdertickets>();
		Iterator<OpOrdertickets> iter2=pplist.iterator();
		while (iter2.hasNext()) {
			OpOrdertickets ele = (OpOrdertickets) iter2.next();
			if("3".equals(ele.getStatus())){
				mplist.add(ele);
			}
		}
		frameMap.put("pplist", mplist);
		request.setAttribute("frameMap", frameMap);
		request.setAttribute("action", "2");
		return mapping.findForward("mainPageContain");
	}
	
	public ActionForward toMainPageContain02(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		int shouPiao=0;
		int huanPai=0;
		int jinCang=0;
		int jianShu=0;
		int zongZhong=0;
		HashMap<String, Object> frameMap=new HashMap<String, Object>();
		String flightDate =request.getParameter("orderdate");
		request.setAttribute("odate", flightDate);
		List<FlightInfo> fiList=new FlightInfoService().queryByFlightDate(flightDate);
		String flightInfoIds = getFlightIds(fiList, 1);
		List<OpOrdertickets> pplist=new ClienService().queryByFlightInfoId(flightInfoIds);
		Iterator<OpOrdertickets> iter1=pplist.iterator();
		while (iter1.hasNext()) {
			OpOrdertickets opo = (OpOrdertickets) iter1.next();
			jianShu+=opo.getLuggSum()==null?0:opo.getLuggSum();
			zongZhong+=opo.getWeightSum()==null?0:opo.getWeightSum();
			if("2".equals(opo.getStatus())){
				shouPiao+=1;
			}else if("3".equals(opo.getStatus())){
				huanPai+=1;
			}else if ("4".equals(opo.getStatus())) {
				jinCang+=1;
			}
		}
		frameMap.put("shouPiao", shouPiao);
		frameMap.put("huanPai", huanPai);
		frameMap.put("jinCang", jinCang);
		frameMap.put("jianShu", jianShu);
		frameMap.put("zongZhong", zongZhong);
		List<OpOrdertickets> mplist=new ArrayList<OpOrdertickets>();
		Iterator<OpOrdertickets> iter2=pplist.iterator();
		while (iter2.hasNext()) {
			OpOrdertickets ele = (OpOrdertickets) iter2.next();
			if("4".equals(ele.getStatus())){
				mplist.add(ele);
			}
		}
		frameMap.put("pplist", mplist);
		request.setAttribute("frameMap", frameMap);
		request.setAttribute("action", "3");
		return mapping.findForward("mainPageContain");
	}
	
	public ActionForward toMainPageContain1(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		int shouPiao=0;
		int huanPai=0;
		int safeCheckSum = 0;
		int jinCang=0;
		int jianShu=0;
		int zongZhong=0;
//		List<HashMap<String, Object>> frameList=new ArrayList<HashMap<String,Object>>();
		HashMap<String, Object> frameMap=new HashMap<String, Object>();
		String flightDate =request.getParameter("orderdate");
		request.setAttribute("odate", flightDate);
		List<FlightInfo> fiList=new FlightInfoService().queryByFlightDate(flightDate);
		
		String flightInfoIds = getFlightIds(fiList, 2);
		List<OpOrdertickets> pplist=new ClienService().queryByFlightInfoId(flightInfoIds);
		Iterator<OpOrdertickets> iter1=pplist.iterator();
		while (iter1.hasNext()) {
			OpOrdertickets opo = (OpOrdertickets) iter1.next();
			jianShu+=opo.getLuggSum()==null?0:opo.getLuggSum();
			zongZhong+=opo.getWeightSum()==null?0:opo.getWeightSum();
			if("2".equals(opo.getStatus())){
				shouPiao +=1;
			}else if("3".equals(opo.getStatus())){
				huanPai+=1;
			}else if ("4".equals(opo.getStatus())) {
				safeCheckSum +=1;
			}else if ("7".equals(opo.getStatus())) {
				jinCang+=1;
			}
		}
		frameMap.put("shouPiao", shouPiao);
		frameMap.put("huanPai", huanPai);
		frameMap.put("jinCang", jinCang);
		frameMap.put("jianShu", jianShu);
		frameMap.put("zongZhong", zongZhong);
		frameMap.put("safeCheckSum", safeCheckSum);
		frameMap.put("pplist", pplist);
		request.setAttribute("frameMap", frameMap);
		request.setAttribute("action", "1");
		return mapping.findForward("mainPageContain");
	}
	
	public ActionForward toMainPageContain10(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		int shouPiao=0;
		int huanPai=0;
		int jinCang=0;
		int jianShu=0;
		int zongZhong=0;
		HashMap<String, Object> frameMap=new HashMap<String, Object>();
		String flightDate =request.getParameter("orderdate");
		request.setAttribute("odate", flightDate);
		List<FlightInfo> fiList=new FlightInfoService().queryByFlightDate(flightDate);
		String flightInfoIds = getFlightIds(fiList, 2);
		List<OpOrdertickets> pplist=new ClienService().queryByFlightInfoId(flightInfoIds);
		Iterator<OpOrdertickets> iter1=pplist.iterator();
		while (iter1.hasNext()) {
			OpOrdertickets opo = (OpOrdertickets) iter1.next();
			jianShu+=opo.getLuggSum()==null?0:opo.getLuggSum();
			zongZhong+=opo.getWeightSum()==null?0:opo.getWeightSum();
			if("2".equals(opo.getStatus())){
				shouPiao+=1;
			}else if("3".equals(opo.getStatus())){
				huanPai+=1;
			}else if ("4".equals(opo.getStatus())) {
				jinCang+=1;
			}
		}
		frameMap.put("shouPiao", shouPiao);
		frameMap.put("huanPai", huanPai);
		frameMap.put("jinCang", jinCang);
		frameMap.put("jianShu", jianShu);
		frameMap.put("zongZhong", zongZhong);
		List<OpOrdertickets> mplist=new ArrayList<OpOrdertickets>();
		Iterator<OpOrdertickets> iter2=pplist.iterator();
		while (iter2.hasNext()) {
			OpOrdertickets ele = (OpOrdertickets) iter2.next();
			if("2".equals(ele.getStatus())){
				mplist.add(ele);
			}
		}
		frameMap.put("pplist", mplist);
		request.setAttribute("frameMap", frameMap);
		request.setAttribute("action", "1");
	
		return mapping.findForward("mainPageContain1");
	}
	
	public ActionForward toMainPageContain11(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		int shouPiao=0;
		int huanPai=0;
		int jinCang=0;
		int jianShu=0;
		int zongZhong=0;
		HashMap<String, Object> frameMap=new HashMap<String, Object>();
		String flightDate =request.getParameter("orderdate");
		request.setAttribute("odate", flightDate);
		List<FlightInfo> fiList=new FlightInfoService().queryByFlightDate(flightDate);
		String flightInfoIds = getFlightIds(fiList, 2);
		List<OpOrdertickets> pplist=new ClienService().queryByFlightInfoId(flightInfoIds);
		Iterator<OpOrdertickets> iter1=pplist.iterator();
		while (iter1.hasNext()) {
			OpOrdertickets opo = (OpOrdertickets) iter1.next();
			jianShu+=opo.getLuggSum()==null?0:opo.getLuggSum();
			zongZhong+=opo.getWeightSum()==null?0:opo.getWeightSum();
			if("2".equals(opo.getStatus())){
				shouPiao+=1;
			}else if("3".equals(opo.getStatus())){
				huanPai+=1;
			}else if ("4".equals(opo.getStatus())) {
				jinCang+=1;
			}
		}
		frameMap.put("shouPiao", shouPiao);
		frameMap.put("huanPai", huanPai);
		frameMap.put("jinCang", jinCang);
		frameMap.put("jianShu", jianShu);
		frameMap.put("zongZhong", zongZhong);
		List<OpOrdertickets> mplist=new ArrayList<OpOrdertickets>();
		Iterator<OpOrdertickets> iter2=pplist.iterator();
		while (iter2.hasNext()) {
			OpOrdertickets ele = (OpOrdertickets) iter2.next();
			if("3".equals(ele.getStatus())){
				mplist.add(ele);
			}
		}
		frameMap.put("pplist", mplist);
		request.setAttribute("frameMap", frameMap);
		request.setAttribute("action", "2");
	
		return mapping.findForward("mainPageContain1");
	}
	
	public ActionForward toMainPageContain12(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		int shouPiao=0;
		int huanPai=0;
		int jinCang=0;
		int jianShu=0;
		int zongZhong=0;
		HashMap<String, Object> frameMap=new HashMap<String, Object>();
		String flightDate =request.getParameter("orderdate");
		request.setAttribute("odate", flightDate);
		List<FlightInfo> fiList=new FlightInfoService().queryByFlightDate(flightDate);
		String flightInfoIds = getFlightIds(fiList, 2);
		List<OpOrdertickets> pplist=new ClienService().queryByFlightInfoId(flightInfoIds);
		Iterator<OpOrdertickets> iter1=pplist.iterator();
		while (iter1.hasNext()) {
			OpOrdertickets opo = (OpOrdertickets) iter1.next();
			jianShu+=opo.getLuggSum()==null?0:opo.getLuggSum();
			zongZhong+=opo.getWeightSum()==null?0:opo.getWeightSum();
			if("2".equals(opo.getStatus())){
				shouPiao+=1;
			}else if("3".equals(opo.getStatus())){
				huanPai+=1;
			}else if ("4".equals(opo.getStatus())) {
				jinCang+=1;
			}
		}
		frameMap.put("shouPiao", shouPiao);
		frameMap.put("huanPai", huanPai);
		frameMap.put("jinCang", jinCang);
		frameMap.put("jianShu", jianShu);
		frameMap.put("zongZhong", zongZhong);
		List<OpOrdertickets> mplist=new ArrayList<OpOrdertickets>();
		Iterator<OpOrdertickets> iter2=pplist.iterator();
		while (iter2.hasNext()) {
			OpOrdertickets ele = (OpOrdertickets) iter2.next();
			if("4".equals(ele.getStatus())){
				mplist.add(ele);
			}
		}
		frameMap.put("pplist", mplist);
		request.setAttribute("frameMap", frameMap);
		request.setAttribute("action", "3");
	
		return mapping.findForward("mainPageContain1");
	}
	
	public ActionForward toMainPageContain2(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		int shouPiao=0;
		int huanPai=0;
		int safeCheckSum = 0;
		int jinCang=0;
		int jianShu=0;
		int zongZhong=0;
//		List<HashMap<String, Object>> frameList=new ArrayList<HashMap<String,Object>>();
		HashMap<String, Object> frameMap=new HashMap<String, Object>();
		String flightDate =request.getParameter("orderdate");
		request.setAttribute("odate", flightDate);
		List<FlightInfo> fiList=new FlightInfoService().queryByFlightDate(flightDate);
		String flightInfoIds = getFlightIds(fiList, 3);
		List<OpOrdertickets> pplist=new ClienService().queryByFlightInfoId(flightInfoIds);
		Iterator<OpOrdertickets> iter1=pplist.iterator();
		while (iter1.hasNext()) {
			OpOrdertickets opo = (OpOrdertickets) iter1.next();
			jianShu+=opo.getLuggSum()==null?0:opo.getLuggSum();
			zongZhong+=opo.getWeightSum()==null?0:opo.getWeightSum();
			if("2".equals(opo.getStatus())){
				shouPiao +=1;
			}else if("3".equals(opo.getStatus())){
				huanPai+=1;
			}else if ("4".equals(opo.getStatus())) {
				safeCheckSum +=1;
			}else if ("7".equals(opo.getStatus())) {
				jinCang+=1;
			}
		}
		frameMap.put("shouPiao", shouPiao);
		frameMap.put("huanPai", huanPai);
		frameMap.put("jinCang", jinCang);
		frameMap.put("jianShu", jianShu);
		frameMap.put("zongZhong", zongZhong);
		frameMap.put("safeCheckSum", safeCheckSum);
		frameMap.put("pplist", pplist);
		request.setAttribute("frameMap", frameMap);
		request.setAttribute("action", "2");
		return mapping.findForward("mainPageContain");
//		}
	}
	private String getFlightIds(List<FlightInfo> fiList,int postion) {
		String flightInfoIds = "";
		Set<String> flTime = new HashSet<>();
		for (FlightInfo fInfo : fiList) {
			flTime.add(fInfo.getFly_time());
			if (flTime.size() == postion) {
				flightInfoIds += ","+fInfo.getId();
			}
		}
		flightInfoIds = flightInfoIds.substring(1);
		
		return flightInfoIds;
	}
	public ActionForward toMainPageContain20(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		int shouPiao=0;
		int huanPai=0;
		int jinCang=0;
		int jianShu=0;
		int zongZhong=0;
		HashMap<String, Object> frameMap=new HashMap<String, Object>();
		String flightDate =request.getParameter("orderdate");
		request.setAttribute("odate", flightDate);
		List<FlightInfo> fiList=new FlightInfoService().queryByFlightDate(flightDate);
		String flightInfoIds = getFlightIds(fiList, 3);
		List<OpOrdertickets> pplist=new ClienService().queryByFlightInfoId(flightInfoIds);
		Iterator<OpOrdertickets> iter1=pplist.iterator();
		while (iter1.hasNext()) {
			OpOrdertickets opo = (OpOrdertickets) iter1.next();
			jianShu+=opo.getLuggSum()==null?0:opo.getLuggSum();
			zongZhong+=opo.getWeightSum()==null?0:opo.getWeightSum();
			if("2".equals(opo.getStatus())){
				shouPiao+=1;
			}else if("3".equals(opo.getStatus())){
				huanPai+=1;
			}else if ("4".equals(opo.getStatus())) {
				jinCang+=1;
			}
		}
		frameMap.put("shouPiao", shouPiao);
		frameMap.put("huanPai", huanPai);
		frameMap.put("jinCang", jinCang);
		frameMap.put("jianShu", jianShu);
		frameMap.put("zongZhong", zongZhong);
		List<OpOrdertickets> mplist=new ArrayList<OpOrdertickets>();
		Iterator<OpOrdertickets> iter2=pplist.iterator();
		while (iter2.hasNext()) {
			OpOrdertickets ele = (OpOrdertickets) iter2.next();
			if("2".equals(ele.getStatus())){
				mplist.add(ele);
			}
		}
		frameMap.put("pplist", mplist);
		request.setAttribute("frameMap", frameMap);
		request.setAttribute("action", "1");
	
		return mapping.findForward("mainPageContain2");
	}
	
	public ActionForward toMainPageContain21(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		int shouPiao=0;
		int huanPai=0;
		int jinCang=0;
		int jianShu=0;
		int zongZhong=0;
		HashMap<String, Object> frameMap=new HashMap<String, Object>();
		String flightDate =request.getParameter("orderdate");
		request.setAttribute("odate", flightDate);
		List<FlightInfo> fiList=new FlightInfoService().queryByFlightDate(flightDate);
		String flightInfoIds = getFlightIds(fiList, 3);
		List<OpOrdertickets> pplist=new ClienService().queryByFlightInfoId(flightInfoIds);
		Iterator<OpOrdertickets> iter1=pplist.iterator();
		while (iter1.hasNext()) {
			OpOrdertickets opo = (OpOrdertickets) iter1.next();
			jianShu+=opo.getLuggSum()==null?0:opo.getLuggSum();
			zongZhong+=opo.getWeightSum()==null?0:opo.getWeightSum();
			if("2".equals(opo.getStatus())){
				shouPiao+=1;
			}else if("3".equals(opo.getStatus())){
				huanPai+=1;
			}else if ("4".equals(opo.getStatus())) {
				jinCang+=1;
			}
		}
		frameMap.put("shouPiao", shouPiao);
		frameMap.put("huanPai", huanPai);
		frameMap.put("jinCang", jinCang);
		frameMap.put("jianShu", jianShu);
		frameMap.put("zongZhong", zongZhong);
		List<OpOrdertickets> mplist=new ArrayList<OpOrdertickets>();
		Iterator<OpOrdertickets> iter2=pplist.iterator();
		while (iter2.hasNext()) {
			OpOrdertickets ele = (OpOrdertickets) iter2.next();
			if("3".equals(ele.getStatus())){
				mplist.add(ele);
			}
		}
		frameMap.put("pplist", mplist);
		request.setAttribute("frameMap", frameMap);
		request.setAttribute("action", "2");
	
		return mapping.findForward("mainPageContain2");
	}
	
	public ActionForward toMainPageContain22(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		int shouPiao=0;
		int huanPai=0;
		int jinCang=0;
		int jianShu=0;
		int zongZhong=0;
		HashMap<String, Object> frameMap=new HashMap<String, Object>();
		String flightDate =request.getParameter("orderdate");
		request.setAttribute("odate", flightDate);
		List<FlightInfo> fiList=new FlightInfoService().queryByFlightDate(flightDate);
		String flightInfoIds = getFlightIds(fiList, 3);
		List<OpOrdertickets> pplist=new ClienService().queryByFlightInfoId(flightInfoIds);
		Iterator<OpOrdertickets> iter1=pplist.iterator();
		while (iter1.hasNext()) {
			OpOrdertickets opo = (OpOrdertickets) iter1.next();
			jianShu+=opo.getLuggSum()==null?0:opo.getLuggSum();
			zongZhong+=opo.getWeightSum()==null?0:opo.getWeightSum();
			if("2".equals(opo.getStatus())){
				shouPiao+=1;
			}else if("3".equals(opo.getStatus())){
				huanPai+=1;
			}else if ("4".equals(opo.getStatus())) {
				jinCang+=1;
			}
		}
		frameMap.put("shouPiao", shouPiao);
		frameMap.put("huanPai", huanPai);
		frameMap.put("jinCang", jinCang);
		frameMap.put("jianShu", jianShu);
		frameMap.put("zongZhong", zongZhong);
		List<OpOrdertickets> mplist=new ArrayList<OpOrdertickets>();
		Iterator<OpOrdertickets> iter2=pplist.iterator();
		while (iter2.hasNext()) {
			OpOrdertickets ele = (OpOrdertickets) iter2.next();
			if("4".equals(ele.getStatus())){
				mplist.add(ele);
			}
		}
		frameMap.put("pplist", mplist);
		request.setAttribute("frameMap", frameMap);
		request.setAttribute("action", "3");
	
		return mapping.findForward("mainPageContain2");
	}
	
}
